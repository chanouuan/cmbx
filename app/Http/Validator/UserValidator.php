<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/14
 * Time: 下午4:51
 */
namespace App\Http\Validator;
use App\Rules\Mobile;

class UserValidator extends BaseValidator {
    /**
     * 创建账户验证规则
     * @param array $data
     * @return bool|mixed
     */
    public function createValidator(array $data)
    {
        $rules = [
            'mobile'          => ['required', new Mobile()],
            'password'        =>'required|min:6'
        ];
        //定义提示信息
        $messages = [
            'mobile.required'   => '手机号为空',
            'password.required' =>'请输入密码',
            'password.min'      =>'密码长度必须大于6位'
        ];
        //验证数据
        return $this->_postValidator($data, $rules, $messages);
    }
}