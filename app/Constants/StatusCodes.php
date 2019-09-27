<?php
/**
 * Created by PhpStorm.
 * User: Law
 * Date: 2018/5/29
 * Time: 14:41
 */

namespace App\Constants;
class StatusCodes
{
    const STATUS_OK                          = 200;
    const STATUS_ERROR                       = 500;

    const TOKEN_VALIDATE_FAIL                = 3001;
    const TOKEN_UNAUTHORIZED                 = 3002;
    const SIG_EXPIRE                         = 3003;
    const SIG_ERROR                          = 3004;
    const REQUEST_METHOD_ERROR               = 3005;

    const USER_PARAMETER_ERROR               = 5001;

    const COUPON_CREATE_PARAMETER_ERROR      = 6001;
    const COUPON_NOT_EXIST                   = 6002;
    const COUPON_UPDATE_PARAMETER_ERROR      = 6003;
    const COUPON_DELETE_ERROR                = 6004;
    const COMPANY_CREATE_PARAMETER_ERROR     = 6005;
    const COMPANY_DELETE_ERROR               = 6006;
    const ORDER_NOT_EXIST                    = 6007;
    const CONFIG_UPDATE_PARAMETER_ERROR      = 6008;
    const CONFIG_FIND_PARAMETER_ERROR        = 6009;


    static $message = array(
        200  => '成功',
        500  => '未知错误',
        3001 => 'token验证失败',
        3002 => '请求未授权',
        3003 => '签名过期',
        3004 => '签名错误',
        3005 => '请求方法错误',
        5001 => '用户参数错误',
        6001 => '创建优惠券方案参数错误',
        6002 => '优惠券方案不存在',
        6003 => '修改优惠券方案参数错误',
        6004 => '删除优惠券方案失败',
        6005 => '创建保险公司参数错误',
        6006 => '删除保险公司信息失败',
        6007 => '订单信息不存在',
        6008 => '更新推荐方案参数错误',
        6009 => '获取推荐方案参数错误',
    );

    public static function getMessage(int $code) {
        return self::$message[$code] ?? '';
    }
}