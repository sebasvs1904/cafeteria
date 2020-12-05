<?php 

/*CONFIGURACIÓN PARA LA CONEXIÓN A LA BASE DE DATOS */
    $server = 'localhost';
    $username = 'root'; //Usuario que hayas puesto en tu gestor, en mi caso, por defecto.
    $password = ''; //contraseña de que hayas puesto en tu gestor, en mi caso, ninguna.
    $database = 'cafeteria'; //Nombre de la base de datos creada en phpMyAdmin

   
    try{
        $conn = new PDO("mysql:host=$server;dbname=$database;",$username, $password); //Conexión con PDO
    } catch(PDOException $e) {
        die('Falló la conexión con la base de datos '. $e->getMessage());
    }
?>