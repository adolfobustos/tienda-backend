<?php

require_once "./src/models/UserModel.php";
require_once "./src/views/LoginView.php";
require_once "./Helpers/AuthHelper.php";

class LoginController {

    private $model;
    private $view;
    private $authhelper;

    function __construct() {
        $this->model = new UserModel();
        $this->view = new LoginView();
        $this->authhelper = new AuthHelper();
    }

    public function login() {
        $this->view->displayLogin();
    }
    
    function verifyLogin(){
        session_start();
        $user = '';
        $message = '';
        if (isset($_SESSION['user_id'])) {
            header("Location: " . BASE_URL . "home");
        }
        if (!empty($_POST['user']) && !empty($_POST['password'])) {
            $user = $this->model->verifyUser($_POST['user']);
            if (!empty($user) && password_verify($_POST['password'], $user['password'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_rol'] = $user['rol'];
                header("Location: " . BASE_URL . "home");
            } else {
                $message = 'Usuario y/o contraseña incorrectos';
            }
        } else {
            $message = 'Para iniciar sesión se deben completar todos los campos.';
        }
        $this->view->displayLogin($user, $message);
    }

    function logout() {
        $this->authhelper->logout();
        header("Location: ".BASE_URL."home");
    }

    function signup() {
        $message = '';
        if (!empty($_POST['user']) && !empty($_POST['password'])) {
            $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
            $result = $this->model->signupBD($_POST['user'], $password); 
            if ($result) {
                $message = 'Nuevo usuario creado!';
            }
        }
        else {
            $message = 'Para el registro se deben completar todos los campos.';
        }
        $this->view->displaySignup($message);   
    }
}
