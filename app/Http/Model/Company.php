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
 *   definition="Company",
 *              @SWG\Property(
 *                  property="id",
 *                  type="integer",
 *                  description="主键"
 *              ),
 *              @SWG\Property(
 *                  property="name",
 *                  type="string",
 *                  description="公司名称"
 *              ),
 *              @SWG\Property(
 *                  property="app_coupon",
 *                  type="integer",
 *                  description="APP优惠方案ID"
 *              ),
 *              @SWG\Property(
 *                  property="agent_coupon",
 *                  type="integer",
 *                  description="代理优惠方案ID"
 *              ),
 *              @SWG\Property(
 *                  property="order_type",
 *                  type="integer",
 *                  description="出单类型：1 壁虎车险"
 *              ),
 *              @SWG\Property(
 *                  property="status",
 *                  type="integer",
 *                  description="状态：0 禁用 1 启用"
 *              ),
 *              @SWG\Property(
 *                  property="create_time",
 *                  type="string",
 *                  description="创建日期"
 *              ),
 * )
 */
class Company extends BaseModel
{
    protected $table = 'company';
}