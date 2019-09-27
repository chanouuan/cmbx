<?php

namespace App\Http\Controllers;

/**
 * @SWG\Swagger(
 *     swagger="2.0",
 *     schemes={"http"},
 *     basePath="/api/",
 *     @SWG\Info(
 *          title="保险后台接口",
 *          version="1.0",
 *          description="后台管理接口"
 *     )
 * )
 */

/**
 * @SWG\Response(
 *     response="Json",
 *     description="响应格式",
 *     @SWG\Schema(
 *          @SWG\Property(
 *              property="errNo",
 *              type="integer"
 *          ),
 *          @SWG\Property(
 *              property="result",
 *              type="object"
 *          ),
 *          @SWG\Property(
 *              property="message",
 *              type="string"
 *          )
 *      )
 * )
 *
 */

/**
 *
 * @SWG\SecurityScheme(
 *     securityDefinition="Bearer",
 *     type="apiKey",
 *     in="header",
 *     name="authorization"
 * )
 */

/**
 *  @SWG\Definition(
 *   definition="JsonDefinition",
 *          @SWG\Property(
 *              property="errNo",
 *              type="integer",
 *              description="状态码"
 *          ),
 *          @SWG\Property(
 *              property="message",
 *              type="string",
 *              description="状态消息"
 *          ),
 *          @SWG\Property(
 *              property="result",
 *              type="Array",
 *              description="数据内容"
 *          )
 * )
 */

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
