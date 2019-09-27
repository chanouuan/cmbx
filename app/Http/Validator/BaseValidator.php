<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/14
 * Time: 下午4:48
 */

namespace App\Http\Validator;
use Illuminate\Support\Facades\Validator;

class BaseValidator extends Validator {
    /**
     * 功能：获取验证错误信息
     * 作者：秋词
     * 时间:2018-12-10
     * 版本:2.0.0
     * @param array $data
     * @param array $rules
     * @param array $messages
     * @return bool|mixed
     */
    protected function _postValidator(array $data,array $rules,array $messages=[]) {

        $validator = Validator::make($data, $rules, $messages);

        if($validator->fails()){
            $error = $validator->errors()->messages() ;
            $error = current(current($error)) ;
            return $error ;
        }

        return  true;
    }
}