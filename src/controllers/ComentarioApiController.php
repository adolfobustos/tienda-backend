<?php

require_once('./src/models/ComentarioModel.php');
require_once('./src/views/ApiView.php');

class ComentarioApiController {
  
    private $model;
    private $view;
  
  
  public function __construct() {
    $this->model = new ComentarioModel();
    $this->view = new ApiView();
  }

  public function getComentario($params = null) {
   
    $id_comentario = $params[':ID'];
    $comentario =  $this->model->getComentario($id_comentario);
  
    if($comentario){
      return  $this->view->response( $comentario, 200);
    }
    else{
      return  $this->view->response("El comentario con el id={$id_comentario} no existe.", 404);
    }
   }  

   public function agregarComentario($params = null) {
   
    $body = $this->getBody();
    //validaciones, verificar si me mandaron info
    if(!empty($body->id_user) && !empty($body->id_producto) && !empty($body->descripcion)  && !empty($body->fecha) &&  !empty($body->valoracion)){
       $id = $this->model->agregarComentarioBD($body->id_user, $body->id_producto, $body->descripcion, $body->fecha, $body->valoracion);
        if($id != 0){
          $body->id = $id;
          $this->view->response($body, 200);
        }else{
          $this->view->response("Ocurrio un error al agregar el comentario", 500);
        }
    }else{ // si no existe la informacion el codigo es 400
      $this->view->response("Hay un error en tu solicitud", 400);
    }
     
   }

   private function getBody(){
     // devuelve el body del request 
     //paso el string recibido a un objeto php (json) para enviarlo
     $bodystring = file_get_contents("php://input"); 
     return json_decode($bodystring);
   }

  public function getComentariosPorProducto($params = null) {
   
    $id_producto = $params[':ID'];

    $comentarios = $this->model->getComentariosPorProductosBD($id_producto);
    if ($comentarios) {
      $this->view->response($comentarios, 200);
    } else {
      $this->view->response("No existen los comentarios con el id={$id_producto}", 404);
    }
  }

 function  deleteComentario($params = null){
  $id_comentario = $params[':ID'];
  $comentario =  $this->model->getComentario($id_comentario);

  if($comentario){
    $this->model->deleteComentarioBD($id_comentario);
    return  $this->view->response("El comentario con el id={$id_comentario} fue borrado.", 200);
  }
  else{
    return  $this->view->response("El comentario con el id={$id_comentario} no existe.", 404);
  }
 }

}