<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2019/2/25
 * Time: 下午4:46
 */

/**
 * @SWG\Tag(
 *   name="优惠券方案接口",
 *   description="优惠券方案管理相关接口",
 * )
 */

namespace App\Http\Controllers\Admin;
use App\Http\Validator\CouponValidator;
use App\Model\Coupon;
use Illuminate\Http\Request;
use App\Exceptions\ApiException;
use App\Constants\StatusCodes;


class CouponController extends ApiController
{
    /**
     *
     * @SWG\Post(
     *     path="/admin/coupon/create",
     *     summary="添加优惠券",
     *     tags={"优惠券方案接口"},
     *     @SWG\Parameter(
     *         name="name",
     *         type="string",
     *         in="query",
     *         required=true,
     *         description="方案名称"
     *     ),
     *     @SWG\Parameter(
     *         name="type",
     *         type="integer",
     *         in="query",
     *         required=true,
     *         description="方案类型：1 APP优惠 2 代理优惠"
     *     ),
     *     @SWG\Parameter(
     *         name="main",
     *         type="integer",
     *         in="query",
     *         required=true,
     *         description="返还内容：1 交强+商业 2 交强险 3 商业险"
     *     ),
     *     @SWG\Parameter(
     *         name="common_rate",
     *         type="integer",
     *         in="query",
     *         description="通用劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="park_rate",
     *         type="integer",
     *         in="query",
     *         description="停车劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="maintain_rate",
     *         type="integer",
     *         in="query",
     *         description="洗车保养劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="insurance_rate",
     *         type="integer",
     *         in="query",
     *         description="保险劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="commission_rate",
     *         type="integer",
     *         in="query",
     *         description="佣金比例 0-100"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  ref="$/definitions/ReturnStatus"
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function create(Request $request) {
        $arPost = $request->only(['name','type', 'main', 'common_rate', 'park_rate', 'maintain_rate', 'insurance_rate', 'commission_rate']);
        $validator = new CouponValidator();
        if (($validatorResult = $validator->createValidator($arPost)) !== true) {
            throw new ApiException($validatorResult , StatusCodes::COUPON_CREATE_PARAMETER_ERROR);
        }
        $coupon = Coupon::create($arPost);
        return $this->_success($coupon->toArray());
    }

    /**
     *
     * @SWG\Get(
     *     path="/admin/coupon/retrieve/{id}",
     *     summary="获取优惠详情",
     *     tags={"优惠券方案接口"},
     *     @SWG\Parameter(
     *         name="id",
     *         type="integer",
     *         in="path",
     *         required=true,
     *         description="优惠方案ID"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  description="获取优惠详情",
     *                  ref="$/definitions/Coupon"
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function retrieve(int $id) {
        $coupon = Coupon::where('id', $id)->first();
        if ($coupon) {
            return $this->_success($coupon->toArray());
        }
        throw new ApiException(StatusCodes::getMessage(StatusCodes::COUPON_NOT_EXIST),
            StatusCodes::COUPON_NOT_EXIST);
    }

    /**
     *
     * @SWG\Get(
     *     path="/admin/coupon/retrieveall",
     *     summary="获取优惠列表",
     *     tags={"优惠券方案接口"},
     *     @SWG\Parameter(
     *         name="name",
     *         type="string",
     *         in="query",
     *         description="方案名称"
     *     ),
     *     @SWG\Parameter(
     *         name="type",
     *         type="integer",
     *         in="query",
     *         description="方案类别"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  type="array",
     *                  description="优惠券方案列表",
     *                  @SWG\Items(
     *                      ref="#/definitions/Coupon"
     *                  )
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function retrieveAll(Request $request) {
        $where = [];
        if ($name = $request->input('name')) {
            $where[] = ['name', 'like', '%'.$name.'%'];
        }
        if ($type = $request->input('type')) {
            $where[] = ['type', $type];
        }
        if ($request->input(PAGE_NUM_NAME)) {
            $list = Coupon::where($where)->orderBy('id', 'desc')->paginate($request->input(PAGE_SIZE_NAME) ?? PAGE_SIZE , ['*'], PAGE_NUM_NAME);
        } else {
            $list = Coupon::where($where)->orderBy('id', 'desc')->get();
        }
        return $this->_success($list->toArray());
    }

    /**
     *
     * @SWG\Post(
     *     path="/admin/coupon/update/{id}",
     *     summary="修改优惠方案",
     *     tags={"优惠券方案接口"},
     *     @SWG\Parameter(
     *         name="id",
     *         type="integer",
     *         in="path",
     *         required=true,
     *         description="优惠方案ID"
     *     ),
     *     @SWG\Parameter(
     *         name="name",
     *         type="string",
     *         in="query",
     *         required=true,
     *         description="方案名称"
     *     ),
     *     @SWG\Parameter(
     *         name="type",
     *         type="integer",
     *         in="query",
     *         required=true,
     *         description="方案类型：1 APP优惠 2 代理优惠"
     *     ),
     *     @SWG\Parameter(
     *         name="main",
     *         type="integer",
     *         in="query",
     *         required=true,
     *         description="返还内容：1 交强+商业 2 交强险 3 商业险"
     *     ),
     *     @SWG\Parameter(
     *         name="common_rate",
     *         type="integer",
     *         in="query",
     *         description="通用劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="park_rate",
     *         type="integer",
     *         in="query",
     *         description="停车劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="maintain_rate",
     *         type="integer",
     *         in="query",
     *         description="洗车保养劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="insurance_rate",
     *         type="integer",
     *         in="query",
     *         description="保险劵返还比例 0-100"
     *     ),
     *     @SWG\Parameter(
     *         name="commission_rate",
     *         type="integer",
     *         in="query",
     *         description="佣金比例 0-100"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  ref="$/definitions/ReturnStatus"
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function update(Request $request, $id) {
        $arPost = $request->only(['name','type', 'main', 'common_rate', 'park_rate', 'maintain_rate', 'insurance_rate', 'commission_rate']);
        $validator = new CouponValidator($id);
        if (($validatorResult = $validator->createValidator($arPost)) !== true) {
            throw new ApiException($validatorResult , StatusCodes::COUPON_UPDATE_PARAMETER_ERROR);
        }
        $coupon = Coupon::where('id', $id)->first();
        if (!$coupon) {
            throw new ApiException(StatusCodes::getMessage(StatusCodes::COUPON_NOT_EXIST),
                StatusCodes::COUPON_NOT_EXIST);
        }
        foreach ($arPost as $field=>$fval) {
            $coupon->$field = $fval;
        }
        return $this->_status($coupon->save());
    }

    /**
     *
     * @SWG\Post(
     *     path="/admin/coupon/delete/{id}",
     *     summary="删除优惠方案",
     *     tags={"优惠券方案接口"},
     *     @SWG\Parameter(
     *         name="id",
     *         type="integer",
     *         in="path",
     *         required=true,
     *         description="优惠方案ID"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  ref="$/definitions/ReturnStatus"
     *              )
     *          )
     *     ),
     *     @SWG\Response(
     *         response="404",
     *         description="接口地址错误"
     *     ),
     * )
     */
    public function delete($id) {
        $res = Coupon::where('id', $id)->delete();
        if (!$res) {
            throw new ApiException(StatusCodes::getMessage(StatusCodes::COUPON_DELETE_ERROR),
                StatusCodes::COUPON_DELETE_ERROR);
        }
        return $this->_status(1);
    }
}