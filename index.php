<?php

require_once "config/config.php";
$f = explode('.', $_SERVER['REQUEST_URI']);
if ($f[0] == '/') {
    $function[0] = '';
    $function[1] = 'index';
} else {
    $function = explode('/', $f[0]);

}

//<pre>{{ dump(path~products[1].image) }}</pre>
//print_r($function);

$product = new Products();

echo $twig->render('index.twig', array('products' => $product->getAllMeals(), 'page'=>'Our Meals', 'path' => IMAGES));
