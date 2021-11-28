<?php

class ProductoModel {
  
  private $db;

  function __construct(){
    try {
      $this->db = new PDO('mysql:host=localhost;'.'dbname=php_database;charset=utf8', 'root', '');
    } catch (PDOException $e) {
      die('Connection Failed: ' . $e->getMessage());
      }
  }

  // GET
	function getProducts(){
    $sentencia = $this->db->prepare('SELECT * FROM products' );
    $sentencia->execute();
    $productos = $sentencia->fetchAll(PDO::FETCH_ASSOC);
    return $productos;
  }

  function getProduct($id){
    $sentencia = $this->db->prepare( 'SELECT * FROM `products` INNER JOIN categoria ON products.id_categoria = categoria.id_categoria WHERE id=?');
    $sentencia->execute(array($id));
    $producto = $sentencia->fetch(PDO::FETCH_OBJ);
    return $producto;
  }
  
  function getProductToEdit($id){
    $sentencia = $this->db->prepare( 'SELECT * FROM `products`  WHERE id=?');
    $sentencia->execute(array($id));
    $producto = $sentencia->fetch(PDO::FETCH_OBJ);
    return $producto;
  }

  function getProductosConCategoria($id_categoria){
    $sentencia = $this->db->prepare( 'SELECT * FROM products WHERE id_categoria = ?');
    $sentencia->execute(array($id_categoria));
    $productos_filtrados = $sentencia->fetchAll(PDO::FETCH_ASSOC);
    return $productos_filtrados;
  }

  function getCategorias(){
    $sentencia = $this->db->prepare( 'SELECT * FROM categoria');
    $sentencia->execute();
    $categorias = $sentencia->fetchAll(PDO::FETCH_ASSOC);
    return $categorias;
  }

  // PRODUCTOS EDIT, DELETE, ADD
  function editProductoBD($nombre, $id_categoria, $precio, $img = null, $id){
    $pathImg = null;
    if ($img) $pathImg = $this->addImg($img);
    $sentencia = $this->db->prepare("UPDATE products set nombre = ?, id_categoria = ?, precio = ?, img = ? WHERE id=?");
    $sentencia->execute(array($nombre, $id_categoria, $precio, $pathImg, $id));
  }

  function deleteProductoBD($id){
    $sentencia = $this->db->prepare("DELETE FROM products WHERE id=?");
    $sentencia->execute(array($id));
  }

  function addProductoBD($nombre, $id_categoria, $precio, $img = null){
    $pathImg = null;
    if ($img) $pathImg = $this->addImg($img);
    $sentencia = $this->db->prepare("INSERT INTO products(nombre, id_categoria, precio, img) VALUES(?, ?, ?, ?)");
    $sentencia->execute(array($nombre, $id_categoria, $precio, $pathImg));
  }

  function addImg($img){
    $target = 'images/products/' . uniqid() . '.jpg';
    move_uploaded_file($img, $target);
    return $target;
  }
}
