<?php

define('TEMPLATES', dirname(__DIR__) . '/layouts/partials/');
define('PAGES', dirname(__DIR__) . '/layouts/pages/');
define('CONFIG', dirname(__DIR__) . '/config/');
define('CLASSES', dirname(__DIR__) . '/classes/');
define('IMAGES', '/static/images/');
define('DB', dirname(__DIR__) . '/settings/');
define('admin', dirname(__DIR__) . '/pages/admin/');
define('client', dirname(__DIR__) . '/pages/client/');

define('AUTOLOAD', dirname(__DIR__));

require AUTOLOAD . '/vendor/Autoload.php';

function autoload($class)
{
    if (file_exists(CLASSES . $class . '.php')) {
        require CLASSES . $class . '.php';
    } else {
        require CLASSES . $class . '.php';
    }
}
spl_autoload_register('autoload');

Session::init();
$loader = new Twig_Loader_Filesystem(array(PAGES, TEMPLATES));
$twig = new Twig_Environment($loader, [
    'debug' => true,
]);
$twig->addExtension(new Twig_Extension_Debug());

$twig->addFunction(new \Twig_SimpleFunction('asset', function ($asset) {

    return sprintf('/assets/%s', ltrim($asset, '/'));
}));
