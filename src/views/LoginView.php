<?php

require_once 'libs/smarty-3.1.39/libs/Smarty.class.php';

class LoginView {

  private $smarty;

  function __construct() {
    $this->smarty = new Smarty();
  }

  public function displayLogin($user = null, $message = '') {
    $this->smarty->display('templates/head.tpl');
    require 'templates/message.php';
    $this->smarty->display('templates/login.tpl');
    $this->smarty->display('templates/footer.tpl');
  }

  public function displaySignup($message = '') {
    $this->smarty->display('templates/head.tpl');
    require 'templates/message.php';
    $this->smarty->display('templates/signup.tpl');
    $this->smarty->display('templates/footer.tpl');
  }
}
