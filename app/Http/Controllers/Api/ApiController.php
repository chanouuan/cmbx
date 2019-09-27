<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Model\Error;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;

/**
 *功能:Api公共控制器
 *时间:2018-12-14
 *版本:2.0.0
 */
class ApiController extends Controller
{
    private $_request ;
    public function __construct(Request $request)
    {
        $this->_request = $request ;
    }

    /**
     *功能：成功返回
     *作者：秋词
     *时间:2019-01-09
     *版本:2.0.0
     * @param array $data
     * @param array $action
     * @return false|string
     */
    protected function _success(array $data){
        $result['errNo'] = 0 ;
        $result['message'] = '操作成功' ;
        $result['result'] = $data ;
        return response()->json($result);
    }

    /**
     *功能：成功返回
     *作者：秋词
     *时间:2019-01-09
     *版本:2.0.0
     * @param array $data
     * @param array $action
     * @return false|string
     */
    protected function _status(int $status, string $msg = ''){
        $result['errNo'] = 0 ;
        $result['message'] = '操作成功' ;
        $result['result'] = ['status'=>$status, 'msg'=>$msg];
        return response()->json($result);
    }

    /**
     *功能：失败返回
     *作者：秋词
     *时间:2019-01-09
     *版本:2.0.0
     * @param int $errNo
     * @param string $message
     * @return false|string
     */
    protected function _fail(int $errNo , string $message){
        $result['errNo'] = $errNo ;
        $result['message'] = $message ;
        $result['result'] = [] ;
        return response()->json($result);
    }

    /**
     *功能：api接口统一返回
     *作者：秋词
     *时间:2019-01-15
     *版本:2.0.0
     * @param int $errNO
     * @param string $message
     * @param array $data
     * @return false|string
     */
    protected function _api(int $errNO , string $message , array $data = []){
        $result['errNo'] = $errNO ;
        $result['message'] = $message ;
        $result['result'] = $data ;
        return response()->json($result);
    }

    /**
     *功能：添加错误日志
     *作者：秋词
     *时间:2018-12-14
     *版本:2.0.0
     * @param \Exception $e
     * @param Request $request
     * @return bool
     */
    protected function _addError(\Exception $e , Request $request){
        try{
            $errModel = new Error() ;
            $errModel->add($e , $request) ;
            return true ;
        }catch (\Exception $e){
            Log::error($e) ;
            return false ;
        }
    }
}
