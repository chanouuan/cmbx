<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/14
 * Time: 下午4:51
 */
namespace App\Http\Validator;

use App\Rules\CompanyRule;

class CompanyValidator extends BaseValidator {
    // 更新是用到检查名字是否一致
    protected $id;
    public function __construct($id=0)
    {
        $this->id = $id;
    }
    /**
     * 创建账户验证规则
     * @param array $data
     * @return bool|mixed
     */
    public function createValidator(array $data)
    {
        $rules = [
            'name'           =>['required', new CompanyRule($this->id)],
            'app_coupon'     =>'integer',
            'agent_coupon'   =>'integer',
            'order_type'     =>'integer',
            'status'         =>'integer|between:0,1',
        ];
        //定义提示信息
        $messages = [
            'name.required'        => '保险公司为空',
            'app_coupon.integer'   =>'APP优惠方案格式不正确',
            'agent_coupon.integer' =>'代理优惠方案格式不正确',
            'order_type.integer'   =>'出单类型格式不正确',
            'status.integer'       =>'状态格式不正确',
            'status.between'       =>'状态格式不正确',
        ];
        //验证数据
        return $this->_postValidator($data, $rules, $messages);
    }
}