<?php

require_once dirname(dirname(__DIR__)) . "/views.php";

//<pre>{{ dump(user) }}</pre>

$product = new Products();
if (TYPE == 'nv' && ID != '') {
    if(DETAILS){
        echo $twig->render('starters.twig', array('products' => $product->getAllNonVegetarianStarters(ID), 'page' => 'Non Vegetarian Starter Details', 'path' => IMAGES));
    }elseif(NUTURITION){
        echo $twig->render('nutrition.twig', array('products' => $product->getAllNonVegetarianStarters(ID), 'page' => 'Non Vegetarian Starter Nutrition', 'path' => IMAGES));
    }elseif(RECEPIE){
        echo $twig->render('recepie.twig', array('products' => $product->getAllNonVegetarianStarters(ID), 'page' => 'Non Vegetarian Starter Recepie', 'path' => IMAGES));
    }else{
        echo $twig->render('starters.twig', array('products' => $product->getAllNonVegetarianStarters(ID), 'page' => 'Non Vegetarian Starter Others', 'path' => IMAGES));
    }
    
} else {
    echo $twig->render('starters.twig', array('products' => $product->getAllNonVegetarianStarters(ID), 'page' => 'Non Vegetarian Starter', 'path' => IMAGES));
}
