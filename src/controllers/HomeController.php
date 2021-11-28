<?php

require_once "./src/models/UserModel.php";
require_once "./src/views/HomeView.php";

class HomeController {

    private $model;
    private $view;

	function __construct(){
        $this->model = new UserModel();
        $this->view = new HomeView();
    }

    public function home() {
        session_start();
        $user = null;
        if (isset($_SESSION['user_id'])) {
          $user =  $this->model->getUsers($_SESSION['user_id']);
        }
        $this->view->DisplayHome($user);
    }
}
