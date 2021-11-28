<?php

require_once "./src/models/CategoriaModel.php";
require_once "./src/views/CategoriaView.php";
require_once "./Helpers/AuthHelper.php";

class CategoriaController {

    private $model;
    private $view;
    private $authhelper;

    function __construct(){
        $this->model = new CategoriaModel();
        $this->view = new CategoriaView();
        $this->authhelper = new AuthHelper();
    }

    // CATEGORÍAS EDIT, DELETE, ADD, GUARDAR
    function editCategoria($id){
        $this->authhelper->checkLogguedIn();
        $categoria = $this->model->getCategoriaToEdit($id);
        $this->view->ShowEditCategoria($categoria);
    }

    function deleteCategoria($id){
        $this->authhelper->checkLogguedIn();
        $this->model->deleteCategoriaBD($id);
        $this->view->showCartLocation();
    }

    function addCategoria(){
        if(!empty($_POST['nombre']) && !empty($_POST['descripcion']))
        $this->model->addCategoriaBD($_POST['nombre'], $_POST['descripcion']);
        $this->view->showCartLocation();
    }

    function guardarCategoria($id){
        if(!empty($_POST['nombre']) && !empty($_POST['descripcion']))
        $this->model->editCategoriaBD($_POST['nombre'], $_POST['descripcion'], $id);
        $this->view->showCartLocation();
    }
}