<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/14
 * Time: 下午4:51
 */
namespace App\Http\Validator;

use App\Rules\CouponRule;

class CouponValidator extends BaseValidator {
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
            'name'            =>['required', new CouponRule($this->id)],
            'type'            =>'required',
            'main'            =>'required',
            'common_rate'     =>'integer|min:0|max:100',
            'park_rate'       =>'integer|min:0|max:100',
            'maintain_rate'   =>'integer|min:0|max:100',
            'insurance_rate'  =>'integer|min:0|max:100',
            'commission_rate' =>'integer|min:0|max:100',
        ];
        //定义提示信息
        $messages = [
            'name.required'           => '方案名称为空',
            'type.required'           =>'请输入方案类型',
            'main.required'           =>'请输入返还内容',
            'common_rate.integer'     =>'通用劵返还比例必须为0-100的整数',
            'park_rate.integer'       =>'停车劵返还比例必须为0-100的整数',
            'maintain_rate.integer'   =>'洗车保养劵返还比例必须为0-100的整数',
            'insurance_rate.integer'  =>'保险劵返还比例必须为0-100的整数',
            'commission_rate.integer' =>'佣金比例必须为0-100的整数',
            'common_rate.min'         =>'通用劵返还比例必须为0-100的整数',
            'park_rate.min'           =>'停车劵返还比例必须为0-100的整数',
            'maintain_rate.min'       =>'洗车保养劵返还比例必须为0-100的整数',
            'insurance_rate.min'      =>'保险劵返还比例必须为0-100的整数',
            'commission_rate.min'     =>'佣金比例必须为0-100的整数',
            'common_rate.max'         =>'通用劵返还比例必须为0-100的整数',
            'park_rate.max'           =>'停车劵返还比例必须为0-100的整数',
            'maintain_rate.max'       =>'洗车保养劵返还比例必须为0-100的整数',
            'insurance_rate.max'      =>'保险劵返还比例必须为0-100的整数',
            'commission_rate.max'     =>'佣金比例必须为0-100的整数',
        ];
        //验证数据
        return $this->_postValidator($data, $rules, $messages);
    }
}