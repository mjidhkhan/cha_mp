<?php

class Helper
{
    public static function unsetSession()
    {
        session_unset();
    }

    public static function unsetSessionVariable($array)
    {
        foreach ($array as $key => $value) {
            //echo $key. '=>'.$value .'<br>';
            unset($_SESSION[$key]);
        }
    }

    public static function unsetSessionVariables($array)
    {
        foreach ($array as $key => $value) {
            //echo $key. '=>'.$value .'<br>';
            unset($_SESSION[$key]);
            unset($_SESSION[$value]);
        }
    }

    public static function unsetSessionTemplates($array)
    {
        foreach ($array as $key => $value) {
//           echo $key. '=>'.$value .'<br>';
            unset($_SESSION[$value]);
        }
    }

    public static function loggedIn()
    {
        return isset($_SESSION['username']) && ($_SESSION['status']);
    }

    public static function confirmLogIn()
    {
        if (!self::loggedIn()) {
            redirect_to('/pages/login.php');
        }
    }

    public static function logged_index()
    {
        if ($_SESSION = true) {
            return isset($_SESSION['username']);
        }
    }

    public static function redirect_to($location = null)
    {
        if ($location != null) {
            header("Location: {$location}");
            // header('Location: '.$location);
            exit;
        }
    }
}
