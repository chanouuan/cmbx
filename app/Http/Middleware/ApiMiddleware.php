<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/18
 * Time: 上午9:24
 */
namespace App\Http\Middleware;

use App\Constants\StatusCodes;
use App\Exceptions\ApiException;
use App\Services\SignatureService;
use Closure;
use Illuminate\Support\Facades\Log;

class ApiMiddleware
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
//        $sigService = new SignatureService(env('APP_SECRET'));
//        $sig = $request->input('sig');
//        if (!isset($sig) || $sigService->encrypt($request->all()) != $sig) {
//            throw new ApiException(StatusCodes::getMessage(StatusCodes::SIG_ERROR), StatusCodes::SIG_ERROR);
//        }
        return $next($request);
    }
}
