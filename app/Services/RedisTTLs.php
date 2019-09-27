<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/8/30
 * Time: 下午3:06
 */

namespace App\Services;


class RedisTTLs
{
    /**
     * 获取redis1分钟缓存时间
     */
    public static function oneMinute() {
        return 60;
    }

    /**
     * 获取redis1分钟缓存时间
     */
    public static function tenMinute() {
        return 600;
    }

    /**
     * 获取redis1分钟缓存时间
     */
    public static function halfHour() {
        return 1800;
    }

    /**
     * 获取redis过期时间, 2小时过去，时间会随机参数
     * @return int
     */
    public static function twoHours() {
        // 10分钟为单位：600秒，8分钟-13分钟随机
        return mt_rand(8, 13) * 600;
    }

    /**
     * 获取一天redis过期时间
     * @return float|int
     */
    public static function wholeDay() {
        // 完整1天缓存
        return 86400;
    }

    /**
     * 获取一天redis过期时间
     * @return float|int
     */
    public static function oneDay() {
        // 半小时为单位：30分钟=1800秒，20小时-25小时随机
        return mt_rand(40, 50) * 1800;
    }

    /**
     * 获取半天redis过期时间
     * @return float|int
     */
    public static function halfDay () {
        // 10分钟为单位：600秒, 11小时-13小时随机
        return mt_rand(66, 78) * 600;
    }

    /**
     * 获取半个月redis过期时间
     * @return float|int
     */
    public static function halfMonth() {
        // 小时为单位：3600秒，14天-16天随机
        return mt_rand(336, 384) * 3600;
    }

    /**
     * 获取一个月redis过期时间
     * @return float|int
     */
    public static function oneMonth() {
        // 小时为单位：3600秒，28天-31天随机
        return mt_rand(672, 744) * 3600;
    }
}