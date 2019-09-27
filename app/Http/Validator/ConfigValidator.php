<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/14
 * Time: 下午4:51
 */
namespace App\Http\Validator;

use App\Rules\CouponRule;

class ConfigValidator extends BaseValidator {

    /**
     * 创建验证规则
     * @param array $data
     * @return bool|mixed
     */
    public function createValidator(array $data)
    {
        $rules = [
            'name'                 =>'in:base,hot,best',
            'FORCEINSURANCE'       =>'integer',
            'TAXPAY'               =>'integer',
            'CHESUN'               =>'integer',
            'BUJIMIAN_CHESUN'      =>'integer',
            'SANZHE'               =>'integer',
            'BUJIMIAN_SANZHE'      =>'integer',
            'DAOQIANG'             =>'integer',
            'BUJIMIAN_DAOQIANG'    =>'integer',
            'SIJI'                 =>'integer',
            'BUJIMIAN_SIJI'        =>'integer',
            'CHENGKE'              =>'integer',
            'BUJIMIAN_CHENGKE'     =>'integer',
            'LOSTSPECIAL'          =>'integer',
            'BUJIMIAN_LOSTSPECIAL' =>'integer',
            'SHESHUI'              =>'integer',
            'BUJIMIAN_SHESHUI'     =>'integer',
            'BOLI'                 =>'integer',
            'HUAHEN'               =>'integer',
            'BUJIMIAN_HUAHEN'      =>'integer',
            'ZIRAN'                =>'integer',
            'BUJIMIAN_ZIRAN'       =>'integer',
            'TAKESPECAILREPAIR'    =>'integer',
            'SANZHEHOLIDAYDOUBLE'  =>'integer'
        ];
        //定义提示信息
        $messages = [
            'name.in'                      => '推荐方案类型错误',
            'FORCEINSURANCE.integer'       =>'输入类型必须为整数',
            'TAXPAY.integer'               =>'输入类型必须为整数',
            'CHESUN.integer'               =>'输入类型必须为整数',
            'BUJIMIAN_CHESUN.integer'      =>'输入类型必须为整数',
            'SANZHE.integer'               =>'输入类型必须为整数',
            'BUJIMIAN_SANZHE.integer'      =>'输入类型必须为整数',
            'DAOQIANG.integer'             =>'输入类型必须为整数',
            'BUJIMIAN_DAOQIANG.integer'    =>'输入类型必须为整数',
            'SIJI.integer'                 =>'输入类型必须为整数',
            'BUJIMIAN_SIJI.integer'        =>'输入类型必须为整数',
            'CHENGKE.integer'              =>'输入类型必须为整数',
            'BUJIMIAN_CHENGKE.integer'     =>'输入类型必须为整数',
            'LOSTSPECIAL.integer'          =>'输入类型必须为整数',
            'BUJIMIAN_LOSTSPECIAL.integer' =>'输入类型必须为整数',
            'SHESHUI.integer'              =>'输入类型必须为整数',
            'BUJIMIAN_SHESHUI.integer'     =>'输入类型必须为整数',
            'BOLI.integer'                 =>'输入类型必须为整数',
            'HUAHEN.integer'               =>'输入类型必须为整数',
            'BUJIMIAN_HUAHEN.integer'      =>'输入类型必须为整数',
            'ZIRAN.integer'                =>'输入类型必须为整数',
            'BUJIMIAN_ZIRAN.integer'       =>'输入类型必须为整数',
            'TAKESPECAILREPAIR.integer'    =>'输入类型必须为整数',
            'SANZHEHOLIDAYDOUBLE.integer'  =>'输入类型必须为整数'
        ];
        //验证数据
        return $this->_postValidator($data, $rules, $messages);
    }
}