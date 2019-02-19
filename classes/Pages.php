<?php
class Pages
{
    public function __construct()
    {

    }

    public function displayHomePage()
    {
        if (Session::loggedIn()) {
            echo "<h3>Welcome,  " . strtoupper($_SESSION['username']) . "</h3>";
        }
        $products = new Products();
        $products = $products->getAllProducts();

        foreach ($products as $key => $value) {
            echo "<h3>" . $value['title'] . "</h3>";
            echo '<p class="contents">' . $value['content'] . '</p> <hr>';

        }

    }
}
