<?php

class AuthHelper{

    function __construct(){
    }

    function checkLogguedIn(){
        session_start();
        if(!isset($_SESSION['user_id'])){
            header("Location: " . BASE_URL . "login");
            die();
        }
    }

    function logout(){
        session_start();
        session_destroy();
    }

    // Admin
    function admin(){
        session_start();
        if(!isset($_SESSION['user_rol'])){
            header("Location: " . BASE_URL . "login");
            return false;
        } else {
            if($_SESSION['user_rol'] != 1){
                header("Location: " . BASE_URL . "login");
                return false;
            }
        }
        return true;
    }
}
