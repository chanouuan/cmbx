<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2019/2/25
 * Time: 下午4:46
 */

/**
 * @SWG\Tag(
 *   name="优惠方案配置接口",
 *   description="优惠方案配置相关接口",
 * )
 */

namespace App\Http\Controllers\Admin;
use App\Http\Validator\ConfigValidator;
use App\Model\Config;
use App\Services\RedisKeys;
use App\Services\RedisTTLs;
use Illuminate\Http\Request;
use App\Exceptions\ApiException;
use App\Constants\StatusCodes;
use Illuminate\Support\Facades\Redis;


class ConfigController extends ApiController
{
    /**
     *
     * @SWG\Get(
     *     path="/admin/config/recommend/{type}",
     *     summary="获取优惠方案配置详情",
     *     tags={"优惠方案配置接口"},
     *     @SWG\Parameter(
     *         name="type",
     *         type="string",
     *         in="path",
     *         required=true,
     *         description="方案类型(base:基础方案，hot:热门方案，best:最佳性价比)"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  type="array",
     *                  description="配置列表",
     *                  @SWG\Items(
     *                      ref="#/definitions/ConfigSample"
     *                  )
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function recommend(string $type) {
        $validator = new ConfigValidator();
        if (($validatorResult = $validator->createValidator(['name'=>$type])) !== true) {
            throw new ApiException($validatorResult , StatusCodes::CONFIG_FIND_PARAMETER_ERROR);
        }

        // 从缓存里获取
        $redisKey = RedisKeys::recommend($type);
        if ($result = Redis::get($redisKey)) {
            return $this->_success(json_decode($result, true));
        }

        $recommendLabel = config('insurance.recommend.label');
        $recommendValue = config('insurance.recommend.value');
        $whereType = 'RECOMMEND_'.strtoupper($type).'_';
        // 添加配置名前缀
        $whereNames = array_map(function($val) use ($whereType){
            return $whereType.$val;
        }, array_keys($recommendLabel));

        $configs = Config::whereIn('name', $whereNames)->select(['name','value'])->get();
        $result = [];
        // 去掉配置名前缀
        foreach ($configs as $configInfo) {
            $configKey = str_replace($whereType,'', $configInfo['name']);
            $result[] = [
                'name'     =>$configKey,
                'label'    =>$recommendLabel[$configKey] ?? $configInfo['name'],
                'selected' =>$recommendValue[$configKey][$configInfo['value']] ?? $configInfo['value']
            ];
        }
        // 缓存结果一个月
        Redis::set($redisKey, json_encode($result));
        Redis::expire($redisKey, RedisTTLs::oneMonth());

        return $this->_success($result);
    }

    /**
     *
     * @SWG\Get(
     *     path="/admin/config/recommend/full/{type}",
     *     summary="获取优惠方案配置详细列表",
     *     tags={"优惠方案配置接口"},
     *     @SWG\Parameter(
     *         name="type",
     *         type="string",
     *         in="path",
     *         required=true,
     *         description="方案类型(base:基础方案，hot:热门方案，best:最佳性价比)"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  ref="$/definitions/ConfigFull",
     *                  description="配置列表"
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function fullRecommend(string $type) {
        $validator = new ConfigValidator();
        if (($validatorResult = $validator->createValidator(['name'=>$type])) !== true) {
            throw new ApiException($validatorResult , StatusCodes::CONFIG_FIND_PARAMETER_ERROR);
        }
        // 从缓存里获取
        $redisKey = RedisKeys::recommendFull($type);
        if ($result = Redis::get($redisKey)) {
            return $this->_success(json_decode($result, true));
        }
        $recommendLabel = config('insurance.recommend.label');
        $recommendValue = config('insurance.recommend.value');
        $whereType = 'RECOMMEND_'.strtoupper($type).'_';
        // 添加配置名前缀
        $whereNames = array_map(function($val) use ($whereType){
            return $whereType.$val;
        }, array_keys($recommendLabel));

        $configs = Config::whereIn('name', $whereNames)->select(['name','value'])->get();
        $result = [];
        // 去掉配置名前缀
        foreach ($configs as $configInfo) {
            $result[str_replace($whereType,'', $configInfo['name'])] = $configInfo['value'];
        }

        // 补全设置
        foreach ($recommendLabel as $label=>$name) {
            $result[$label] = $result[$label] ?? 0;
        }

        // 缓存结果一个月
        Redis::set($redisKey, json_encode(['label'=>$recommendLabel, 'value'=>$recommendValue, 'selected'=>$result]));
        Redis::expire($redisKey, RedisTTLs::oneMonth());

        return $this->_success(['label'=>$recommendLabel, 'value'=>$recommendValue, 'selected'=>$result]);
    }

    /**
     *
     * @SWG\Post(
     *     path="/admin/config/recommend/update/{type}",
     *     summary="修改优惠方案配置",
     *     tags={"优惠方案配置接口"},
     *     @SWG\Parameter(
     *         name="type",
     *         type="string",
     *         in="path",
     *         required=true,
     *         description="方案类型(base:基础方案，hot:热门方案，best:最佳性价比)"
     *     ),
     *     @SWG\Parameter(
     *         name="FORCEINSURANCE",
     *         type="integer",
     *         in="query",
     *         description="交强险"
     *     ),
     *     @SWG\Parameter(
     *         name="TAXPAY",
     *         type="integer",
     *         in="query",
     *         description="车船税（代缴）"
     *     ),
     *     @SWG\Parameter(
     *         name="CHESUN",
     *         type="integer",
     *         in="query",
     *         description="机动车损失险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_CHESUN",
     *         type="integer",
     *         in="query",
     *         description="机动车损失险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="DAOQIANG",
     *         type="integer",
     *         in="query",
     *         description="盗抢险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_DAOQIANG",
     *         type="integer",
     *         in="query",
     *         description="盗抢险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="SIJI",
     *         type="integer",
     *         in="query",
     *         description="司机责任险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_SIJI",
     *         type="integer",
     *         in="query",
     *         description="司机责任险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="CHENGKE",
     *         type="integer",
     *         in="query",
     *         description="乘客责任险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_CHENGKE",
     *         type="integer",
     *         in="query",
     *         description="乘客责任险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="LOSTSPECIAL",
     *         type="integer",
     *         in="query",
     *         description="无法找到第三方特约险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_LOSTSPECIAL",
     *         type="integer",
     *         in="query",
     *         description="无法找到第三方特约险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="SHESHUI",
     *         type="integer",
     *         in="query",
     *         description="涉水险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_SHESHUI",
     *         type="integer",
     *         in="query",
     *         description="涉水险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="BOLI",
     *         type="integer",
     *         in="query",
     *         description="玻璃险"
     *     ),
     *     @SWG\Parameter(
     *         name="HUAHEN",
     *         type="integer",
     *         in="query",
     *         description="划痕险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_HUAHEN",
     *         type="integer",
     *         in="query",
     *         description="划痕险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="ZIRAN",
     *         type="integer",
     *         in="query",
     *         description="自燃损失险"
     *     ),
     *     @SWG\Parameter(
     *         name="BUJIMIAN_ZIRAN",
     *         type="integer",
     *         in="query",
     *         description="自燃损失险不计免赔"
     *     ),
     *     @SWG\Parameter(
     *         name="TAKESPECAILREPAIR",
     *         type="integer",
     *         in="query",
     *         description="指定专修厂险"
     *     ),
     *     @SWG\Parameter(
     *         name="SANZHEHOLIDAYDOUBLE",
     *         type="integer",
     *         in="query",
     *         description="三者节假日翻倍险"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  ref="$/definitions/ReturnStatus"
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function updateRecommend(Request $request, $type) {
        $recommendLabel = config('insurance.recommend.label');
        $recommendValue = config('insurance.recommend.value');
        // 添加配置名前缀
        $whereType = 'RECOMMEND_'.strtoupper($type).'_';
        $arPost = $request->only(array_keys($recommendLabel));
        $validator = new ConfigValidator();
        if (($validatorResult = $validator->createValidator(array_merge($arPost, ['name'=>$type]))) !== true) {
            throw new ApiException($validatorResult , StatusCodes::CONFIG_UPDATE_PARAMETER_ERROR);
        }

        // 清除缓存
        Redis::del(RedisKeys::recommend($type));
        Redis::del(RedisKeys::recommendFull($type));

        $recommendConfigs = [];
        // 批量数据库更新
        foreach ($arPost as $configName=>$configValue) {
            // 只保存投保项，不投保项不存数据库
            if ($configValue) {
                $recommendConfigs[] = ['name'=>$configName, 'label'=>$recommendLabel[$configName], 'selected'=>$recommendValue[$configName][$configValue] ?? $configValue];
                Config::updateOrCreate(['name'=>$whereType.$configName], ['name'=>$whereType.$configName,
                    'type'=>'number', 'value'=> $configValue, 'description'=> $recommendLabel[$configName] ?? '']);
            } else {
                // 清除不投保项
                Config::where('name', $whereType.$configName)->delete();
            }
        }
        return $this->_success($recommendConfigs);
    }
}