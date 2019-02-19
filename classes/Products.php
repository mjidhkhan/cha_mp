<?php
class Products extends Model
{

    private $result;
    private $sql;

    public function __construct()
    {
        parent::__construct();

    }

    public function getAllMeals()
    {
        $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1');
        $this->sql->execute();
        $count = $this->sql->rowCount();
        if ($count > 0) {
            $this->result = $this->sql->fetchAll();
        }
        return $this->result;
    }

    /** Vegetarian Meals Start */
    public function getAllVegetarian()
    {
        $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_cat_id= 1');
        $this->sql->execute();
        $count = $this->sql->rowCount();
        if ($count > 0) {
            $this->result = $this->sql->fetchAll();
        }
        return $this->result;
    }

    public function getAllVegetarianStarters()
    {
        if (ID != '' || ID != null) {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=1 AND m_cat_id= 1 AND id=:ID');
            $this->sql->execute(array(':ID' => ID));
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        } else {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_cat_id= 1 AND m_type_id=1');
            $this->sql->execute();
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        }
        return $this->result;
    }

    public function getAllVegetarianMains()
    {
        if (ID != '' || ID != null) {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=2 AND m_cat_id= 1 AND id=:ID');
            $this->sql->execute(array(':ID' => ID));
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        } else {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` WHERE visible = 1  AND m_cat_id = 1 AND m_type_id = 2');
            $this->sql->execute();
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        }
        return $this->result;
    }

    /** Vegetarian Meals End */


    /** Non Vegetarian Meals Start */
    public function getAllNonVegetarian()
    {
        $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_cat_id= 2');
        $this->sql->execute();
        $count = $this->sql->rowCount();
        if ($count > 0) {
            $this->result = $this->sql->fetchAll();
        }
        return $this->result;
    }

    public function getAllNonVegetarianStarters()
    {
        if (ID != '' || ID != null) {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=1 AND m_cat_id= 2 AND id=:ID');
            $this->sql->execute(array(':ID' => ID));
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        } else {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_cat_id= 2 AND m_type_id=1');
            $this->sql->execute();
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        }
        return $this->result;
    }

    public function getAllNonVegetarianMains()
    {
        if (ID != '' || ID != null) {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=2 AND m_cat_id= 2 AND id=:ID');
            $this->sql->execute(array(':ID' => ID));
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }

        } else {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` WHERE visible = 1  AND m_cat_id = 2 AND m_type_id = 2');
            $this->sql->execute();
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        }
        return $this->result;
    }
    /** Non Vegetarian Meals End */


    public function getAllDeserts()
    {
        if (ID != '' || ID != null) {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=3  AND id=:ID');
            $this->sql->execute(array(':ID' => ID));
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        } else {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=3');
            $this->sql->execute();
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        }
        return $this->result;
    }

    public function getAllRefreshments()
    {
        if (ID != '' || ID != null) {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=4  AND id=:ID');
            $this->sql->execute(array(':ID' => ID));
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        } else {
            $this->sql = $this->db->prepare('SELECT * FROM `contents` Where visible = 1 AND m_type_id=4');
            $this->sql->execute();
            $count = $this->sql->rowCount();
            if ($count > 0) {
                $this->result = $this->sql->fetchAll();
            }
        }
        return $this->result;
    }
}
