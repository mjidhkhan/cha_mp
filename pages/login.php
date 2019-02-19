<?php

require_once dirname(__DIR__) . '/pages/views.php';
$user = new User();

if (isset($_POST['action'])) {
    if ($_POST['action'] === 'LOGIN') {
        $user->LoginUser($_POST);
        $type = Session::flashType();

        if ($type == 'danger' || $type == 'warning') {
            echo $twig->render('login.twig', array('page' => 'Login', 'message' => Session::flash(), 'type' => $type, 'title' => 'Whoops..!'));
        } else {
            $product = new Products();

            echo $twig->render('account.twig', array('products' => $product->getAllMeals(),
                'page' => 'My Account',
                'message' => Session::flash(),
                'type' => Session::flashType(),
                'title' => 'Success..!', 'path' => IMAGES,
                'fullname' => Session::get('fullname')));

        }
    }

} else {
    echo $twig->render('login.twig', array('page' => 'Login'));
}
