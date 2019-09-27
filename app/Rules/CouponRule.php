<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/19
 * Time: 上午10:51
 */
namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use App\Model\Coupon;

class CouponRule implements Rule
{
    // 更新数据时ID
    protected $id;
    public function __construct($id)
    {
        $this->id = $id;
    }

    /**
     * 判断验证规则是否通过。
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        // 成功返回true，失败返回false
        return Coupon::where($attribute, $value)->where('id', '!=', $this->id)->count() > 0 ? false : true;
    }

    /**
     * 获取验证错误消息。
     *
     * @return string
     */
    public function message()
    {
        return '优惠方案名称不可重名';
    }
}