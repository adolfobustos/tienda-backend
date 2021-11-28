<?php

class UserModel {
    
    private $db;

    function __construct(){
        try {
            $this->db = new PDO('mysql:host=localhost;'.'dbname=php_database;charset=utf8', 'root', '');
        } catch (PDOException $e) {
            die('Connection Failed: ' . $e->getMessage());
        }
    }

    public function getUsers($userId){
        $records =  $this->db->prepare('SELECT id, user, password FROM users WHERE id = :id');
        $records->bindParam(':id', $userId);
        $records->execute();
        $results = $records->fetch(PDO::FETCH_ASSOC);
        $user = null;
        if (count($results) > 0) {
            $user = $results;
        }
        return $user;
    }

    public function verifyUser($user){
        $records = $this->db->prepare('SELECT id, user, password, rol FROM users WHERE user = :user');
        $records->bindParam(':user', $user);
        $records->execute();
        $results = $records->fetch(PDO::FETCH_ASSOC);
        return $results;
    }
    
    function signupBD($user, $password){
        $records = $this->db->prepare("INSERT INTO users (user, password) VALUES (:user, :password)");
        $records->bindParam(':user', $user);
        $records->bindParam(':password', $password);
        return $records->execute();
    }

    // ADMIN
    function getUsersRol(){
        $sentencia = $this->db->prepare('SELECT id, user, rol FROM users');
        $sentencia->execute();
        $users = $sentencia->fetchAll(PDO::FETCH_ASSOC);
        return $users;
    }

    function getUserToEdit($id){
        $sentencia = $this->db->prepare('SELECT id, user, rol FROM `users` WHERE id=?');
        $sentencia->execute(array($id));
        $user = $sentencia->fetch(PDO::FETCH_OBJ);
        return $user;
    }

    function editUserBD($rol, $id){
        $sentencia = $this->db->prepare("UPDATE users set rol = ? WHERE id=?");
        $sentencia->execute(array($rol, $id));
    }

    function deleteUserBD($id){
        $sentencia = $this->db->prepare("DELETE FROM users WHERE id=?");
        $sentencia->execute(array($id));
    }
}
