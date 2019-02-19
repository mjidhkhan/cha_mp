<?php
require_once dirname(__DIR__) . "/config/config.php";

$id = explode('=', $_SERVER['REQUEST_URI']);
if (array_key_exists('1', $id)) {
    if ($id[1] != '') {
        define('ID', $id[1]);
    }
} else {
    define('ID', '');
}
$type = explode('/', $id[0]);
if (sizeof($type)>=4){
    if ($type[3] == 'v' || $type[3] == 'nv') {
        define('TYPE', $type[3]);
    }else{
        define('TYPE', $type[3]);
    }
}else{
    define('TYPE', 'N');
}

