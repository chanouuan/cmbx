<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

/**
 * 保险模型
 */
class Baoxian extends BaseModel
{
    /**
     * 获取用户车辆信息和去年投保信息
     */
    public function getReinfo ($post) {

        $post['LicenseNo'] = var_exists($post, 'LicenseNo');
        if (!is_car_license($post['LicenseNo'])) {
            return error('车牌号错误');
        }
        $post['CityCode'] = $this->getCityId('贵阳');

        // 读取缓存
        $cache = DB::table('userinfo')->where([
            ['citycode', '=', $post['CityCode']],
            ['licenseno', '=', $post['LicenseNo']]
        ])->first();
        if ($cache) {
            $cache->userinfo = json_decode($cache->userinfo, true);
            $cache->savequote = json_decode($cache->savequote, true);
            // 缓存未过期
            if ($cache->updated_at > $_SERVER['REQUEST_TIME'] - 60) {
                return success([
                    'UserInfo' => $cache->userinfo,
                    'SaveQuote' => $cache->savequote
                ]);
            }
        }

        $result = $this->buildRequest('http://iu.91bihu.com/api/CarInsurance/getreinfo', [
            'Group' => 1,
            'LicenseNo' => $post['LicenseNo'],
            'CityCode' => $post['CityCode']
        ]);
        if ($result['errNo'] !== 0) {
            // 获取失败，使用缓存
            if ($cache) {
                return success([
                    'UserInfo' => $cache->userinfo,
                    'SaveQuote' => $cache->savequote
                ]);
            }
            return $result;
        }
        $result = $result['result'];

        $data = [
            'UserInfo' => [],
            'SaveQuote' => []
        ];

        // 1: 获取续保信息成功（车辆信息+险种）
        // 2: 失败，需要完善行驶证信息（车辆信息+险种都没有获取到）
        // 3: 失败，获取用户车辆信息成功(车架号，发动机号，品牌型号，初登日期可以取到)，获取险种失败

        if ($result['BusinessStatus'] == 1 || $result['BusinessStatus'] == 3) {
            $data['UserInfo'] = $this->getreinfoUserinfo($result['UserInfo']);
        }
        if ($result['BusinessStatus'] == 1) {
            $data['SaveQuote'] = $this->getreinfoSavequote($result['SaveQuote']);
        }
        unset($result);

        // 缓存结果
        if ($cache) {
            DB::table('userinfo')
                ->where('id', $cache->id)
                ->update([
                    'userinfo' => json_unicode_encode($data['UserInfo']),
                    'savequote' => json_unicode_encode($data['SaveQuote']),
                    'updated_at' => $_SERVER['REQUEST_TIME']
                ]);
        } else {
            DB::table('userinfo')->insert([
                    'licenseno' => $post['LicenseNo'],
                    'citycode' => $post['CityCode'],
                    'userinfo' => json_unicode_encode($data['UserInfo']),
                    'savequote' => json_unicode_encode($data['SaveQuote']),
                    'updated_at' => $_SERVER['REQUEST_TIME'],
                    'create_time' => $_SERVER['REQUEST_TIME']
                ]);
        }

        return success($data);
    }

    /**
     * 请求报价/核保信息
     */
    public function postPrecisePrice ($post) {

        // 投保城市
        $post['CityCode'] = $this->getCityId('贵阳');

        // 车牌号
        $post['LicenseNo'] = var_exists($post, 'LicenseNo');

        // 获取保司
        $company = $this->getAgentNewSource($post);
        if ($company['errNo'] !== 0) {
            return $company;
        }
        $QuoteGroup = array_sum(array_keys($company['result'])); // 报价保司

        // 获取用户车辆信息
        $info = $this->getReinfo($post);
        if ($info['errNo'] !== 0) {
            return $info;
        }
        $info = $info['result'];

        // 投保种类 0:单商业 1:商业+交强 2:单交强
        $post['ForceTax'] = intval(var_exists($post, 'ForceTax'));

        // 车主信息
        $post['CarOwnersName'] = var_exists($post, 'CarOwnersName');
        $post['OwnerIdCardType'] = var_exists($post, 'OwnerIdCardType');
        $post['IdCard'] = var_exists($post, 'IdCard');
        if (!$info['UserInfo']) {
            if (!$post['CarOwnersName'] || !$post['OwnerIdCardType'] || !$post['IdCard']) {
                return error('请填写车主信息');
            }
        }

        // 如果续保的时候 ，能够成功获取车辆信息，在请求报价的时候 ，就不需要再传入这几个参数了，否则需要填写这四个信息
        $post['EngineNo'] = var_exists($post, 'EngineNo');
        $post['CarVin'] = var_exists($post, 'CarVin');
        $post['ModleName'] = var_exists($post, 'ModleName');
        $post['RegisterDate'] = var_exists($post, 'RegisterDate');
        if ($post['RegisterDate']) {
            $post['RegisterDate'] = strtotime($post['RegisterDate']) ? $post['RegisterDate'] : '';
        }
        if (!$info['UserInfo']) {
            if (!$post['EngineNo'] || !$post['CarVin'] || !$post['RegisterDate'] || !$post['ModleName']) {
                return error('请填写行驶证信息');
            }
        }

        // 如果只交商业险，要判断上年的交强险是否过期
        if ($post['ForceTax'] == 0) {
            if (!$info['SaveQuote']) {
                return error('你尚未购买过交强险');
            }
            if ($info['UserInfo'] && $info['UserInfo']['ForceExpireDate']) {
                if ($_SERVER['REQUEST_TIME'] > strtotime($info['UserInfo']['ForceExpireDate'])) {
                    return error('你上年交强险已过期');
                }
            }
        }

        // 是否可以续保
        if ($info['UserInfo']) {
            if (!$this->isContinuedPeriods($post['CityCode'], $post['ForceTax'], $info['UserInfo']['ForceExpireDate'], $info['UserInfo']['BusinessExpireDate'])) {
                return error('你不在续保期内');
            }
        }

        // 交强险起保时间，明日起
        $post['ForceTimeStamp'] = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y'));
        // 商业险起保时间，明日起
        $post['BizTimeStamp'] = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y'));

        $data = [
            'QuoteGroup' => $QuoteGroup, // 需要报价的 保险资源的枚举值之和
            'SubmitGroup' => $QuoteGroup, // 需要核保的 保险资源的枚举值之和（这个范围应该是QuoteGroup的子集，必须报价了，才可以核保）
            'CityCode' => $post['CityCode'],
            'LicenseNo' => $post['LicenseNo'],
            'EngineNo' => var_exists($post, 'EngineNo'), // 发动机号
            'CarVin' => var_exists($post, 'CarVin'), // 车架号
            'RegisterDate' => var_exists($post, 'RegisterDate'), // 注册日期
            'MoldName' => var_exists($post, 'ModleName'), // 品牌型号 注意这里 ModleName 与 MoldName 名称不一样
            'ForceTax' => $post['ForceTax'], // 0:单商业，1：商业+交强车船，2：单交强+车船
            'ForceTimeStamp' => var_exists($post, 'ForceTimeStamp', 0), // 交强险起保时间（Unix时间戳格式）单位是秒
            'BizTimeStamp' => var_exists($post, 'BizTimeStamp', 0), // 商业险起保时间（Unix时间戳格式）单位是秒（如果在单商业的情况下 ，此字段必须有值）
            'BoLi' => var_exists($post, 'BoLi', 0), // 玻璃单独破碎险，0-不投保，1国产，2进口
            'BuJiMianCheSun' => var_exists($post, 'BuJiMianCheSun', 0), // 不计免赔险(车损)，0-不投保，1投保
            'BuJiMianDaoQiang' => var_exists($post, 'BuJiMianDaoQiang', 0), // 不计免赔险(盗抢) ，0-不投保，1投保
            'BuJiMianSanZhe' => var_exists($post, 'BuJiMianSanZhe', 0), // 不计免赔险(三者) ，0-不投保，1投保
            'BuJiMianChengKe' => var_exists($post, 'BuJiMianChengKe', 0), // 不计免乘客0-不投保，1投保
            'BuJiMianSiJi' => var_exists($post, 'BuJiMianSiJi', 0), // 不计免司机0-不投保，1投保
            'BuJiMianHuaHen' => var_exists($post, 'BuJiMianHuaHen', 0), // 不计免划痕0-不投保，1投保
            'BuJiMianSheShui' => var_exists($post, 'BuJiMianSheShui', 0), // 不计免涉水0-不投保，1投保
            'BuJiMianZiRan' => var_exists($post, 'BuJiMianZiRan', 0), // 不计免自燃0-不投保，1投保
            'BuJiMianJingShenSunShi' => var_exists($post, 'BuJiMianJingShenSunShi', 0), // 不计免精神损失0-不投保，1投保
            'SheShui' => var_exists($post, 'SheShui', 0), // 涉水行驶损失险，0-不投保，1投保
            'HuaHen' => var_exists($post, 'HuaHen', 0), // 车身划痕损失险，0-不投保，>0投保(具体金额)
            'SiJi' => var_exists($post, 'SiJi', 0), // 车上人员责任险(司机) ，0-不投保，>0投保(具体金额）
            'ChengKe' => var_exists($post, 'ChengKe', 0), // 车上人员责任险(乘客) ，0-不投保，>0投保(具体金额)
            'CheSun' => var_exists($post, 'CheSun', 0), // 机动车损失保险，0-不投保，1-投保
            'DaoQiang' => var_exists($post, 'DaoQiang', 0), // 全车盗抢保险，0-不投保，1-投保
            'SanZhe' => var_exists($post, 'SanZhe', 0), // 第三者责任保险，0-不投保，>0投保(具体金额)
            'ZiRan' => var_exists($post, 'ZiRan', 0), // 自燃损失险，0-不投保，1投保
            'HcJingShenSunShi' => var_exists($post, 'HcJingShenSunShi', 0), // 精神损失抚慰金责任险（0:不投，>0：保额）（前提是三者，司机，乘客至少有一个投保，保额支持自定义）
            'HcSanFangTeYue' => var_exists($post, 'HcSanFangTeYue', 0), // 机动车损失保险无法找到第三方特约险（0:不投，1：投保）(前提必须上车损险)
            'SheBeiSunShi' => var_exists($post, 'SheBeiSunShi', 0), // 设备损失险 1：投保 0:不投保
            'BjmSheBeiSunShi' => var_exists($post, 'BjmSheBeiSunShi', 0), // 不计免设备损失险 1：投保 0:不投保

            'IsNewCar' => var_exists($post, 'IsNewCar', 2), // 是否新车（1：新车  2：旧车（默认）；）
            'CarType' => var_exists($post, 'CarType'), // 车辆类型
            'CarUsedType' => var_exists($post, 'CarUsedType'), // 使用性质
            'SeatCount' => var_exists($post, 'SeatCount'), // 核定载客量
            'TonCount' => var_exists($post, 'TonCount'), // 核定载质量
            'TransferDate' => var_exists($post, 'TransferDate'), // 过户车日期（yyyy-mm-dd）
            'PurchasePrice' => var_exists($post, 'PurchasePrice'), // 购置价格
            'NegotiatePrice' => var_exists($post, 'NegotiatePrice'), // 协商价格
            'AutoMoldCode' => var_exists($post, 'AutoMoldCode'), // 精友编码
            'ExhaustScale' => var_exists($post, 'ExhaustScale'), // 排气量
            'AutoMoldCodeSource' => var_exists($post, 'AutoMoldCodeSource'), // 按照车型类型报价:1.续保车型2自定义车型. 3.最低配置车型
            'BizShortEndDate' => var_exists($post, 'BizShortEndDate'), // 商业险截止日期 时间戳格式，范围： 小于一年.
            'Fybc' => var_exists($post, 'Fybc'), // 修理期间每天的补偿费用（100,200,300）元
            'FybcDays' => var_exists($post, 'FybcDays'), // 修理期间补偿天数 0-90（含）天

            'CarOwnersName' => var_exists($post, 'CarOwnersName'), // 车主姓名
            'OwnerIdCardType' => var_exists($post, 'OwnerIdCardType'), // 车主证件类型
            'IdCard' => var_exists($post, 'IdCard'), // 车主证件号
            'Email' => var_exists($post, 'Email'), // 车主邮箱
            'OwnerSex' => var_exists($post, 'OwnerSex'), // 车主性别 1男 2女
            'OwnerAuthority' => var_exists($post, 'OwnerAuthority'), // 车主证件签发机关
            'OwnerNation' => var_exists($post, 'OwnerNation'), // 车主民族
            'OwnerBirthday' => var_exists($post, 'OwnerBirthday'), // 车主生日 格式为：xxxx-xx-xx

            'InsuredName' => var_exists($post, 'InsuredName'), // 被保险人姓名
            'InsuredIdCard' => var_exists($post, 'InsuredIdCard'), // 被保险人证件号
            'InsuredIdType' => var_exists($post, 'InsuredIdType'), // 被保险人证件类型
            'InsuredMobile' => var_exists($post, 'InsuredMobile'), // 被保险人手机号
            'InsuredEmail' => var_exists($post, 'InsuredEmail'), // 被保人邮箱
            'InsuredAddress' => var_exists($post, 'InsuredAddress'), // 被保险人地址
            'InsuredCertiStartdate' => var_exists($post, 'InsuredCertiStartdate'), // 被保险人身份证有效期起期（yyyy-mm-dd北京平安必填）
            'InsuredCertiEnddate' => var_exists($post, 'InsuredCertiEnddate'), // 被保险人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）
            'InsuredSex' => var_exists($post, 'InsuredSex'), // 被保险人性别（身份证采集用）1男2女
            'InsuredAuthority' => var_exists($post, 'InsuredAuthority'), // 被保险人证件签发机关（身份证采集用）
            'InsuredNation' => var_exists($post, 'InsuredNation'), // 被保险人民族
            'InsuredBirthday' => var_exists($post, 'InsuredBirthday'), // 被保险人生日（身份证采集用）格式为：xxxx-xx-xx

            'HolderIdCard' => var_exists($post, 'HolderIdCard'), // 投保人证件号
            'HolderName' => var_exists($post, 'HolderName'), // 投保人姓名
            'HolderIdType' => var_exists($post, 'HolderIdType'), // 投保人证件类型（类型同被保人）
            'HolderMobile' => var_exists($post, 'HolderMobile'), // 投保人手机号
            'HolderEmail' => var_exists($post, 'HolderEmail'), // 投保人邮箱
            'HolderAddress' => var_exists($post, 'HolderAddress'), // 投保人地址
            'HolderCertiStartdate' => var_exists($post, 'HolderCertiStartdate'), // 投保人身份证有效期起期（yyyy-mm-dd北京平安必填）
            'HolderCertiEnddate' => var_exists($post, 'HolderCertiEnddate'), // 投保人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）
            'HolderSex' => var_exists($post, 'HolderSex'), // 投保人性别（身份证采集用）1男2女
            'HolderAuthority' => var_exists($post, 'HolderAuthority'), // 投保人证件签发机关
            'HolderNation' => var_exists($post, 'HolderNation'), // 投保人民族
            'HolderBirthday' => var_exists($post, 'HolderBirthday') // 投保人生日（身份证采集用）格式为：xxxx-xx-xx
        ];
        // 过滤空数据
        $data = array_filter($data, 'strlen');

        $result = $this->buildRequest('http://iu.91bihu.com/api/CarInsurance/PostPrecisePrice', $data);
        if ($result['errNo'] === 0) {
            // 记录投保信息
            DB::table('userinfo')
                ->where([
                    ['citycode', '=', $post['CityCode']],
                    ['licenseno', '=', $post['LicenseNo']]
                ])
                ->update([
                    'postprecise' => json_unicode_encode($data, '[]'),
                    'preciseprice' => '[]',
                    'stockinfo' => '[]'
                ]);
            // 报价成功，返回保司给客户端，客户端根据保司遍历报价
            $result['result'] = $company['result'];
        }

        return $result;
    }

    /**
     * 获取车辆报价信息
     */
    public function getPrecisePrice ($post) {

        $post['LicenseNo'] = var_exists($post, 'LicenseNo');
        if (!is_car_license($post['LicenseNo'])) {
            return error('车牌号错误');
        }

        $post['CityCode'] = $this->getCityId('贵阳');

        // 获取保司
        $company = $this->getAgentNewSource($post);
        if ($company['errNo'] !== 0) {
            return $company;
        }
        $company = $company['result'];

        $post['Source'] = var_exists($post, 'Source');

        if ($post['Source']) {
            if (isset($company[$post['Source']])) {
                return error('该城市没有配置对应的投保公司');
            }
        }

        // 默认获取所有保司
        $post['Source'] = $post['Source'] ? [$post['Source']] : array_keys($company);

        // 获取所有保司信息
        $companyList = $this->getCompanyList();
        if ($companyList['errNo'] !== 0) {
            return $companyList;
        }
        $companyList = $companyList['result'];
        $companyList = array_column($companyList, null, 'id');

        // 每次只能获取一家保司的报价信息
        $info = [];
        foreach ($post['Source'] as $k => $v) {
            $info[$v] = [
                'Tel' => isset($companyList[$v]) ? $companyList[$v]->tel : '',
                'Logo' => isset($companyList[$v]) ? $companyList[$v]->logo : '',
                'Company' => $company[$v],
                'Msg' => '未知错误',
                'UserInfo' => [],
                'Item' => []
            ];
            $result = $this->buildRequest('http://iu.91bihu.com/api/CarInsurance/GetPrecisePrice', [
                'LicenseNo' => $post['LicenseNo'],
                'QuoteGroup' => $v, // 意向投保公司（单个的枚举值）
                'ShowEndDate' => 1 // 是否展示报价截止时间
            ], 2);
            if ($result['errNo'] !== 0) {
                $info[$v]['Msg'] = $result['message'];
                continue;
            }
            $result = $result['result'];
            if ($result['Item']['QuoteStatus'] == -1) {
                $info[$v]['Msg'] = '未报价';
            } else if ($result['Item']['QuoteStatus'] == 0) {
                $info[$v]['Msg'] = '报价失败';
            } else if ($result['Item']['QuoteStatus'] > 0) {
                $info[$v]['Msg'] = '报价成功';
            }
            $info[$v]['UserInfo'] = [
                'InsuredName' => $result['UserInfo']['InsuredName'],
                'InsuredIdCard' => $result['UserInfo']['InsuredIdCard'],
                'InsuredIdType' => $result['UserInfo']['InsuredIdType'],
                'InsuredMobile' => $result['UserInfo']['InsuredMobile'],
                'HolderName' => $result['UserInfo']['HolderName'],
                'HolderIdCard' => $result['UserInfo']['HolderIdCard'],
                'HolderIdType' => $result['UserInfo']['HolderIdType'],
                'HolderMobile' => $result['UserInfo']['HolderMobile'],
                'ForceEndDate' => var_exists($result['UserInfo'], 'ForceEndDate'), // 交强险截止日期
                'BusinessEndDate' => var_exists($result['UserInfo'], 'BusinessEndDate') // 商业险截止日期
            ];
            $info[$v]['Item'] = [
                'BizTotal' => $result['Item']['BizTotal'], // 商业险总额
                'ForceTotal' => $result['Item']['ForceTotal'], // 交强险总额(90天之外的取不到，值为0)
                'TaxTotal' => $result['Item']['TaxTotal'], // 车船税总额(90天之外的取不到，值为0)
                'QuoteStatus' => $result['Item']['QuoteStatus'], // 报价状态，-1=未报价， 0=报价失败，>0报价成功
                'QuoteResult' => $result['Item']['QuoteResult'] // 报价信息
            ];
        }
        unset($companyList);

        // 记录报价信息
        $userinfo = DB::table('userinfo')->where([
            ['citycode', '=', $post['CityCode']],
            ['licenseno', '=', $post['LicenseNo']]
        ])->first([
            'preciseprice'
        ]);
        $userinfo->preciseprice = json_decode($userinfo->preciseprice, true);
        $userinfo->preciseprice = array_merge($userinfo->preciseprice, $info); // 合并查询结果
        DB::table('userinfo')
            ->where([
                ['citycode', '=', $post['CityCode']],
                ['licenseno', '=', $post['LicenseNo']]
            ])
            ->update([
                'preciseprice' => json_mysql_encode($userinfo->preciseprice)
            ]);

        return success($info);
    }

    /**
     * 提交个人补充信息
     */
    public function postStockInfo ($post) {

        $post['LicenseNo'] = var_exists($post, 'LicenseNo');
        if (!is_car_license($post['LicenseNo'])) {
            return error('车牌号错误');
        }

        $post['CityCode'] = $this->getCityId('贵阳');

        $data = [
            'CarOwnersName' => var_exists($post, 'CarOwnersName'), // 车主姓名
            'OwnerIdCardType' => var_exists($post, 'OwnerIdCardType'), // 车主证件类型
            'IdCard' => var_exists($post, 'IdCard'), // 车主证件号
            'OwnerAddress' => var_exists($post, 'OwnerAddress'), // 车主联系地址

            'InsuredToOwner' => var_exists($post, 'InsuredToOwner', 0), // 被保险人是否同车主 0否 1是
            'InsuredPeople' => var_exists($post, 'InsuredPeople', 1), // 被保人类型 1个人 2团体
            'InsuredName' => var_exists($post, 'InsuredName'), // 被保险人姓名
            'InsuredIdCard' => var_exists($post, 'InsuredIdCard'), // 被保险人证件号
            'InsuredIdType' => var_exists($post, 'InsuredIdType'), // 被保险人证件类型
            'InsuredMobile' => var_exists($post, 'InsuredMobile'), // 被保险人手机号

            'HolderToOwner' => var_exists($post, 'HolderToOwner', 0), // 投保人是否同车主 0否 1是
            'HolderToInsured' => var_exists($post, 'HolderToInsured', 0), // 投保人是否同被保人 0否 1是
            'HolderPeople' => var_exists($post, 'HolderPeople', 1), // 投保人类型 1个人 2团体
            'HolderName' => var_exists($post, 'HolderName'), // 投保人姓名
            'HolderIdCard' => var_exists($post, 'HolderIdCard'), // 投保人证件号
            'HolderIdType' => var_exists($post, 'HolderIdType'), // 投保人证件类型
            'HolderMobile' => var_exists($post, 'HolderMobile'), // 投保人手机号

            'MailAddress' => var_exists($post, 'MailAddress'), // 保单邮寄地址
            'ElectronicAddress' => var_exists($post, 'ElectronicAddress') // 电子保单地址
        ];

        // 记录补充信息
        if (!DB::table('userinfo')
            ->where([
                ['citycode', '=', $post['CityCode']],
                ['licenseno', '=', $post['LicenseNo']]
            ])
            ->update([
                'stockinfo' => json_unicode_encode($data, '[]'),
                'updated_at' => $_SERVER['REQUEST_TIME']
            ])) {
            return error('操作失败');
        }

        return success('OK');
    }

    /**
     * 获取车辆核保信息
     */
    public function getSubmitInfo ($post) {
        $result = $this->buildRequest('http://iu.91bihu.com/api/CarInsurance/GetSubmitInfo', [
            'LicenseNo' => '贵A12345',
            'QuoteGroup' => 4 // 核保的保险公司的枚举值（单个枚举）
        ]);
        if ($result['errNo'] !== 0) {
            return $result;
        }
        print_r($result);
    }

    /**
     * 获取车辆出险信息
     */
    public function getCreditDetailInfo ($post) {
        $result = $this->buildRequest('http://iu.91bihu.com/api/claim/GetCreditDetailInfo', [
            'LicenseNo' => '贵A12345'
        ]);
        if ($result['errNo'] !== 0) {
            return $result;
        }
        print_r($result);
    }

    /**
     * 创建订单，选择保司后，生成订单
     * @param uid 车秘用户ID
     * @param pay 支付金额
     * @param deduct 抵扣金额
     * @param payway 支付方式
     * @return int
     */
    public function createOrder ($post) {

        $post['uid'] = intval(var_exists($post, 'uid')); // 车秘用户ID
        $post['pay'] = intval(var_exists($post, 'pay')); // 支付金额
        $post['deduct'] = intval(var_exists($post, 'deduct')); // 抵扣金额
        $post['payway'] = var_exists($post, 'payway'); // 支付方式

        if ($post['pay'] + $post['deduct'] <= 0) {
            return error('支付金额不能为空');
        }

        $post['LicenseNo'] = var_exists($post, 'LicenseNo'); // 车牌号
        if (!is_car_license($post['LicenseNo'])) {
            return error('车牌号错误');
        }

        $post['CityCode'] = $this->getCityId('贵阳');

        $post['Source'] = var_exists($post, 'Source'); // 保司
        $company = $this->getAgentNewSource($post);
        if ($company['errNo'] !== 0) {
            return $company;
        }
        $company = $company['result'];
        if (!isset($company[$post['Source']])) {
            return error('你所选的保险公司未开通');
        }

        // 获取车辆信息
        if (!$info = DB::table('userinfo')
            ->where([
                ['citycode', '=', $post['CityCode']],
                ['licenseno', '=', $post['LicenseNo']]
            ])
            ->first([
                'id','postprecise','preciseprice','stockinfo'
            ])) {
            return error('该车辆信息不全');
        }

        $info->postprecise = $info->postprecise ? json_decode($info->postprecise, true) : []; // 投保
        $info->preciseprice = $info->preciseprice ? json_decode($info->preciseprice, true) : []; // 报价
        $info->stockinfo = $info->stockinfo ? json_decode($info->stockinfo, true) : []; // 补充信息

        if (empty($info->postprecise)) {
            return error('该车辆尚未投保');
        }
        if (empty($info->preciseprice)) {
            return error('该车辆尚未报价');
        }

        // 验证投保信息
        $detail = [
            'Source' => $post['Source'], // 保司
            'EngineNo' => var_exists($info->postprecise, 'EngineNo'), // 发动机号
            'CarVin' => var_exists($info->postprecise, 'CarVin'), // 车架号
            'RegisterDate' => var_exists($info->postprecise, 'RegisterDate'), // 注册日期
            'ModleName' => var_exists($info->postprecise, 'MoldName'), // 品牌型号
            'ForceTax' => var_exists($info->postprecise, 'ForceTax'), // 0:单商业，1：商业+交强车船，2：单交强+车船
            'ForceTimeStamp' => var_exists($info->postprecise, 'ForceTimeStamp', 0), // 交强险起保时间（Unix时间戳格式）单位是秒
            'BizTimeStamp' => var_exists($info->postprecise, 'BizTimeStamp', 0), // 商业险起保时间（Unix时间戳格式）单位是秒（如果在单商业的情况下 ，此字段必须有值）
            'BoLi' => var_exists($info->postprecise, 'BoLi', 0), // 玻璃单独破碎险，0-不投保，1国产，2进口
            'BuJiMianCheSun' => var_exists($info->postprecise, 'BuJiMianCheSun', 0), // 不计免赔险(车损)，0-不投保，1投保
            'BuJiMianDaoQiang' => var_exists($info->postprecise, 'BuJiMianDaoQiang', 0), // 不计免赔险(盗抢) ，0-不投保，1投保
            'BuJiMianSanZhe' => var_exists($info->postprecise, 'BuJiMianSanZhe', 0), // 不计免赔险(三者) ，0-不投保，1投保
            'BuJiMianChengKe' => var_exists($info->postprecise, 'BuJiMianChengKe', 0), // 不计免乘客0-不投保，1投保
            'BuJiMianSiJi' => var_exists($info->postprecise, 'BuJiMianSiJi', 0), // 不计免司机0-不投保，1投保
            'BuJiMianHuaHen' => var_exists($info->postprecise, 'BuJiMianHuaHen', 0), // 不计免划痕0-不投保，1投保
            'BuJiMianSheShui' => var_exists($info->postprecise, 'BuJiMianSheShui', 0), // 不计免涉水0-不投保，1投保
            'BuJiMianZiRan' => var_exists($info->postprecise, 'BuJiMianZiRan', 0), // 不计免自燃0-不投保，1投保
            'BuJiMianJingShenSunShi' => var_exists($info->postprecise, 'BuJiMianJingShenSunShi', 0), // 不计免精神损失0-不投保，1投保
            'SheShui' => var_exists($info->postprecise, 'SheShui', 0), // 涉水行驶损失险，0-不投保，1投保
            'HuaHen' => var_exists($info->postprecise, 'HuaHen', 0), // 车身划痕损失险，0-不投保，>0投保(具体金额)
            'SiJi' => var_exists($info->postprecise, 'SiJi', 0), // 车上人员责任险(司机) ，0-不投保，>0投保(具体金额）
            'ChengKe' => var_exists($info->postprecise, 'ChengKe', 0), // 车上人员责任险(乘客) ，0-不投保，>0投保(具体金额)
            'CheSun' => var_exists($info->postprecise, 'CheSun', 0), // 机动车损失保险，0-不投保，1-投保
            'DaoQiang' => var_exists($info->postprecise, 'DaoQiang', 0), // 全车盗抢保险，0-不投保，1-投保
            'SanZhe' => var_exists($info->postprecise, 'SanZhe', 0), // 第三者责任保险，0-不投保，>0投保(具体金额)
            'ZiRan' => var_exists($info->postprecise, 'ZiRan', 0), // 自燃损失险，0-不投保，1投保
            'SheBeiSunShi' => var_exists($info->postprecise, 'SheBeiSunShi', 0), // 设备损失险 1：投保 0:不投保
            'BjmSheBeiSunShi' => var_exists($info->postprecise, 'BjmSheBeiSunShi', 0), // 不计免设备损失险 1：投保 0:不投保

            'IsNewCar' => var_exists($info->postprecise, 'IsNewCar'), // 是否新车（1：新车  2：旧车（默认）；）
            'CarType' => var_exists($info->postprecise, 'CarType'), // 车辆类型
            'CarUsedType' => var_exists($info->postprecise, 'CarUsedType'), // 使用性质
            'SeatCount' => var_exists($info->postprecise, 'SeatCount'), // 核定载客量
            'TonCount' => var_exists($info->postprecise, 'TonCount'), // 核定载质量
            'TransferDate' => var_exists($info->postprecise, 'TransferDate'), // 过户车日期（yyyy-mm-dd）
            'PurchasePrice' => var_exists($info->postprecise, 'PurchasePrice'), // 购置价格
            'NegotiatePrice' => var_exists($info->postprecise, 'NegotiatePrice'), // 协商价格
            'AutoMoldCode' => var_exists($info->postprecise, 'AutoMoldCode'), // 精友编码
            'ExhaustScale' => var_exists($info->postprecise, 'ExhaustScale'), // 排气量

            'CarOwnersName' => var_exists($info->postprecise, 'CarOwnersName'), // 车主姓名
            'OwnerIdCardType' => var_exists($info->postprecise, 'OwnerIdCardType'), // 车主证件类型
            'IdCard' => var_exists($info->postprecise, 'IdCard'), // 车主证件号
            'Email' => var_exists($info->postprecise, 'Email'), // 车主邮箱
            'OwnerSex' => var_exists($info->postprecise, 'OwnerSex'), // 车主性别 1男 2女
            'OwnerAuthority' => var_exists($info->postprecise, 'OwnerAuthority'), // 车主证件签发机关
            'OwnerNation' => var_exists($info->postprecise, 'OwnerNation'), // 车主民族
            'OwnerBirthday' => var_exists($info->postprecise, 'OwnerBirthday'), // 车主生日 格式为：xxxx-xx-xx

            'InsuredName' => var_exists($info->postprecise, 'InsuredName'), // 被保险人姓名
            'InsuredIdCard' => var_exists($info->postprecise, 'InsuredIdCard'), // 被保险人证件号
            'InsuredIdType' => var_exists($info->postprecise, 'InsuredIdType'), // 被保险人证件类型
            'InsuredMobile' => var_exists($info->postprecise, 'InsuredMobile'), // 被保险人手机号
            'InsuredEmail' => var_exists($info->postprecise, 'InsuredEmail'), // 被保人邮箱
            'InsuredAddress' => var_exists($info->postprecise, 'InsuredAddress'), // 被保险人地址
            'InsuredCertiStartdate' => var_exists($info->postprecise, 'InsuredCertiStartdate'), // 被保险人身份证有效期起期（yyyy-mm-dd北京平安必填）
            'InsuredCertiEnddate' => var_exists($info->postprecise, 'InsuredCertiEnddate'), // 被保险人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）
            'InsuredSex' => var_exists($info->postprecise, 'InsuredSex'), // 被保险人性别（身份证采集用）1男2女
            'InsuredAuthority' => var_exists($info->postprecise, 'InsuredAuthority'), // 被保险人证件签发机关（身份证采集用）
            'InsuredNation' => var_exists($info->postprecise, 'InsuredNation'), // 被保险人民族
            'InsuredBirthday' => var_exists($info->postprecise, 'InsuredBirthday'), // 被保险人生日（身份证采集用）格式为：xxxx-xx-xx

            'HolderIdCard' => var_exists($info->postprecise, 'HolderIdCard'), // 投保人证件号
            'HolderName' => var_exists($info->postprecise, 'HolderName'), // 投保人姓名
            'HolderIdType' => var_exists($info->postprecise, 'HolderIdType'), // 投保人证件类型（类型同被保人）
            'HolderMobile' => var_exists($info->postprecise, 'HolderMobile'), // 投保人手机号
            'HolderEmail' => var_exists($info->postprecise, 'HolderEmail'), // 投保人邮箱
            'HolderAddress' => var_exists($info->postprecise, 'HolderAddress'), // 投保人地址
            'HolderCertiStartdate' => var_exists($info->postprecise, 'HolderCertiStartdate'), // 投保人身份证有效期起期（yyyy-mm-dd北京平安必填）
            'HolderCertiEnddate' => var_exists($info->postprecise, 'HolderCertiEnddate'), // 投保人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）
            'HolderSex' => var_exists($info->postprecise, 'HolderSex'), // 投保人性别（身份证采集用）1男2女
            'HolderAuthority' => var_exists($info->postprecise, 'HolderAuthority'), // 投保人证件签发机关
            'HolderNation' => var_exists($info->postprecise, 'HolderNation'), // 投保人民族
            'HolderBirthday' => var_exists($info->postprecise, 'HolderBirthday') // 投保人生日（身份证采集用）格式为：xxxx-xx-xx
        ];

        if (!$detail['ForceTax'] || !$detail['EngineNo'] || !$detail['CarVin'] || !$detail['RegisterDate'] || !$detail['ModleName']) {
            return error('车辆投保信息不全');
        }

        // 验证报价信息
        if (!isset($info->preciseprice[$post['Source']])) {
            return error('没有找到该车辆报价信息');
        }

        $precisePrice = $info->preciseprice[$post['Source']];
        if (!isset($precisePrice['Item']['QuoteStatus']) || $precisePrice['Item']['QuoteStatus'] <= 0) {
            return error($precisePrice['Msg']);
        }

        // 验证支付金额
        if ($precisePrice['Item']['BizTotal'] + $precisePrice['Item']['ForceTotal'] + $precisePrice['Item']['TaxTotal'] > $post['pay'] / 100 + $post['deduct'] / 100) {
            return error('报价金额不正确');
        }

        $detail = array_merge($detail, $precisePrice['UserInfo']);
        $detail['BizTotal'] = $precisePrice['Item']['BizTotal'];  // 商业险总额
        $detail['ForceTotal'] = $precisePrice['Item']['ForceTotal']; // 交强险总额(90天之外的取不到，值为0)
        $detail['TaxTotal'] = $precisePrice['Item']['TaxTotal']; // 车船税总额(90天之外的取不到，值为0)

        // 合并个人补充信息
        $detail = array_merge($detail, $info->stockinfo);

        $detail = array_filter($detail, 'strlen');
        $detail = array_map('strtolower', $detail);

        // 防止重复提交
        if (!DB::table('userinfo')
            ->where([
                ['citycode', '=', $post['CityCode']],
                ['licenseno', '=', $post['LicenseNo']],
                ['updated_at', '<', $_SERVER['REQUEST_TIME'] - 2]
            ])
            ->update([
                'updated_at' => $_SERVER['REQUEST_TIME']
            ])) {
            return error('请勿重复提交');
        }

        // 创建订单
        $detail['uid'] = $post['uid'];
        $detail['pay'] = $post['pay'];
        $detail['deduct'] = $post['deduct'];
        $detail['payway'] = $post['payway'];
        $detail['create_time'] = $_SERVER['REQUEST_TIME'];
        $detail['updated_at'] = $_SERVER['REQUEST_TIME'];
        $detail['licenseno'] = $post['LicenseNo'];
        $detail['citycode'] = $post['CityCode'];

        // 根据月份路由分表
        if (!$table = $this->createTable()) {
            return error('分表路由错误');
        }
        $detail['id'] = $table['id'];
        if (!DB::table($table['table'])->insert($detail)) {
            return error('操作失败');
        }

        return success(['orderid' => $detail['id']]);
    }

    /**
     * 订单通知（支付成功，通知订单更新状态）
     * @param orderid 保险订单ID
     * @param pay 支付金额（分）
     * @param uid 用户ID
     * @return bool
     */
    public function notifyOrder ($post) {

        $post['orderid'] = var_exists($post, 'orderid'); // 保险订单ID
        $post['pay'] = var_exists($post, 'pay'); // 支付金额（分）
        $post['uid'] = var_exists($post, 'uid'); // 用户ID

        if (!$post['orderid'] || !$post['uid'] || $post['pay']) {
            return error('参数错误');
        }

        // 根据 ORDERID 路由分表
        if (!$table = $this->routeTable($post['orderid'])) {
            return error('订单号不正确');
        }

        // 获取订单信息
        if (!$orderInfo = DB::table($table)->where([['id', '=', $post['orderid']], ['uid', '=', $post['uid']]])->first([
            'id', 'source', 'pay', 'deduct', 'biztotal', 'forcetotal', 'taxtotal', 'status'
        ])) {
            return error('该订单不存在');
        }

        // 验证订单状态
        if ($orderInfo->status != 0) {
            return error('订单状态异常');
        }

        // 验证订单金额
        if ($orderInfo->pay + $orderInfo->deduct != $post['pay']) {
            return error('订单信息异常');
        }

        // 更新订单状态
        if (!DB::table('order_page_' . $table)
            ->where([
                ['status', '=', 1],
                ['updated_at', '=', $_SERVER['REQUEST_TIME']]
            ])
            ->update([
                'status' => 0,
                'id' => $post['orderid']
            ])) {
            return error('更新订单状态失败');
        }

        // 优惠劵方案
        $plans = $this->getCouponPlanPrice($orderInfo->source, $orderInfo->forcetotal, $orderInfo->biztotal);
        if ($plans['errNo'] === 0) {
            return $plans; // 返回优惠劵实际抵扣金额给客户端，客户端根据抵扣金额生成优惠劵给用户
        }

        return success('OK');
    }

    /**
     * 获取预返还优惠劵
     * @param orderid 保险订单ID
     * @return array
     */
    public function getPrepareCoupon ($post) {

        $post['orderid'] = var_exists($post, 'orderid'); // 保险订单ID

        // 根据 ORDERID 路由分表
        if (!$table = $this->routeTable($post['orderid'])) {
            return error('订单号不正确');
        }

        // 获取订单信息
        if (!$orderInfo = DB::table($table)->where([['id', '=', $post['orderid']]])->first([
            'id', 'source', 'biztotal', 'forcetotal', 'taxtotal'
        ])) {
            return error('该订单不存在');
        }

        return $this->getCouponPlanPrice($orderInfo->source, $orderInfo->forcetotal, $orderInfo->biztotal);
    }

    /**
     * 获取优惠劵方案费率
     * @param $source 保险公司ID
     * @return array
     */
    public function getCouponPlanRate ($post) {

        $post['source'] = var_exists($post, 'source');

        if (!$companyInfo = DB::table('company')->where([['id', '=', $post['source']]])->first([
            'id', 'app_coupon', 'agent_coupon', 'status'
        ])) {
            return error('该保司不存在');
        }

        if (!$companyInfo->status) {
            return error('该保司未启用');
        }

        // 获取APP和代理优惠方案
        if (!$planList = DB::table('coupon_plan')->whereIn('id', [$companyInfo->app_coupon, $companyInfo->agent_coupon])->get([
            'id', 'main', 'common_rate', 'park_rate', 'maintain_rate', 'insurance_rate'
        ])) {
            return error('优惠方案不存在');
        }

        $rate = [];
        foreach ($planList as $k => $v) {

            $rateType = '';
            if ($companyInfo->app_coupon == $v->id) {
                $rateType = 'app_coupon';
            } else if ($companyInfo->agent_coupon == $v->id) {
                $rateType = 'agent_coupon';
            }

            $rate[$rateType] = [
                'main' => $v->main, // 返还内容：1 交强+商业 2 交强险 3 商业险
                'common_rate' => $v->common_rate, // 通用劵金额
                'park_rate' => $v->park_rate,  // 停车劵金额
                'maintain_rate' => $v->maintain_rate,  // 洗车保养劵金额
                'insurance_rate' => $v->insurance_rate  // 保险劵金额
            ];
        }

        return success($rate);
    }

    /**
     * 获取优惠劵方案优惠金额
     * @param $source 保险公司ID
     * @param $jiaoqiang 交强险费用（元）
     * @param $shangye 商业险费用（元）
     * @return
     * {"app_coupon":{"common_rate":0,"park_rate":0,"maintain_rate":0,"insurance_rate":0}}
     */
    public function getCouponPlanPrice ($source, $jiaoqiang, $shangye) {

        $rate = $this->getCouponPlanRate(['source' => $source]);
        if ($rate['errNo'] !== 0) {
            return $rate;
        }
        $rate = $rate['result'];

        foreach ($rate as $k => $v) {

            // main 返还内容：1 交强+商业 2 交强险 3 商业险
            $totalPrice = 0;
            if ($v['main'] == 1) {
                $totalPrice = $jiaoqiang + $shangye;
            } else if ($v['main'] == 2) {
                $totalPrice = $jiaoqiang;
            } else if ($v['main'] == 3) {
                $totalPrice = $shangye;
            }
            unset($v['main']);

            // 计算优惠金额
            foreach ($v as $kk => $vv) {
                if ($vv >= 0 && $vv <= 100) {
                    $rate[$k][$kk] = round($totalPrice * ($vv / 100), 2);
                } else {
                    $rate[$k][$kk] = 0;
                }
            }
        }

        return success($rate);
    }

    /**
     * 获取每个城市配置的渠道
     */
    public function getAgentNewSource ($post) {

        if (!$post['CityCode']) {
            return error('城市代码不能为空');
        }

        $result = $this->buildRequest('http://iu.91bihu.com/api/agent/GetAgentNewSource', [
            'CityCode' => $post['CityCode']
        ]);
        if ($result['errNo'] !== 0) {
            return $result;
        }

        $list = array_flip($result['result']['ComList']);
        $list = array_intersect_key($this->getCompany(), $list);
        if (empty($list)) {
            return error('该城市未配置报价渠道');
        }

        return success($list);
    }

    /**
     * 是否可以续保
     * @param $CityCode 城市代码
     * @param $ForceTax 投保类型 0:单商业 1:商业+交强 2:单交强
     * @param $ForceExpireDate 交强险到期时间
     * @param $BusinessExpireDate 商业险到期时间
     * @return bool
     */
    public function isContinuedPeriods ($CityCode, $ForceTax, $ForceExpireDate = null, $BusinessExpireDate = null) {
        // 续保期：距离车险到期时间还有N天就可以购买下一年度的保险了，这个N天就是续保期
        if (empty($ForceExpireDate)) {
            return true;
        }

        $result = $this->getContinuedPeriods();
        if ($result['errNo'] !== 0) {
            return $result;
        }
        $result = $result['result'];

        if (empty($result)) {
            return true;
        }

        if (!isset($result[$CityCode])) {
            return true;
        }

        // 交强险
        $jqx = (strtotime($ForceExpireDate) - time()) / 86400;
        $jqx = ($jqx > 0 && $jqx > $result[$CityCode]['ForceDays']) ? 0 : 1;

        if ($ForceTax != 0 && $jqx == 0) {
            return false;
        }

        if ($ForceTax == 2) {
            return true;
        }

        if (empty($BusinessExpireDate)) {
            return true;
        }

        // 商业险
        $syx = (strtotime($BusinessExpireDate) - time()) / 86400;
        $syx = ($syx > 0 && $syx > $result[$CityCode]['BizDays']) ? 0 : 1;

        if ($syx == 0) {
            return false;
        }

        return true;
    }

    /**
     * 获取城市渠道续保期
     */
    public function getContinuedPeriods () {
        $result = $this->buildRequest('http://iu.91bihu.com/api/City/GetContinuedPeriods');
        if ($result['errNo'] !== 0) {
            return $result;
        }

        $result = $result['result']['Items'];
        $result = array_column($result, null, 'CityCode');

        return success($result);
    }

    /**
     * 获取城市代码
     */
    public function getCityId ($name) {
        $cityList = $this->getInsuranceCity();
        $cityList = array_column($cityList, 'city', 'id');
        $key = array_search($name, $cityList);

        return $key;
    }

    /**
     * 获取投保城市
     */
    public function getInsuranceCity () {
        $city = [
            ['id' => 95, 'city' => '贵阳', 'province' => '贵州', 'letter' => 'GY']
        ];

        return $city;
    }

    /**
     * 获取险种
     */
    public function getInsuranceClass () {
        /**
            force
            chesun 机动车损失保险，0-不投保，1-投保
            bujimianchesun
            sanzhe 第三者责任保险，0-不投保，>0投保(具体金额)
            bujimiansanzhe
            siji 车上人员责任险(司机) ，0-不投保，>0投保(具体金额)
            bujimiansiji
            chengke 车上人员责任险(乘客) ，0-不投保，>0投保(具体金额)
            bujimianchengke
            daoqiang 全车盗抢保险，0-不投保，1-投保
            bujimiandaoqiang
            sheshui 涉水行驶损失险，0-不投保，1投保
            bujimiansheshui
            huahen 车身划痕损失险，0-不投保，>0投保(具体金额)
            bujimianhuahen
            ziran 自燃损失险，0-不投保，1投保
            bujimianziran
            boli 0-不投保，1国产，2进口
         */
        $class = [
            [
                'id' => 'force',
                'name' => '交强险',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'chesun',
                'name' => '车损险',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'bujimianchesun',
                'name' => '不计免赔(车损)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'sanzhe',
                'name' => '第三者责任险',
                'item' => [0 => '不投保', 50000 => '5万', 100000 => '10万', 150000 => '15万', 200000 => '20万', 300000 => '30万', 500000 => '50万', 1000000 => '100万', 1500000 => '150万']
            ],
            [
                'id' => 'bujimiansanzhe',
                'name' => '不计免赔(三者)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'siji',
                'name' => '司机责任险',
                'item' => [0 => '不投保', 10000 => '1万', 20000 => '2万', 30000 => '3万', 40000 => '4万', 50000 => '5万', 100000 => '10万', 200000 => '20万']
            ],
            [
                'id' => 'bujimiansiji',
                'name' => '不计免赔(司机)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'chengke',
                'name' => '乘客责任险',
                'item' => [0 => '不投保', 10000 => '1万', 20000 => '2万', 30000 => '3万', 40000 => '4万', 50000 => '5万', 100000 => '10万', 200000 => '20万']
            ],
            [
                'id' => 'bujimianchengke',
                'name' => '不计免赔(乘客)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'daoqiang',
                'name' => '盗抢险',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'bujimiandaoqiang',
                'name' => '不计免赔(盗抢)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'sheshui',
                'name' => '涉水险',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'bujimiansheshui',
                'name' => '不计免赔(涉水)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'huahen',
                'name' => '车身划痕险',
                'item' => [0 => '不投保', 2000 => '2千', 5000 => '5千', 10000 => '1万', 20000 => '2万']
            ],
            [
                'id' => 'bujimianhuahen',
                'name' => '不计免赔(划痕)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'ziran',
                'name' => '自然险',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'bujimianziran',
                'name' => '不计免赔(自然)',
                'item' => [0 => '不投保', 1 => '投保']
            ],
            [
                'id' => 'boli',
                'name' => '玻璃险',
                'item' => [0 => '不投保', 1 => '国产', 2 => '进口']
            ]
        ];

        return success($class);
    }

    /**
     * 获取保司
     */
    public function getCompany () {

        $company = $this->getCompanyList();
        if ($company['errNo'] !== 0) {
            return [];
        }
        $company = $company['result'];
        return array_column($company, 'name', 'id');
    }

    /**
     * 获取保司列表
     */
    public function getCompanyList () {

        if (!$companyList = DB::table('company')->where('status', '=', 1)->get([
            'id', 'name', 'tel', 'logo'
        ])) {
            return error('保司为空');
        }
        return success($companyList->toArray());
    }

    /**
     * 获取车主证件类型
     */
    public function getOwnerIdType () {
        $idType = [
            1 => '身份证',
            2 => '组织机构代码证',
            5 => '港澳居民来往内地通行证',
            9 => '营业执照（社会统一信用代码）',
            14 => '港澳身份证'
        ];

        return $idType;
    }

    /**
     * 获取车辆使用性质
     */
    public function getCarUsedType () {
        $carUsedType = [
            1 => '家庭自用车',
            2 => '党政机关、事业团体',
            3 => '非营业企业客车',
            6 => '营业货车',
            7 => '非营业货车'
        ];

        return $carUsedType;
    }

    /**
     * 获取玻璃险种类
     */
    public function getBoliType () {
        $boliType = [
            0 => '不投保',
            1 => '国产',
            2 => '进口'
        ];

        return $boliType;
    }

    /**
     * 燃料种类
     */
    public function getFuelType () {
        $FuelType = [
            1 => '汽油',
            2 => '柴油',
            3 => '电',
            4 => '混合油',
            5 => '天然气',
            6 => '液化石油气',
            7 => '甲醇',
            8 => '乙醇',
            9 => '太阳能',
            10 => '混合动力',
            11 => '无',
            12 => '其它'
        ];

        return $FuelType;
    }

    /**
     * 获取车辆类型
     */
    public function getCarType () {
        $carType = [
            1 => '客车（默认）',
            2 => '货车（仅人保）',
            3 => '半挂牵引车（仅人保）',
            4 => '货车挂车（仅人保）',
            5 => '油罐车（仅人保）',
            6 => '气罐车（仅人保）',
            7 => '液罐车（仅人保）',
            8 => '冷藏车（仅人保）',
            9 => '罐车挂车（仅人保）',
            10 => '混凝土搅拌车（仅人保）',
            11 => '特种车二挂车（仅人保）',
            12 => '特种车二类其他（仅人保）',
            13 => '监测车（仅人保）',
            14 => '警用特种车（仅人保）',
            15 => '混凝土泵车（仅人保）',
            16 => '特种车三类挂车（仅人保）',
            17 => '特种车三类其他（仅人保）'
        ];

        return $carType;
    }

    /**
     * 获取车辆来历凭据
     */
    public function getProofType () {
        $ProofType = [
            1 => '销售发票',
            2 => '法院调解书',
            3 => '法院仲裁书',
            4 => '法院判决书',
            5 => '仲裁裁决书',
            6 => '相关文书',
            7 => '批准文件',
            8 => '调拨证明',
            9 => '修理发票'
        ];

        return $ProofType;
    }

    /**
     * 获取条款类型
     */
    public function getClauseType () {
        $ClauseType = [
            1 => '非营业用汽车用品',
            2 => '家庭自用汽车产品',
            3 => '营业用汽车产品',
            4 => '摩托车产品',
            5 => '拖拉机产品',
            6 => '特种车产品'
        ];

        return $ClauseType;
    }

    /**
     * 获取车牌底色
     */
    public function getLicenseColor () {
        $LicenseColor = [
            1 => '蓝',
            2 => '黑',
            3 => '白',
            4 => '黄',
            5 => '其他'
        ];

        return $LicenseColor;
    }

    /**
     * 获取行驶区域
     */
    public function getRunRegion () {
        $RunRegion = [
            1 => '境内',
            2 => '本省内',
            3 => '其他'
        ];

        return $RunRegion;
    }

    /**
     * 获取车辆使用性质
     */
    public function getIsPublic () {
        $IsPublic = [
            0 => '续保失败，无法获取该属性',
            1 => '公车',
            2 => '私车'
        ];

        return $IsPublic;
    }

    private function buildRequest ($url, $params = [], $timeout = 5) {
        $auth = [
            'Agent' => '175287',
            'CustKey' => 'chemi_user_keys'
        ];
        $code = 'a186e7f6eca'; // 密钥

        $params = array_merge($auth, $params);
        // 生成 SecCode
        $seccode = md5(urldecode(http_build_query($params)) . $code);

        // GET 参数
        $params['SecCode'] = $seccode;
        $params = http_build_query($params);
        try {
            $result = https_request($url . '?' . $params, null, null, $timeout);
        } catch (\Exception $e) {
            return error($e->getMessage());
        }

        if (!is_array($result) || !isset($result['BusinessStatus']) || $result['BusinessStatus'] < 1) {
            if (is_array($result)) {
                $result = implode(':', $result);
            }
            return error($result);
        }

        // 返回成功结果
        return success($result);
    }

    private function getreinfoUserinfo ($list) {
        $data = [];
        // 使用性质
        $data['CarUsedType'] = var_exists($list, 'CarUsedType');
        // 车牌号
        $data['LicenseNo'] = var_exists($list, 'LicenseNo');
        // 车主姓名
        $data['LicenseOwner'] = var_exists($list, 'LicenseOwner');
        // 新车购置价格
        $data['PurchasePrice'] = var_exists($list, 'PurchasePrice');
        // 证件类型
        $data['IdType'] = var_exists($list, 'IdType');
        // 证件号码(车主本人)
        $data['CredentislasNum'] = var_exists($list, 'CredentislasNum');
        // 城市ID
        $data['CityCode'] = var_exists($list, 'CityCode');
        // 发动机号
        $data['EngineNo'] = var_exists($list, 'EngineNo');
        // 品牌型号
        $data['ModleName'] = var_exists($list, 'ModleName');
        // 车辆注册日期
        $data['RegisterDate'] = var_exists($list, 'RegisterDate');
        // 车辆识别代号
        $data['CarVin'] = var_exists($list, 'CarVin');
        // 交强险到期时间
        $data['ForceExpireDate'] = var_exists($list, 'ForceExpireDate');
        // 商业险到期时间
        $data['BusinessExpireDate'] = var_exists($list, 'BusinessExpireDate');
        // 下年的交强起保日期
        $data['NextForceStartDate'] = var_exists($list, 'NextForceStartDate');
        // 下年的商业险起保日期
        $data['NextBusinessStartDate'] = var_exists($list, 'NextBusinessStartDate');
        // 座位数量
        $data['SeatCount'] = var_exists($list, 'SeatCount');

        // 被保险人
        $data['InsuredName'] = var_exists($list, 'InsuredName');
        // 被保人证件类型
        $data['InsuredIdType'] = var_exists($list, 'InsuredIdType');
        // 被保人证件号
        $data['InsuredIdCard'] = var_exists($list, 'InsuredIdCard');
        // 被保人手机号（空，取不到）
        $data['InsuredMobile'] = var_exists($list, 'InsuredMobile');

        // 投保人
        $data['PostedName'] = var_exists($list, 'PostedName');
        // 投保人证件类型
        $data['HolderIdType'] = var_exists($list, 'HolderIdType');
        // 投保人证件号
        $data['HolderIdCard'] = var_exists($list, 'HolderIdCard');
        // 投保人联系方式（空，取不到）
        $data['HolderMobile'] = var_exists($list, 'HolderMobile');

        // 燃料种类
        $data['FuelType'] = var_exists($list, 'FuelType');
        // 车辆来历凭证
        $data['ProofType'] = var_exists($list, 'ProofType');
        // 条款类型
        $data['ClauseType'] = var_exists($list, 'ClauseType');
        // 号牌底色
        $data['LicenseColor'] = var_exists($list, 'LicenseColor');
        // 行驶区域
        $data['RunRegion'] = var_exists($list, 'RunRegion');
        // 0：续保失败，无法获取该属性 1：公车 2：私车
        $data['IsPublic'] = var_exists($list, 'IsPublic');
        // 商业险保单号
        $data['BizNo'] = var_exists($list, 'BizNo');
        // 交强险保单号
        $data['ForceNo'] = var_exists($list, 'ForceNo');
        // 精友码（续保成功，也有可能是空）
        $data['AutoMoldCode'] = var_exists($list, 'AutoMoldCode');

        return $data;
    }

    private function getreinfoSavequote ($list) {
        $data = [];
        // 上年保险公司
        $data['Source'] = var_exists($list, 'Source');
        // 车损保额
        $data['CheSun'] = var_exists($list, 'CheSun');
        // 第三方责任险保额
        $data['SanZhe'] = var_exists($list, 'SanZhe');
        // 全车盗抢保险保额
        $data['DaoQiang'] = var_exists($list, 'DaoQiang');
        // 车上人员责任险（司机）保额
        $data['SiJi'] = var_exists($list, 'SiJi');
        // 车上人员责任险（乘客）保额
        $data['ChengKe'] = var_exists($list, 'ChengKe');
        // 玻璃单独破碎险保额
        $data['BoLi'] = var_exists($list, 'BoLi');
        // 车身划痕损失险保额
        $data['HuaHen'] = var_exists($list, 'HuaHen');
        // 涉水行驶损失险保额
        $data['SheShui'] = var_exists($list, 'SheShui');
        // 自燃损失险保额
        $data['ZiRan'] = var_exists($list, 'ZiRan');
        // 机动车无法找到三方特约险保额
        $data['HcSanFangTeYue'] = var_exists($list, 'HcSanFangTeYue');
        // 精神损失险保额
        $data['HcJingShenSunShi'] = var_exists($list, 'HcJingShenSunShi');
        // 不计免赔险（车损）保额
        $data['BuJiMianCheSun'] = var_exists($list, 'BuJiMianCheSun');
        // 不计免赔险（三者）保额
        $data['BuJiMianSanZhe'] = var_exists($list, 'BuJiMianSanZhe');
        // 不计免赔险（盗抢）保额
        $data['BuJiMianDaoQiang'] = var_exists($list, 'BuJiMianDaoQiang');
        // 不计免乘客保额
        $data['BuJiMianChengKe'] = var_exists($list, 'BuJiMianChengKe');
        // 不计免司机保额
        $data['BuJiMianSiJi'] = var_exists($list, 'BuJiMianSiJi');
        // 不计免划痕保额
        $data['BuJiMianHuaHen'] = var_exists($list, 'BuJiMianHuaHen');
        // 不计免涉水保额
        $data['BuJiMianSheShui'] = var_exists($list, 'BuJiMianSheShui');
        // 不计免自燃保额
        $data['BuJiMianZiRan'] = var_exists($list, 'BuJiMianZiRan');
        // 不计免精神损失保额
        $data['BuJiMianJingShenSunShi'] = var_exists($list, 'BuJiMianJingShenSunShi');
        // 指定专修厂类型 -1没有 国产0 进口1（依赖于请求参数）
        $HcXiuLiChangType = [
            0 => '国产',
            1 => '进口'
        ];
        $data['HcXiuLiChangType'] = var_exists($HcXiuLiChangType, var_exists($list, 'HcXiuLiChangType'));
        // 修理期间每天补偿 （100,200,300）元
        $data['Fybc'] = var_exists($list, 'Fybc');
        // 天数0-90(含)天
        $data['FybcDays'] = var_exists($list, 'FybcDays');
        // 设备损失险保额
        $data['SheBeiSunShi'] = var_exists($list, 'SheBeiSunShi');
        // 不计免设备损失险保额
        $data['BjmSheBeiSunShi'] = var_exists($list, 'BjmSheBeiSunShi');

        return $data;
    }

    /**
     * 根据 $id 路由分表
     * @param $id 订单ID
     * @return null|string
     */
    private function routeTable ($id) {

        $id = intval($id);
        $month = date('Ym', $_SERVER['REQUEST_TIME']);
        $firstMonth = '201903';
        $datetime = (new \DateTime($firstMonth . '01'))->diff(new \DateTime($month . '01'));
        $page = $datetime->format("%y") * 12 + $datetime->format("%m");

        if (false === ($tableId = db_tableid($id, $page))) {
            return null;
        }

        $time = strtotime($firstMonth . '01');
        // 分表名称
        $table = date('Ym', mktime(0,0,0, date('m', $time) + $tableId, 1, date('Y', $time)));

        return 'order_page_' . $table;
    }

    /**
     * 创建表结构
     */
    private function createTable () {

        $month = date('Ym', $_SERVER['REQUEST_TIME']);
        $tableName = 'order_page_' . $month;
        $firstMonth = '201903';

        // 判断表是否存在
        $tableExists = DB::selectOne('SELECT table_name FROM information_schema.TABLES WHERE table_name = "' . $tableName . '" LIMIT 1');

        if (!$tableExists) {
            // 创建新表
            $showTable = DB::selectOne('show create table baoxian_order_page_' . $firstMonth);
            if (!isset($showTable->{'Create Table'})) {
                return false;
            }
            $createTable = $showTable->{'Create Table'};
            $createTable = str_replace('order_page_' . $firstMonth, $tableName, $createTable);
            DB::statement($createTable);
            if (!DB::selectOne('SELECT table_name FROM information_schema.TABLES WHERE table_name = "' . $tableName . '" LIMIT 1')) {
                return false;
            }
        }

        // 根据月份路由分表
        $datetime = (new \DateTime($firstMonth . '01'))->diff(new \DateTime($month . '01'));
        $page = $datetime->format("%y") * 12 + $datetime->format("%m");
        $maxid = DB::table($tableName)->max('id');
        if (!$insertid = db_insertid($page, $maxid, $page)) {
            return false;
        }

        return [
            'id' => $insertid,
            'table' => $tableName
        ];
    }

}
