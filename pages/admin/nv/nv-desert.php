<?php
require_once "../config/config.php";
require '../vendor/Autoload.php';
$product = new Products();

//<pre>{{ dump(user) }}</pre>
Session::init();
// Template rendering.
$loader = new Twig_Loader_Filesystem(array('../layouts/'));
//var_dump($loader);
$twig = new Twig_Environment($loader, [
    'debug' => true,
]);
$twig->addExtension(new Twig_Extension_Debug());
$product = new Products();
echo $twig->render('starters.twig', array('products' => $product->getAllStarters()));
