<?php

class CategoriaModel{

  private $db;

  function __construct(){
    try {
      $this->db = new PDO('mysql:host=localhost;' . 'dbname=php_database;charset=utf8', 'root', '');
    } catch (PDOException $e) {
      die('Connection Failed: ' . $e->getMessage());
    }
  }

  // GET CategoriaToEdit
  function getCategoriaToEdit($id){
    $sentencia = $this->db->prepare('SELECT * FROM `categoria`  WHERE id_categoria=?');
    $sentencia->execute(array($id));
    $categoria = $sentencia->fetch(PDO::FETCH_OBJ);
    return $categoria;
  }

  // CATEGORÍAS EDIT, DELETE, ADD
  function editCategoriaBD($nombre, $descripcion, $id){
    $sentencia = $this->db->prepare("UPDATE categoria set nombre = ?, descripcion = ? WHERE id_categoria=?");
    $sentencia->execute(array($nombre, $descripcion, $id));
  }

  function deleteCategoriaBD($id){
    $sentencia = $this->db->prepare("DELETE FROM categoria WHERE id_categoria=?");
    $sentencia->execute(array($id));
  }

  function addCategoriaBD($nombre, $descripcion){
    $sentencia = $this->db->prepare("INSERT INTO categoria(nombre, descripcion) VALUES(?, ?)");
    $sentencia->execute(array($nombre, $descripcion));
  }
}