<?php

require_once "./src/models/UserModel.php";
require_once "./src/views/UserView.php";
require_once "./Helpers/AuthHelper.php";

class UserController {

    private $model;
    private $view;
    private $authhelper;

    function __construct() {
        $this->model = new UserModel();
        $this->view = new UserView();
        $this->authhelper = new AuthHelper();
    }

    function admin(){
        if($this->authhelper->admin()){
            $users = $this->model->getUsersRol();
            $this->view->DisplayUsers($users);
        }
    }

    function editUser($id){
        if($this->authhelper->admin()){
            $user = $this->model->getUserToEdit($id);
            $this->view->ShowEditUser($user);
        }
    }

    function guardarUser($id){
        if(!empty($_POST['rol']))
        $this->model->editUserBD($_POST['rol'], $id);
        $this->view->showAdminLocation();
    }

    function deleteUser($id){
        if($this->authhelper->admin()){
            $this->model->deleteUserBD($id);
            $this->view->showAdminLocation();
        }
    }
}
