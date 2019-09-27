<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/19
 * Time: 下午6:35
 */
namespace App\Model;

use Illuminate\Http\Request;

class Error extends BaseModel
{
    const CREATED_AT = 'create_time';
    const UPDATED_AT = 'update_time';
    protected $table = 'error' ;
    /**
     *功能：捕捉系统错误
     *作者：秋词
     *时间:2018-11-27
     *版本:2.0.0
     * @param \Exception $e
     * @param Request $request
     * @return bool
     */
    public function add(\Exception $e , Request $request)
    {
        $err['url']          = $request->getRequestUri() ;
        $err['files']        = $e->getFile() ;
        $err['lines']        = $e->getLine() ;
        $err['message']      = $e->getMessage() ;
        $err['params']       = json_encode($request->post()) ;
        $err['status']       = 1 ;
        $err['method']       = $request->getMethod();
        $err['from']         = PLATFORM_TYPE;
        return $this->create($err);
    }
}