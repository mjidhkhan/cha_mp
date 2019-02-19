<?php

require_once dirname(dirname(__DIR__)) . "/views.php";

$product = new Products();
if (TYPE == 'v') {
    echo $twig->render('starters.twig', array('products' => $product->getAllVegetarianMains(ID), 'page' => 'Vegetarian Main Courses', 'path' => IMAGES));
}
