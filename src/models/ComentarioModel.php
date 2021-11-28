<?php

class ComentarioModel{

  private $db;

  function __construct(){
    try {
      $this->db = new PDO('mysql:host=localhost;' . 'dbname=php_database;charset=utf8', 'root', '');
    } catch (PDOException $e) {
      die('Connection Failed: ' . $e->getMessage());
    }
  }

  function getComentario($id_comentario){
    $sentencia = $this->db->prepare('SELECT * FROM comentario WHERE id_comentario=?' );
    $sentencia->execute(array($id_comentario));
    $comentarios = $sentencia->fetchAll(PDO::FETCH_ASSOC);
    return $comentarios;
  }


  function getComentariosPorProductosBD($id_producto){
    //hacer consulta con inner join 
    $sentencia = $this->db->prepare( 'SELECT id_comentario,descripcion,fecha,valoracion,users.user  FROM `comentario` INNER JOIN users ON comentario.id_user = users.id WHERE id_producto=?');
    $sentencia->execute(array($id_producto));
    $comentarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
    return $comentarios;
  }

  function deleteComentarioBD($id_comentario){
    $sentencia = $this->db->prepare( 'DELETE FROM comentario WHERE id_comentario=?');
    $sentencia->execute(array($id_comentario));
  }

  function agregarComentarioBD($id_user, $id_producto, $descripcion, $fecha, $valoracion){
    $sentencia = $this->db->prepare("INSERT INTO comentario(id_user, id_producto, descripcion, fecha, valoracion) VALUES(?, ?, ?, ?, ?)");
    $sentencia->execute(array($id_user, $id_producto, $descripcion, $fecha,  $valoracion));
    return $this->db->lastInsertId();
    //trae el id de la ultima consulta.
  }
}