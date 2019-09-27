<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use App\Constants\StatusCodes;
use App\Model\Error;
use Illuminate\Support\Facades\Log;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param  \Exception  $exception
     * @return void
     */
    public function report(Exception $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $exception)
    {
        Log::error($exception);
        // 保存错误日志
        $error = new Error();
        $error->add($exception, $request);
        $className = explode('\\', get_class($exception));
        if ($request->is('api/*')) {
            // 处理错误日志
            switch (array_pop($className))
            {
                case 'ValidationException':
                    return response()->json(['message' => $exception->validator->errors(), 'errNo' => StatusCodes::USER_PARAMETER_ERROR, 'result' => []],StatusCodes::STATUS_OK, [], JSON_FORCE_OBJECT);
                    break;
                case 'InvalidArgumentException':
                    return response()->json(['message' => $exception->getMessage(), 'errNo' => StatusCodes::USER_PARAMETER_ERROR, 'result' => []],StatusCodes::STATUS_OK, [], JSON_FORCE_OBJECT);
                    break;
                case 'NotFoundHttpException':
                    return response()->json(['message' => 'API Not Found', 'errNo' => 404, 'result' => []], 404, [], JSON_FORCE_OBJECT);
                    break;
                case 'MethodNotAllowedHttpException':
                    return response()->json(['message' => StatusCodes::getMessage(StatusCodes::REQUEST_METHOD_ERROR), 'errNo' => StatusCodes::REQUEST_METHOD_ERROR, 'result' => []], 404, [], JSON_FORCE_OBJECT);
                    break;
                case 'ApiException':
                    return response()->json(['message' => $exception->getMessage(), 'errNo' => $exception->getCode(), 'result' => []], StatusCodes::STATUS_OK, [], JSON_FORCE_OBJECT);
                    break;
                case 'UnauthorizedHttpException':
                case 'JWTException':
                case 'TokenInvalidException':
                case 'InvalidClaimException':
                case 'PayloadValidator':
                case 'TokenBlacklistedException':
                case 'TokenExpiredException':
                case 'UserNotDefinedException':
                    return response()->json(["message" => __('exception.'.$exception->getMessage()), "errNo" => StatusCodes::TOKEN_VALIDATE_FAIL, 'result'=>[]], StatusCodes::STATUS_OK, [], JSON_FORCE_OBJECT);
                    break;
                default:
                    return response()->json(["message" => $exception->getMessage(), "errNo" => StatusCodes::STATUS_ERROR, 'result'=>[]], StatusCodes::STATUS_ERROR, [], JSON_FORCE_OBJECT);
            }
        }
        return parent::render($request, $exception);
    }
}
