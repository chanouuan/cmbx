<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/8/28
 * Time: 上午11:21
 */

namespace App\Services;

/**
 * Redis键值对生成类
 * Class RedisKeys
 * @package App\Services
 *
 */
class RedisKeys
{
    /**
     * 测试例子
     * @param $resource
     * @param $viewType
     * @return string
     */
    public static function someKey($var) {
        return sprintf('insurance:somekey:%s', $var);
    }

    /**
     * 获取推荐方案设置列表
     * @param $type
     * @return string
     */
    public static function recommend($type) {
        return sprintf('insurance:recommend:%s', $type);
    }

    /**
     * 获取推荐方案设置设置列表
     * @param $type
     * @return string
     */
    public static function recommendFull($type) {
        return sprintf('insurance:recommendfull:%s', $type);
    }
}