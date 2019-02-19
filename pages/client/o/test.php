<?php

require_once dirname(dirname(__DIR__)) . "/views.php";
$test = new Test();
if (TYPE == 'v') {
    echo $twig->render('test.twig', array('products' => $test->Index(ID), 'page' => 'Test', 'path' => IMAGES));
}else{
    echo $twig->render('test.twig', array('products' => $test->Index(ID), 'page' => 'Login', 'path' => IMAGES));
}