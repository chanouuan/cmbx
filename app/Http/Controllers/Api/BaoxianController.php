<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Baoxian;
use App\Constants\StatusCodes;
use App\Services\SignatureService;
use App\Exceptions\ApiException;

/**
 * 保险
 */
class BaoxianController extends ApiController
{

    /**
     * 初始签名验证
     */
    public function __construct(Request $request) {
        $authResult = $this->checkSignPass($request->input());
        if ($authResult['errNo'] !== 0) {
            json(null, $authResult['message'], -1);
        }
    }

    /**
     * 获取用户车辆信息和去年投保信息
     */
    public function getReinfo(Request $request) {
        $baoxian = new Baoxian();
        $result = $baoxian->getReinfo($request->input());
        exit(json_unicode_encode($result));
    }

    /**
     * 请求报价/核保信息
     */
    public function postPrecisePrice(Request $request) {
        $baoxian = new Baoxian();
        $result = $baoxian->postPrecisePrice($request->input());
        exit(json_unicode_encode($result));
    }

    /**
     * 获取车辆报价信息
     */
    public function getPrecisePrice(Request $request) {
        $baoxian = new Baoxian();
        $result = $baoxian->getPrecisePrice($request->input());
        exit(json_unicode_encode($result));
    }

    /**
     * 提交个人补充信息
     */
    public function postStockInfo (Request $request) {
        $baoxian = new Baoxian();
        $result = $baoxian->postStockInfo($request->input());
        exit(json_unicode_encode($result));
    }

    /**
     * 创建保险订单
     */
    public function createOrder(Request $request) {
        $baoxian = new Baoxian();
        $result = $baoxian->createOrder($request->input());
        exit(json_unicode_encode($result));
    }

    /**
     * 订单通知（支付成功，通知订单更新状态）
     */
    public function notifyOrder (Request $request) {
        $baoxian = new Baoxian();
        $result = $baoxian->notifyOrder($request->input());
        exit(json_unicode_encode($result));
    }

    /**
     * 获取预返还优惠劵
     */
    public function getPrepareCoupon (Request $request) {
        $baoxian = new Baoxian();
        $result = $baoxian->getPrepareCoupon($request->input());
        exit(json_unicode_encode($result));
    }

    /**
     * 获取保司列表
     */
    public function getCompanyList () {
        $baoxian = new Baoxian();
        $result = $baoxian->getCompanyList();
        exit(json_unicode_encode($result));
    }

    /**
     * 获取投保城市
     */
    public function getInsuranceCity () {
        $baoxian = new Baoxian();
        $result = $baoxian->getInsuranceCity();
        exit(json_unicode_encode($result));
    }

    /**
     * 获取险种
     */
    public function getInsuranceClass () {
        $baoxian = new Baoxian();
        $result = $baoxian->getInsuranceClass();
        exit(json_unicode_encode($result));
    }

    /**
     * 配置信息
     */
    public function getInsuranceConfig () {
        $baoxian = new Baoxian();
        $result = [
            'IdType' => $baoxian->getOwnerIdType(),
            'CarUsedType' => $baoxian->getCarUsedType(),
            'BoliType' => $baoxian->getBoliType(),
            'CarType' => $baoxian->getCarType(),
            'FuelType' => $baoxian->getFuelType(),
            'ProofType' => $baoxian->getProofType(),
            'ClauseType' => $baoxian->getClauseType(),
            'LicenseColor' => $baoxian->getLicenseColor(),
            'RunRegion' => $baoxian->getRunRegion(),
            'IsPublic' => $baoxian->getIsPublic()
        ];
        exit(json_unicode_encode(success($result)));
    }

    /**
     * 生成签名参数测试地址
     */
    protected function testSign () {
        $url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
        $parts = parse_url($url);
        parse_str($parts['query'], $query);
        $query['time'] = $_SERVER['REQUEST_TIME'];
        $query['nonce_str'] = str_shuffle('abc0123456789');
        $query['sig'] = $this->setSign($query);
        $parts['query'] = http_build_query($query);
        exit($parts['scheme'] . '://' . $parts['host'] . $parts['path'] . '?' . $parts['query']);
    }

    /**
     * 生成每次请求的sign
     * @param array $data
     * @return string
     */
    protected function setSign($data = []) {
        if (!isset($data['time'])) {
            $data['time'] = $_SERVER['REQUEST_TIME'];
        }
        if (!isset($data['nonce_str'])) {
            $data['nonce_str'] = str_shuffle('abc0123456789');
        }
        $sigService = new SignatureService(env('APP_SECRET'));
        $string = $sigService->encrypt($data);
        return $string;
    }

    /**
     * 检查sign是否正常
     * @param array $data
     * @param $data
     * @return boolen
     */
    protected function checkSignPass($data = []) {
        if (empty($data)) {
            return success('');
        }
        $sigService = new SignatureService(env('APP_SECRET'));
        $sig = isset($data['sig']) ? $data['sig'] : null;
        try {
            if (!isset($sig) || $sigService->encrypt($data) != $sig) {
                return error(StatusCodes::getMessage(StatusCodes::SIG_ERROR));
            }
        } catch (ApiException $e) {
            return error($e->getMessage());
        }
        return success('OK');
    }
}
