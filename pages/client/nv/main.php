<?php

require_once dirname(dirname(__DIR__)) . "/views.php";

//<pre>{{ dump(user) }}</pre>

$product = new Products();
if (TYPE == 'nv') {
    echo $twig->render('starters.twig', array('products' => $product->getAllNonVegetarianMains(ID), 'page' => 'Non Vegetarian Main Courses', 'path' => IMAGES));
} else {
    echo $twig->render('starters.twig', array('products' => $product->getAllNonVegetarianMains(ID), 'page' => 'Non Vegetarian Main Courses', 'path' => IMAGES));
}
