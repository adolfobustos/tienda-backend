<?php

require_once "src/controllers/HomeController.php";
require_once "src/controllers/ProductoController.php";
require_once "src/controllers/LoginController.php";
require_once "src/controllers/CategoriaController.php";
require_once "src/controllers/UserController.php";

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'home';
}

$homeController = new HomeController();
$productController = new ProductoController();
$loginController = new LoginController();
$categoriaController = new CategoriaController();
$userController = new UserController();


$params = explode('/', $action);
switch ($params[0]) {
    case 'home':
        $homeController->home();
        break;
    case 'cart':
        $productController->cart();
        break;
    case 'login':
        $loginController->login();
        break;
    case 'verify':
        $loginController->verifyLogin();
        break;
    case 'logout':
        $loginController->logout();
        break;
    case 'signup':
        $loginController->signup();
        break;
    case 'admin':
        $userController->admin();
        break;
    case 'editUser':
        $userController->editUser($params[1]);
        break;
    case 'guardarUser':
        $userController->guardarUser($params[1]);
        break;
    case 'deleteUser':
        $userController->deleteUser($params[1]);
        break;
    case 'product':
        $productController->product($params[1]);
        break;
    case 'categoria':
        $productController->filtroCategorias($params[1]);
        break;
    case 'editProducto':
        $productController->editProducto($params[1]);
        break;
    case 'guardarProducto':
        $productController->guardarProducto($params[1]);
        break;
    case 'deleteProducto':
        $productController->deleteProducto($params[1]);
        break;
    case 'addProducto':
        $productController->addProducto();
        break;
    case 'editCategoria':
        $categoriaController->editCategoria($params[1]);
        break;
    case 'guardarCategoria':
        $categoriaController->guardarCategoria($params[1]);
        break;
    case 'deleteCategoria':
        $categoriaController->deleteCategoria($params[1]);
        break;
    case 'addCategoria':
        $categoriaController->addCategoria();
        break;
    default:
        echo ('404 Page not found');
        break;
}
