<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/login', function () {
    return app()->version();
})->name('login');

$router->group(['prefix' => ''], function () use ($router) {
    $router->get('/swagger/index', 'SwaggerController@index');
});
