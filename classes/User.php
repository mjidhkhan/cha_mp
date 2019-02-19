<?php

class User extends Model
{
    private $result;
    private $sql;

    public function __construct()
    {
        parent::__construct();
    }

    public function Index($id)
    {
        if (isset($_POST['email']) || isset($_POST['password'])) {
            return $this->UserLogin();
        } else {
            return;
        }
    }

    public function getAllUsers()
    {
        $this->sql = $this->db->prepare('SELECT * FROM users');
        $this->sql->execute();
        $count = $this->sql->rowCount();
        if ($count > 0) {
            $this->result = $this->sql->fetchAll();
        }

        return $this->result;
    }

    public function LoginUser($data)
    {

        $email = htmlentities($data['email']);
        $password = htmlentities($data['password']);
        $hashed_password = sha1($password);
        if ($email && $password) {
            $this->sql = $this->db->prepare('SELECT * FROM users WHERE email=:email
            AND hashed_password = :hashed_password');
            $this->sql->execute(array(':email' => $email, ':hashed_password' => $hashed_password));
            $count = $this->sql->rowCount();
            if ($count > 0) { // data found
                while ($row = $this->sql->fetch()) {

                    Session::set('user', $row['id']);
                    Session::set('status', $row['status']);
                    Session::set('username', $row['username']);
                    Session::set('fullname', $row['fullname']);
                    if ($row['status'] == 1) { // member of staff admin redirect to admin area
                        Session::set('admin', $row['email']);
                        $this->result = 'pages/admin/index.php';
                    } elseif ($row['status'] == 2) { // customer redirect to customer area
                        Session::set('customer', $row['email']);
                        $this->result = '/client/index.php';
                    }
                } // end while
            } else { // data not found
                $message = 'Username/password combination incorrect.<br />
                            Please make sure your caps lock key is off and try again.';
                Session::setFlash($message, 'danger');
                //$this->result = '/pages/login.php';
            }
        } else {
            $message = 'Please fill in all fields.';
            Session::setFlash($message, 'danger');
        }

        return $this->result;
    }

    public function RegisterUser($data)
    {
        $username = trim($data['username']);
        $fullname = trim($data['fullname']);
        $password = trim($data['password']);
        $repeatpassword = trim($data['repeatpassword']);
        $email = trim($data['email']);
      
        if ($data['admin']) {
            $status = 1;
        } else {
            $status = 2;
        }
        if ($username && $fullname && $password && $repeatpassword && $email) {
            if ($password == $repeatpassword) {
                $hashed_password = sha1($password);

                if ($this->UsernameLengthIsOK($username) &&
                    $this->PasswordLengthIsOK($password) &&
                    $this->UsernameIsOK($username)) {
                    $this->CreateNewUser($username, $hashed_password, $email, $status);
                }
            } else {
                $message = 'Password donot match';
                Session::setFlash($message, 'danger');
            }
        } else {
            $message = 'Please fill in all fields.';
            Session::setFlash($message . 'danger');
        }
    }

    private function UsernameLengthIsOK($username)
    {
        $this->result = true;
        if (!strlen($username) > 30) {
            $message = 'Full name or username must be less then 30 characters';
            Session::setFlash($message, 'danger');
            $this->result = false;
        }

        return $this->result;
    }

    private function PasswordLengthIsOK($password)
    {
        $this->result = true;
        if (strlen($password) > 25 || strlen($password) < 6) {
            $message = 'Password must be between 6 to 25 characters';
            Session::setFlash($message, 'danger');
            $this->result = false;
        }

        return $this->result;
    }

    private function UsernameIsOK($username)
    {
        $this->result = true;
        $this->sql = $this->db->prepare('SELECT * FROM users WHERE username=:username');
        $this->sql->execute(array(':username' => $username));
        $count = $this->sql->rowCount();
        if ($count > 0) {
            $this->result = false;
            $message = "The user with Name: $username already exist.";
            Session::setFlash($message, 'danger');
        }

        return $this->result;
    }

    private function CreateNewUser()
    {
        Session::setFlash('creating user', 'success');
    }
}
