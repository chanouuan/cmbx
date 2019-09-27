<?php
/**
 * Created by PhpStorm.
 * User: yangkunlin
 * Date: 2018/12/14
 * Time: 下午4:20
 */

namespace App\Model;
use Illuminate\Database\Eloquent\Model;


/**
 * @SWG\Definition(
 *   definition="ReturnStatus",
 *              @SWG\Property(
 *                  property="status",
 *                  type="integer",
 *                  description="1成功，0失败"
 *              ),
 *              @SWG\Property(
 *                  property="msg",
 *                  type="string",
 *                  description="错误原因"
 *              )
 * )
 */
class BaseModel extends Model
{
    protected $guarded = [];
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    const UPDATED_AT = null;
    const CREATED_AT = 'create_time';
    private $_hidden = [];
    public $useCamelCase = false;
    /**
     * 重写模型类,在输入数组时将属性名转为驼峰式命名
     * @param  array  $values [description]
     * @return [type]         [description]
     */
    protected function getArrayableItems(array $values){
        if (!$this->useCamelCase) {
            return $values;
        }
        if (count($this->visible) > 0) {
            $values = $this->camelCaseAttributes(array_intersect_key($values, array_flip($this->visible)));
        } else {
            $values = $this->camelCaseAttributes($values);
        }

        $values = array_diff_key($values, $this->_hidden);
        if (count($this->hidden) == 0) {
            return $values;
        }
        return array_diff_key($values, array_flip($this->hidden));
    }

    private function camelCaseAttributes(array $values) {
        foreach ($values as $key => $value) {
            if (strpos($key, '_') && !in_array($key, $this->hidden)) {
                $values[camel_case($key)] = $values[$key];
                $this->_hidden[$key] = 0;
            }
        }
        return $values;
    }
}