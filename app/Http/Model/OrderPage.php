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
 *   definition="OrderPage",
 *     description="
id=>订单ID
uid=>用户ID
pay=>订单支付金额：分，订单实际金额 = pay + deduct
deduct=>抵扣金额：分
payway=>支付方式：wx微信 cb车币
status=>订单状态：-1已退款 0未支付 1已支付 2已取消
create_time=>订单创建时间
updated_at=>订单状态更新时间
citycode=>城市ID
licenseno=>车牌号
source=>保司
engineno=>发动机号
carvin=>车架号
registerdate=>注册日期
modlename=>品牌型号
forcetax=>0:单商业，1：商业+交强车船，2：单交强+车船
forcetimestamp=>交强险起保时间
biztimestamp=>商业险起保时间（如果在单商业的情况下 ，此字段必须有值）
boli=>玻璃单独破碎险，0-不投保，1国产，2进口
bujimianchesun=>不计免赔险(车损)，0-不投保，1投保
bujimiandaoqiang=>不计免赔险(盗抢) ，0-不投保，1投保
bujimiansanzhe=>不计免赔险(三者) ，0-不投保，1投保
bujimianchengke=>不计免乘客0-不投保，1投保
bujimiansiji=>不计免司机0-不投保，1投保
bujimianhuahen=>不计免划痕0-不投保，1投保
bujimiansheshui=>不计免涉水0-不投保，1投保
bujimianziran=>不计免自燃0-不投保，1投保
bujimianjingshensunshi=>不计免精神损失0-不投保，1投保
sheshui=>涉水行驶损失险，0-不投保，1投保
huahen=>车身划痕损失险，0-不投保，>0投保(具体金额)
siji=>车上人员责任险(司机) ，0-不投保，>0投保(具体金额）
chengke=>车上人员责任险(乘客) ，0-不投保，>0投保(具体金额)
chesun=>机动车损失保险，0-不投保，1-投保
daoqiang=>全车盗抢保险，0-不投保，1-投保
sanzhe=>第三者责任保险，0-不投保，>0投保(具体金额)
ziran=>自燃损失险，0-不投保，1投保
shebeisunshi=>设备损失险 1：投保 0:不投保
bjmshebeisunshi=>不计免设备损失险 1：投保 0:不投保
isnewcar=>是否新车（1：新车  2：旧车（默认）；）
cartype=>车辆类型
carusedtype=>使用性质
seatcount=>核定载客量
toncount=>核定载质量
transferdate=>过户车日期（yyyy-mm-dd）
purchaseprice=>购置价格
negotiateprice=>协商价格
automoldcode=>精友编码
exhaustscale=>排气量
carownersname=>车主姓名
owneridcardtype=>车主证件类型
idcard=>车主证件号
email=>车主邮箱
ownersex=>车主性别 1男 2女
ownerauthority=>车主证件签发机关
ownernation=>车主民族
ownerbirthday=>车主生日 格式为：xxxx-xx-xx
insuredname=>被保险人姓名
insuredidcard=>被保险人证件号
insuredidtype=>被保险人证件类型
insuredmobile=>被保险人手机号
insuredemail=>被保人邮箱
insuredaddress=>被保险人地址
insuredcertistartdate=>被保险人身份证有效期起期（yyyy-mm-dd北京平安必填）
insuredcertienddate=>被保险人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）
insuredsex=>被保险人性别（身份证采集用）1男2女
insuredauthority=>被保险人证件签发机关（身份证采集用）
insurednation=>被保险人民族
insuredbirthday=>被保险人生日（身份证采集用）格式为：xxxx-xx-xx
holderidcard=>投保人证件号
holdername=>投保人姓名
holderidtype=>投保人证件类型（类型同被保人）
holdermobile=>投保人手机号
holderemail=>投保人邮箱
holderaddress=>投保人地址
holdercertistartdate=>投保人身份证有效期起期（yyyy-mm-dd北京平安必填）
holdercertienddate=>投保人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）
holdersex=>投保人性别（身份证采集用）1男2女
holderauthority=>投保人证件签发机关
holdernation=>投保人民族
holderbirthday=>投保人生日（身份证采集用）格式为：xxxx-xx-xx
forceenddate=>交强险截止日期
businessenddate=>商业险截止日期
biztotal=>商业险总额
forcetotal=>交强险总额
taxtotal=>车船税总额
 *     ",
 *              @SWG\Property(
 *                  property="id",
 *                  type="integer",
 *                  description="主键"
 *              ),
 *              @SWG\Property(
 *                  property="uid",
 *                  type="integer",
 *                  description="用户ID"
 *              ),
 *              @SWG\Property(
 *                  property="status",
 *                  type="integer",
 *                  description="订单状态：-1已退款 0未支付 1已支付 2已取消"
 *              ),
 *              @SWG\Property(
 *                  property="create_time",
 *                  type="string",
 *                  description="创建日期"
 *              ),
 * )
 */
class OrderPage extends BaseModel
{
    protected $table = INSURANCE_ORDER_TABLE_NAME;

    public function company()
    {
        return $this->hasOne('App\Model\Company', 'id', 'source');
    }
}