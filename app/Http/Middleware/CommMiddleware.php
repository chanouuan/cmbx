<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2019/1/25
 * Time: 下午2:46
 */

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Log;

/**
 * 通用中间件
 * Class CommMiddleware
 * @package App\Http\Middleware
 */
class CommMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        Log::info($request->all());
        // 定义常量
        define('PLATFORM_TYPE', PLATFORM_TYPES[strtolower($request->input('deviceInfo.client','android'))] ?? PLATFORM_TYPES['android']);
        return $next($request);
    }
}