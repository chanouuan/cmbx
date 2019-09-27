<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/18
 * Time: 上午9:27
 */
namespace App\Services;

use App\Constants\StatusCodes;
use App\Exceptions\ApiException;
use Illuminate\Support\Facades\Log;

class SignatureService
{
    // 私钥
    private $secretKey;
    public function __construct($secret)
    {
        $this->secretKey = $secret;
    }

    /**
     * 生成签名
     * @param $arParams
     * @return string
     * @throws ApiException
     */
    public function encrypt($arParams)
    {
        // 签名十分钟过期
        if (time() - (int)($arParams['time'] ?? 0) > 600) {
            throw new ApiException(StatusCodes::getMessage(StatusCodes::SIG_EXPIRE), StatusCodes::SIG_EXPIRE);
        }
        // 去掉签名和框架参数s
        unset($arParams['sig']);
        unset($arParams['s']);
        // 按key排序
        ksort($arParams);
        // 拼接参数值与密钥，做md5加密
        return md5(implode('', $arParams) . $this->secretKey);
    }
}