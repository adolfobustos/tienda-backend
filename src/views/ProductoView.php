<?php

require_once 'libs/smarty-3.1.39/libs/Smarty.class.php';

class ProductoView {

    private $smarty;
    
    function __construct(){
        $this->smarty = new Smarty();
    }

    function DisplayProductos($productos, $categorias, $logged, $isAdmin) {
        $this->smarty->assign('logged', $logged);
        $this->smarty->assign('isAdmin', $isAdmin);
        $this->smarty->assign('productos', $productos);
        $this->smarty->assign('categorias', $categorias);
        $this->smarty->display('templates/cart.tpl');
    }

    function ShowProducto($producto, $logged, $user, $isAdmin) {
        $this->smarty->assign('logged', $logged);
        $this->smarty->assign('user', $user);
        $this->smarty->assign('isAdmin', $isAdmin);
        $this->smarty->assign('producto', $producto);
        $this->smarty->display('templates/products.tpl');
    }

    // SHOW EditProducto
    function ShowEditProducto($producto, $categorias, $isAdmin) {
        $this->smarty->assign('producto', $producto);
        $this->smarty->assign('categorias', $categorias);
        $this->smarty->assign('isAdmin', $isAdmin);
        $this->smarty->display('templates/editProducto.tpl');
    }

    function showHomeLocation(){
        header("Location: ".BASE_URL."home");
    }

    function showCartLocation(){
        header("Location: ".BASE_URL."cart");
    }
   
    function showError($msg) {
        echo $msg;
    }
}
