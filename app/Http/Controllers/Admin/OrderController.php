<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2019/2/25
 * Time: 下午4:46
 */

/**
 * @SWG\Tag(
 *   name="保险订单查询接口",
 *   description="保险订单查询相关接口",
 * )
 */

namespace App\Http\Controllers\Admin;
use App\Model\OrderPage;
use Illuminate\Http\Request;
use App\Exceptions\ApiException;
use App\Constants\StatusCodes;
use Illuminate\Support\Facades\DB;


class OrderController extends ApiController
{
    /**
     *
     * @SWG\Get(
     *     path="/admin/order/retrieve/{id}",
     *     summary="获取保险订单详情",
     *     tags={"保险订单查询接口"},
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
     *                  description="获取保险订单详情",
     *                  ref="$/definitions/OrderPage"
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
        $orderPage = OrderPage::where('id', $id)->first();
        if ($orderPage) {
            $company = $orderPage->company()->getResults();
            $orderPage['company'] = $company ? $company['name'] : '';
            return $this->_success($orderPage->toArray());
        }
        throw new ApiException(StatusCodes::getMessage(StatusCodes::ORDER_NOT_EXIST),
            StatusCodes::ORDER_NOT_EXIST);
    }

    /**
     *
     * @SWG\Get(
     *     path="/admin/order/retrieveall",
     *     summary="获取保险订单列表",
     *     tags={"保险订单查询接口"},
     *     @SWG\Parameter(
     *         name="name",
     *         type="string",
     *         in="query",
     *         description="车主姓名"
     *     ),
     *     @SWG\Parameter(
     *         name="mobile",
     *         type="string",
     *         in="query",
     *         description="用户手机号"
     *     ),
     *     @SWG\Parameter(
     *         name="time",
     *         type="string",
     *         in="query",
     *         description="保险到期日期"
     *     ),
     *     @SWG\Parameter(
     *         name="licenseno",
     *         type="string",
     *         in="query",
     *         description="车牌号"
     *     ),
     *     @SWG\Response(
     *          response=200,
     *          description="Example extended response",
     *          ref="$/responses/Json",
     *          @SWG\Schema(
     *              @SWG\Property(
     *                  property="result",
     *                  type="array",
     *                  description="保险订单列表",
     *                  @SWG\Items(
     *                      ref="#/definitions/OrderPage"
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
        $model = new OrderPage();
        if ($mobile = $request->input('mobile')) {
            $model = $model->where(function ($query) use ($mobile){
                $query->where('insuredmobile', 'like', '%'.$mobile.'%')->orWhere('holdermobile', 'like', '%'.$mobile.'%');
            });
        }
        if ($name = $request->input('name')) {
            $model = $model->where(function ($query) use ($name){
                $query->where('insuredname', '%'.$name.'%')->orWhere('holdername', '%'.$name.'%');
            });
        }
        // 日期格式，2019-02-22
        if ($time = $request->input('time')) {
            $model = $model->where(function ($query) use ($time){
                $query->where('businessenddate', $time)->orWhere('forceenddate', $time);
            });
        }
        if ($licenseno = $request->input('licenseno')) {
           $model = $model->where('licenseno', $licenseno);
        }
        $list = $model->select(['id','licenseno','carownersname','holdermobile','businessenddate','forceenddate','businessenddate','biztotal','forcetotal','taxtotal','target','agent_id','status', 'source'])->orderBy('id', 'desc')->paginate($request->input(PAGE_SIZE_NAME) ?? PAGE_SIZE , ['*'], PAGE_NUM_NAME);

        foreach ($list as $index=>$item) {
            $company = $item->company()->getResults();
            $list[$index]['company'] = $company ? $company['name'] : $item['source'];
        }
        return $this->_success($list->toArray());
    }
}