<?php
require_once 'libs/Router.php';
require_once "src/controllers/ComentarioApiController.php";


define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

// recurso solicitado
$resource = $_GET["resource"];

// método utilizado
$method = $_SERVER["REQUEST_METHOD"];


// crea el router
$router = new Router();

// define la tabla de ruteo
$router->addRoute('comentarios/producto/:ID', 'GET', 'ComentarioApiController', 'getComentariosPorProducto');
$router->addRoute("comentarios/:ID", "GET", "ComentarioApiController", "getComentario");
$router->addRoute("comentarios/:ID", "DELETE", "ComentarioApiController", "deleteComentario");
$router->addRoute("comentarios", "POST", "ComentarioApiController", "agregarComentario");
// rutea
$router->route($resource, $method);


