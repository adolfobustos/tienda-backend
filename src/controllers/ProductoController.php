<?php

require_once "./src/models/ProductoModel.php";
require_once "./src/views/ProductoView.php";
require_once "./Helpers/AuthHelper.php";

class ProductoController {

    private $model;
    private $view;
    private $categorias;
    private $authhelper;
    private $IdAdmin = 1;

	function __construct(){
        $this->model = new ProductoModel();
        $this->view = new ProductoView();
        $this->categorias = $this->model->getCategorias();  
        $this->authhelper = new AuthHelper();
    }

    function isAdmin(){
        $isAdmin = false;
        if(isset($_SESSION['user_rol'])){
            $isAdmin = $_SESSION['user_rol'] == $this->IdAdmin;
        }
        return $isAdmin;
    }
    
    function cart(){
        session_start();
        $productos = $this->model->getProducts();
        $this->view->DisplayProductos($productos,  $this->categorias, isset($_SESSION['user_id']),$this->isAdmin());
    }
    
    function product($id){
        session_start();
        $producto = $this->model->getProduct($id);
        $user = 0;
        if (isset($_SESSION['user_id']))
            $user = $_SESSION['user_id'];

        $this->view->ShowProducto($producto, isset($_SESSION['user_id']), $user, $this->isAdmin());
    }

    function filtroCategorias($id_categoria){
        session_start();
        $producto_filtrado = $this->model->getProductosConCategoria($id_categoria);
        $this->view->DisplayProductos($producto_filtrado, $this->categorias, isset($_SESSION['user_id']), $this->isAdmin());
    }

    // PRODUCTOS EDIT, DELETE, ADD, GUARDAR
    function editProducto($id){
        $this->authhelper->checkLogguedIn();
        $producto = $this->model->getProductToEdit($id);
        $this->view->ShowEditProducto($producto, $this->categorias, $this->isAdmin());
    }

    function deleteProducto($id){
        $this->authhelper->checkLogguedIn();
        $this->model->deleteProductoBD($id);
        $this->view->showCartLocation();
    }

    function addProducto(){
        if(!empty($_POST['nombre']) && !empty($_POST['id_categoria']) && !empty($_POST['precio'])  && !empty($_FILES['img']))
        if ($_FILES['img']['type'] == "image/jpg" || $_FILES['img']['type'] == "image/jpeg" || $_FILES['img']['type'] == "image/png")
        $this->model->addProductoBD($_POST['nombre'], $_POST['id_categoria'], $_POST['precio'], $_FILES['img']['tmp_name']);
        $this->view->showCartLocation();
    }

    function guardarProducto($id){
        if(!empty($_POST['nombre']) && !empty($_POST['id_categoria']) && !empty($_POST['precio'])  && !empty($_FILES['img']))
        if ($_FILES['img']['type'] == "image/jpg" || $_FILES['img']['type'] == "image/jpeg" || $_FILES['img']['type'] == "image/png")
        $this->model->editProductoBD($_POST['nombre'], $_POST['id_categoria'], $_POST['precio'], $_FILES['img']['tmp_name'], $id);
        $this->view->showCartLocation();
    }
}
