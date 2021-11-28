<?php

require_once 'libs/smarty-3.1.39/libs/Smarty.class.php';

class CategoriaView {

    private $smarty;
    
    function __construct(){
        $this->smarty = new Smarty();
    }

    // SHOW EditCategoria
    function ShowEditCategoria($categoria) {
        $this->smarty->assign('categoria', $categoria);
        $this->smarty->display('templates/editCategoria.tpl');
    }

    function showCartLocation(){
        header("Location: ".BASE_URL."cart");
    }
}