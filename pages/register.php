<?php

require_once dirname(__DIR__) . "/pages/views.php";

$user = new User();

if (isset($_POST['action'])) {
    
    exit();
    if ($_POST['action'] === 'REGISTER') {
        $user->RegisterUser($_POST);
        $type = Session::flashType();
        if ($type == 'danger' || $type == 'warning') {
            echo $twig->render('register.twig', array('page' => 'Register', 'message' => Session::flash(), 'type' => $type, 'title' => 'Whoops..!'));
        } else {
            echo $twig->render('login.twig', array('page' => 'Register', 'message' => Session::flash(), 'type' => $type, 'title' => 'Whoops..!'));

        }
    }

} else {
    echo $twig->render('register.twig', array('page' => 'Register'));
}
