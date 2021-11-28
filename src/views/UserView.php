<?php

require_once 'libs/smarty-3.1.39/libs/Smarty.class.php';

class UserView{

    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function DisplayUsers($users){
        $this->smarty->assign('users', $users);
        $this->smarty->display('templates/admin.tpl');
    }

    function ShowEditUser($user){
        $this->smarty->assign('user', $user);
        $this->smarty->display('templates/editUser.tpl');
    }

    function showAdminLocation(){
        header("Location: " . BASE_URL . "admin");
    }
}
