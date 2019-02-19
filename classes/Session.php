<?php

class Session
{
    protected static $flash_message;
    protected static $flash_type;

    public static function init()
    {
        if (session_id() == '') {
            session_start();
        }
    }

    public static function setFlash($message, $type)
    {
        self::$flash_message = $message;
        self::$flash_type = $type;
    }

    public static function hasFlash()
    {
        return !is_null(self::$flash_message);
    }

    public static function flash()
    {
        $message = self::$flash_message;
        self::$flash_message = null;
        return $message;
    }

    public static function hasType()
    {
        return !is_null(self::$flash_type);
    }

    public static function flashType()
    {
        $type = self::$flash_type;
        self::$flash_type = null;
        return $type;
    }

    public static function set($key, $value)
    {
        $_SESSION[$key] = $value;
    }

    public static function get($key)
    {
        if (isset($_SESSION[$key])) {
            return $_SESSION[$key];
        }

        return null;
    }

    public static function delete($key)
    {
        if (isset($_SESSION[$key])) {
            unset($_SESSION[$key]);
        }
    }

    public static function destroy()
    {
        session_destroy();
    }
}
