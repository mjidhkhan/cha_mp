<?php

class Database extends PDO
{

    /**
     * @var string  array
     * @description store setting in array
     */
    private $_settings;

    /**
     *
     * @var string
     */
    private $_dsn;

    public function __construct()
    {
        $this->ReadSettings();
        $options = array(
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ);
        parent::__construct($this->_dsn, $this->_settings['DATABASE_USER'], $this->_settings['DATABASE_PASS']);

    }
/**
 * @DESCRIPTION Database Setting to read from connection.ini file
 */
    private function ReadSettings()
    {
        $this->_settings = parse_ini_file(DB . "/connection.ini");
        $this->_dsn = $this->_settings['DATABASE_TYPE'] . ':dbname=' . $this->_settings['DATABASE_NAME'] . ';host=' . $this->_settings['DATABASE_HOST'] . '';
    }

}
