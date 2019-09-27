<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/26
 * Time: 下午3:29
 */
namespace App\Http\Controllers;



use function Swagger\scan;

class SwaggerController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function index()
    {
        $swagger = scan(dirname(__DIR__) . '/../', ['exclude'=>['BaoxianController.php']]);
        return response()->json($swagger);
    }
}