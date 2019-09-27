<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2019/2/25
 * Time: 下午4:46
 */

/**
 * @SWG\Tag(
 *   name="保险公司接口",
 *   description="保险公司管理相关接口",
 * )
 */

namespace App\Http\Controllers\Admin;
use App\Http\Validator\CompanyValidator;
use App\Model\Company;
use Illuminate\Http\Request;
use App\Exceptions\ApiException;
use App\Constants\StatusCodes;


class CompanyController extends ApiController
{
    /**
     *
     * @SWG\Post(
     *     path="/admin/company/create",
     *     summary="添加保险公司",
     *     tags={"保险公司接口"},
     *     @SWG\Parameter(
     *         name="name",
     *         type="string",
     *         in="query",
     *         required=true,
     *         description="公司名称"
     *     ),
     *     @SWG\Parameter(
     *         name="app_coupon",
     *         type="integer",
     *         in="query",
     *         description="APP优惠方案ID"
     *     ),
     *     @SWG\Parameter(
     *         name="agent_coupon",
     *         type="integer",
     *         in="query",
     *         description="代理优惠方案ID"
     *     ),
     *     @SWG\Parameter(
     *         name="order_type",
     *         type="integer",
     *         in="query",
     *         description="出单类型：1 壁虎车险"
     *     ),
     *     @SWG\Parameter(
     *         name="status",
     *         type="integer",
     *         in="query",
     *         description="状态：0 禁用 1 启用"
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
        $arPost = $request->only(['name','app_coupon', 'agent_coupon', 'order_type', 'status']);
        // 默认状态：开启
        $arPost['status'] = $arPost['status'] ?? 1;
        $validator = new CompanyValidator();
        if (($validatorResult = $validator->createValidator($arPost)) !== true) {
            throw new ApiException($validatorResult , StatusCodes::COMPANY_CREATE_PARAMETER_ERROR);
        }
        $company = Company::create($arPost);
        return $this->_success($company->toArray());
    }

    /**
     *
     * @SWG\Get(
     *     path="/admin/company/retrieve/{id}",
     *     summary="获取保险公司详情",
     *     tags={"保险公司接口"},
     *     @SWG\Parameter(
     *         name="id",
     *         type="integer",
     *         in="path",
     *         required=true,
     *         description="保险公司ID"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  description="获取保险公司详情",
     *                  ref="$/definitions/Company"
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
        $coupon = Company::where('id', $id)->first();
        if ($coupon) {
            return $this->_success($coupon->toArray());
        }
        throw new ApiException(StatusCodes::getMessage(StatusCodes::COUPON_NOT_EXIST),
            StatusCodes::COUPON_NOT_EXIST);
    }

    /**
     *
     * @SWG\Get(
     *     path="/admin/company/retrieveall",
     *     summary="获取保险公司列表",
     *     tags={"保险公司接口"},
     *     @SWG\Parameter(
     *         name="name",
     *         type="string",
     *         in="query",
     *         description="公司名称"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  type="array",
     *                  description="保险公司列表",
     *                  @SWG\Items(
     *                      ref="#/definitions/Company"
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
        $list = Company::where($where)->orderBy('id', 'desc')->paginate($request->input(PAGE_SIZE_NAME) ?? PAGE_SIZE , ['*'], PAGE_NUM_NAME);
        return $this->_success($list->toArray());
    }

    /**
     *
     * @SWG\Post(
     *     path="/admin/company/update/{id}",
     *     summary="修改保险公司详情",
     *     tags={"保险公司接口"},
     *     @SWG\Parameter(
     *         name="id",
     *         type="integer",
     *         in="path",
     *         required=true,
     *         description="保险公司ID"
     *     ),
     *     @SWG\Parameter(
     *         name="name",
     *         type="string",
     *         in="query",
     *         required=true,
     *         description="公司名称"
     *     ),
     *     @SWG\Parameter(
     *         name="app_coupon",
     *         type="integer",
     *         in="query",
     *         required=true,
     *         description="APP优惠方案ID"
     *     ),
     *     @SWG\Parameter(
     *         name="agent_coupon",
     *         type="integer",
     *         in="query",
     *         required=true,
     *         description="代理优惠方案ID"
     *     ),
     *     @SWG\Parameter(
     *         name="order_type",
     *         type="integer",
     *         in="query",
     *         description="出单类型：1 壁虎车险"
     *     ),
     *     @SWG\Parameter(
     *         name="status",
     *         type="integer",
     *         in="query",
     *         description="状态：0 禁用 1 启用"
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
        $arPost = $request->only(['name','app_coupon', 'agent_coupon', 'order_type', 'status']);
        $validator = new CompanyValidator($id);
        if (($validatorResult = $validator->createValidator($arPost)) !== true) {
            throw new ApiException($validatorResult , StatusCodes::COUPON_UPDATE_PARAMETER_ERROR);
        }
        $coupon = Company::where('id', $id)->first();
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
     *     path="/admin/company/delete/{id}",
     *     summary="删除保险公司",
     *     tags={"保险公司接口"},
     *     @SWG\Parameter(
     *         name="id",
     *         type="integer",
     *         in="path",
     *         required=true,
     *         description="保险公司ID"
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
        $res = Company::where('id', $id)->delete();

        if (!$res) {
            throw new ApiException(StatusCodes::getMessage(StatusCodes::COMPANY_DELETE_ERROR),
                StatusCodes::COMPANY_DELETE_ERROR);
        }
        return $this->_status(1);
    }
}