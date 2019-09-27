<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/5/31
 * Time: 下午5:27
 */

namespace App\Exceptions;


use App\Constants\StatusCodes;
use Throwable;

class ApiException extends \Exception
{
    public $status = StatusCodes::STATUS_OK;

    public function __construct($message = "", $code = 0, Throwable $previous = null, $status= 500)
    {
        $this->status = $status;
        parent::__construct($message, $code, $previous);
    }

    /**
     * @return int
     */
    public function getStatus(): int
    {
        return $this->status;
    }

    /**
     * @param int $status
     */
    public function setStatus(int $status)
    {
        $this->status = $status;
    }
}