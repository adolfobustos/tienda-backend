<?php

require_once 'libs/smarty-3.1.39/libs/Smarty.class.php';

class HomeView {

    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    public function DisplayHome($user) {
        $this->smarty->display('templates/head.tpl');
        require 'templates/bienvenido.php';
        $this->smarty->display('templates/nosotros.tpl');
        $this->smarty->display('templates/footer.tpl');
    }

    public function showError($msg) {
        echo $msg;
    }
}
