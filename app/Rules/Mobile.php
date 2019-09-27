<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/19
 * Time: 上午10:51
 */
namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class Mobile implements Rule
{
    /**
     * 判断验证规则是否通过。
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        return preg_match('/^1[1,3,4,5,7,8]{1}\d{9}$/' , $value) ;
    }

    /**
     * 获取验证错误消息。
     *
     * @return string
     */
    public function message()
    {
        return '手机号格式不正确';
    }
}