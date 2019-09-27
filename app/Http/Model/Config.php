<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2019/2/26
 * Time: 上午10:15
 */

namespace App\Model;

/**
 * @SWG\Definition(
 *   definition="Config",
 *     @SWG\Property(
 *         property="FORCEINSURANCE",
 *         type="integer",
 *         description="交强险"
 *     ),
 *     @SWG\Property(
 *         property="TAXPAY",
 *         type="integer",
 *         description="车船税（代缴）"
 *     ),
 *     @SWG\Property(
 *         property="CHESUN",
 *         type="integer",
 *         description="机动车损失险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_CHESUN",
 *         type="integer",
 *         description="机动车损失险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="DAOQIANG",
 *         type="integer",
 *         description="盗抢险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_DAOQIANG",
 *         type="integer",
 *         description="盗抢险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="SIJI",
 *         type="integer",
 *         description="司机责任险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_SIJI",
 *         type="integer",
 *         description="司机责任险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="CHENGKE",
 *         type="integer",
 *         description="乘客责任险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_CHENGKE",
 *         type="integer",
 *         description="乘客责任险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="LOSTSPECIAL",
 *         type="integer",
 *         description="无法找到第三方特约险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_LOSTSPECIAL",
 *         type="integer",
 *         description="无法找到第三方特约险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="SHESHUI",
 *         type="integer",
 *         description="涉水险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_SHESHUI",
 *         type="integer",
 *         description="涉水险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="BOLI",
 *         type="integer",
 *         description="玻璃险"
 *     ),
 *     @SWG\Property(
 *         property="HUAHEN",
 *         type="integer",
 *         description="划痕险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_HUAHEN",
 *         type="integer",
 *         description="划痕险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="ZIRAN",
 *         type="integer",
 *         description="自燃损失险"
 *     ),
 *     @SWG\Property(
 *         property="BUJIMIAN_ZIRAN",
 *         type="integer",
 *         description="自燃损失险不计免赔"
 *     ),
 *     @SWG\Property(
 *         property="TAKESPECAILREPAIR",
 *         type="integer",
 *         description="指定专修厂险"
 *     ),
 *     @SWG\Property(
 *         property="SANZHEHOLIDAYDOUBLE",
 *         type="integer",
 *         description="三者节假日翻倍险"
 *     )
 * )
 */


/**
 * @SWG\Definition(
 *   definition="ConfigSample",
 *     @SWG\Property(
 *         property="name",
 *         type="string",
 *         description="推荐方案键值"
 *     ),
 *     @SWG\Property(
 *         property="label",
 *         type="string",
 *         description="推荐方案名称"
 *     ),
 *     @SWG\Property(
 *         property="selected",
 *         type="string",
 *         description="推荐方案内容"
 *     )
 * )
 */


/**
 * @SWG\Definition(
 *   definition="ConfigFull",
 *     @SWG\Property(
 *         property="label",
 *         type="array",
 *         description="推荐方案名称列表",
 *         @SWG\Items(
 *             ref="#/definitions/Config"
 *         )
 *     ),
 *     @SWG\Property(
 *         property="selected",
 *         type="array",
 *         description="已选择推荐方案列表",
 *         @SWG\Items(
 *             ref="$/definitions/Config"
 *         )
 *     ),
 *     @SWG\Property(
 *         property="value",
 *         type="array",
 *         description="推荐方案属性值",
 *         @SWG\Items(
 *             ref="$/definitions/Config"
 *         )
 *     )
 * )
 */
class Config extends BaseModel
{
    protected $table = 'config';
    const UPDATED_AT = 'update_time';
}