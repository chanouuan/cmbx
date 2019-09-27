<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/17
 * Time: 下午4:07
 */

function var_exists ($obj, $var, $default = '')
{
    return isset($obj[$var]) ? $obj[$var] : $default;
}

function https_request ($url, $post = null, $headers = null, $timeout = 3, $encode = 'json', $reload = 1, $st = 0)
{
    $st = $st ? $st : microtime_float();
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_TIMEOUT, $timeout);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
    if ($headers) {
        curl_setopt($curl, CURLOPT_HTTPHEADER, explode('&', str_replace('=', ':', urldecode(http_build_query($headers)))));
    }
    if ($post) {
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($curl, CURLOPT_POSTFIELDS, is_array($post) ? http_build_query($post) : $post);
    }
    $reponse = curl_exec($curl);
    if (curl_errno($curl)) {
        if ($reload > 0) {
            curl_close($curl);
            return https_request($url, $post, $headers, $timeout, $encode, $reload - 1, $st);
        }
        $error = curl_error($curl);
        $log = [
            '[Args] ' . json_unicode_encode(func_get_args()),
            '[Info] ' . json_unicode_encode(curl_getinfo($curl)),
            '[Fail] ' . $error,
            '[Time] ' . round(microtime_float() - $st, 3) . 's'
        ];
        \Illuminate\Support\Facades\Log::info(implode("\r\n", $log));
        curl_close($curl);
        throw new \Exception($error);
    }
    curl_close($curl);
    if ($encode == 'json') {
        if (!$reponse) {
            return [];
        }
        return json_decode($reponse, true);
    }
    return $reponse;
}

function microtime_float ()
{
    return array_sum(explode(' ', microtime()));
}

function success ($data, $message = '', $errorcode = 0)
{
    if (empty($message)) {
        $message = !is_array($data) ? $data : $message;
    }
    return [
        'errNo' => $errorcode,
        'message' => $message,
        'result' => is_array($data) ? $data : []
    ];
}

function error ($data, $message = '', $errorcode = -1)
{
    if (empty($message)) {
        $message = !is_array($data) ? $data : $message;
    }
    return [
        'errNo' => $errorcode,
        'message' => $message,
        'result' =>  is_array($data) ? $data : []
    ];
}

function json ($data, $message = '', $errorcode = 0, $httpcode = 200) {
    if ($httpcode) {
        http_response_code($httpcode);
    }
    header('Content-Type: application/json; charset=utf-8');
    if ($errorcode >= 0) {
        echo json_unicode_encode(success($data, $message, $errorcode));
    } else {
        echo json_unicode_encode(error($data, $message, $errorcode));
    }
    exit(0);
}

function json_unicode_encode ($data, $default = '')
{
    // JSON_FORCE_OBJECT | JSON_UNESCAPED_UNICODE
    return empty($data) ? $default : json_encode($data, JSON_UNESCAPED_UNICODE);
}

function json_mysql_encode ($data)
{
    $data = json_unicode_encode($data);
    $data = str_replace([
        '\\\\\\\\\'',
        '\\\\\\\\\\\\"',
        '\\\\\\\\\\\\\\\\'
    ], [
        '\'',
        '\\"',
        '\\\\\\\\'
    ], addslashes($data));
    return $data;
}

function is_car_license($license)
{
    if (empty($license)) {
        return false;
    }

    //匹配民用车牌和使馆车牌
    //判断标准
    //1，第一位为汉字省份缩写
    //2，第二位为大写字母城市编码
    //3，后面是5位仅含字母和数字的组合
    $regular = "/[京津冀晋蒙辽吉黑沪苏浙皖闽赣鲁豫鄂湘粤桂琼川贵云渝藏陕甘青宁新使]{1}[A-Z]{1}[0-9a-zA-Z]{5,6}$/u";
    preg_match($regular, $license, $match);
    if (isset($match[0])) {
        return true;
    }

    //匹配特种车牌(挂,警,学,领,港,澳)
    //参考 https://wenku.baidu.com/view/4573909a964bcf84b9d57bc5.html
    $regular = '/[京津冀晋蒙辽吉黑沪苏浙皖闽赣鲁豫鄂湘粤桂琼川贵云渝藏陕甘青宁新]{1}[A-Z]{1}[0-9a-zA-Z]{4}[挂警学领港澳]{1}$/u';
    preg_match($regular, $license, $match);
    if (isset($match[0])) {
        return true;
    }

    //匹配武警车牌
    //参考 https://wenku.baidu.com/view/7fe0b333aaea998fcc220e48.html
    $regular = '/^WJ[京津冀晋蒙辽吉黑沪苏浙皖闽赣鲁豫鄂湘粤桂琼川贵云渝藏陕甘青宁新]?[0-9a-zA-Z]{5}$/ui';
    preg_match($regular, $license, $match);
    if (isset($match[0])) {
        return true;
    }

    //匹配军牌
    //参考 http://auto.sina.com.cn/service/2013-05-03/18111149551.shtml
    $regular = "/[A-Z]{2}[0-9]{5}$/";
    preg_match($regular, $license, $match);
    if (isset($match[0])) {
        return true;
    }

    return false;
}

function db_tableid ($insertid, $database = 0)
{
    $tablenum = 1000;
    $tableid = $insertid % $tablenum;
    $tableid = $tableid == 0 ? $tablenum : $tableid;
    $tableid = $tablenum - $tableid;
    return ($tableid < 0 || $tableid > $database) ? false : $tableid;
}

function db_insertid ($tablename, $maxid = 0, $database = 0)
{
    $tablenum = 1000;
    if ($tablename < 0 || $tablename > $database) {
        return false;
    }
    $insertid = $maxid > 0 ? (($maxid + $tablename) / $tablenum) + 1 : 1;
    if (is_float($insertid)) {
        return false;
    }
    return $insertid * $tablenum - $tablename;
}

function db_hashid ($data, $database = 0)
{
    return sprintf("%u", crc32($data)) % $database;
}

function show_page_table ($source)
{
    $tables = DB::select('SHOW TABLES');
    $tables = array_map('current', $tables);
    $tables = array_filter($tables, function ($table) use ($source) {
        return preg_match('/^' . $source . '_page_[0-9]+/', $table);
    });
    return $tables;
}
