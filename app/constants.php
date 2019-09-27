<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/15
 * Time: 上午10:38
 */


defined('PLATFORM_TYPES')    or define('PLATFORM_TYPES', array('android'=>1,'ios'=>2,'manage'=>1,'other'=>9));
defined('PAGE_SIZE')               or define('PAGE_SIZE', 25);
defined('PAGE_SIZE_NAME')          or define('PAGE_SIZE_NAME', 'limit');
defined('PAGE_NUM_NAME')           or define('PAGE_NUM_NAME', 'page');
defined('INSURANCE_ORDER_TABLE_NAME') or define('INSURANCE_ORDER_TABLE_NAME', 'order_page_'.date('Ym'));
