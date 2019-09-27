<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware'=>'api'], function () {
//    Route::get('/user', function (Request $request) {
//        return $request->user();
//    });
//    Route::middleware('auth:api')->get('/user', function (Request $request) {
//        return $request->user();
//    });
    Route::any('/getInsuranceConfig','Api\BaoxianController@getInsuranceConfig');
    Route::any('/getInsuranceCity','Api\BaoxianController@getInsuranceCity');
    Route::any('/getInsuranceClass','Api\BaoxianController@getInsuranceClass');
    Route::any('/getCompanyList','Api\BaoxianController@getCompanyList');
    Route::post('/getReinfo','Api\BaoxianController@getReinfo');
    Route::post('/postPrecisePrice','Api\BaoxianController@postPrecisePrice');
    Route::post('/getPrecisePrice','Api\BaoxianController@getPrecisePrice');
    Route::post('/postStockInfo','Api\BaoxianController@postStockInfo');
    Route::post('/createOrder','Api\BaoxianController@createOrder');
    Route::post('/notifyOrder','Api\BaoxianController@notifyOrder');
    Route::post('/getPrepareCoupon','Api\BaoxianController@getPrepareCoupon');
});

Route::namespace('Admin')->group(function () {
    Route::group(['prefix' => 'admin'], function () {
        Route::group(['prefix' => 'coupon'], function () {
            Route::post('create', 'CouponController@create');
            Route::get('retrieve/{id}','CouponController@retrieve');
            Route::get('retrieveall','CouponController@retrieveAll');
            Route::post('update/{id}','CouponController@update');
            Route::post('delete/{id}','CouponController@delete');
        });

        Route::group(['prefix' => 'company'], function () {
            Route::post('create', 'CompanyController@create');
            Route::get('retrieve/{id}','CompanyController@retrieve');
            Route::get('retrieveall','CompanyController@retrieveAll');
            Route::post('update/{id}','CompanyController@update');
            Route::post('delete/{id}','CompanyController@delete');
        });

        Route::group(['prefix' => 'order'], function () {
            Route::get('retrieve/{id}','OrderController@retrieve');
            Route::get('retrieveall','OrderController@retrieveAll');
        });

        Route::group(['prefix' => 'config'], function () {
            Route::get('recommend/{type}','ConfigController@recommend');
            Route::get('recommend/full/{type}','ConfigController@fullRecommend');
            Route::post('recommend/update/{type}','ConfigController@updateRecommend');
        });
    });
});
