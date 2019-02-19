<?php

require_once dirname(dirname(__DIR__)) . "/views.php";

//<pre>{{ dump(user) }}</pre>

$product = new Products();
if (TYPE == 'v') {
    echo $twig->render('starters.twig', array('products' => $product->getAllVegetarianStarters(ID), 'page' => 'Vegetarian Starter', 'path' => IMAGES));
}
