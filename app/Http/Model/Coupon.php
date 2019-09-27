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
 *   definition="Coupon",
 *              @SWG\Property(
 *                  property="id",
 *                  type="integer",
 *                  description="主键"
 *              ),
 *              @SWG\Property(
 *                  property="name",
 *                  type="string",
 *                  description="方案名称"
 *              ),
 *              @SWG\Property(
 *                  property="type",
 *                  type="integer",
 *                  description="方案类型：1 APP优惠 2 代理优惠"
 *              ),
 *              @SWG\Property(
 *                  property="main",
 *                  type="integer",
 *                  description="返还内容：1 交强+商业 2 交强险 3 商业险"
 *              ),
 *              @SWG\Property(
 *                  property="common_rate",
 *                  type="integer",
 *                  description="通用劵返还比例 0-100"
 *              ),
 *              @SWG\Property(
 *                  property="park_rate",
 *                  type="integer",
 *                  description="停车劵返还比例 0-100"
 *              ),
 *              @SWG\Property(
 *                  property="maintain_rate",
 *                  type="integer",
 *                  description="洗车保养劵返还比例 0-100"
 *              ),
 *              @SWG\Property(
 *                  property="insurance_rate",
 *                  type="integer",
 *                  description="保险劵返还比例 0-100"
 *              ),
 *              @SWG\Property(
 *                  property="commission_rate",
 *                  type="integer",
 *                  description="佣金比例 0-100"
 *              ),
 *              @SWG\Property(
 *                  property="create_time",
 *                  type="string",
 *                  description="创建日期"
 *              ),
 * )
 */
class Coupon extends BaseModel
{
    protected $table = 'coupon_plan';
}