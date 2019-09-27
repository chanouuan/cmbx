<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // 监听查询事件
        DB::listen(function ($query) {
            // $query->sql
            // $query->bindings
            // $query->time
            $info = [
                '[ Sql ] ' . $query->sql,
                '[ Bindings ] ' . urldecode(http_build_query($query->bindings)),
                '[ Time ] ' . ($query->time / 1000)
            ];
            Log::info(implode(' ', $info));
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
