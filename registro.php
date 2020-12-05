<?php 
    require 'modelo/AccesoDatos.php';

    $message = '';

    if(!empty($_POST['email']) && !empty($_POST['password'])) { /*Password se refiere a la contraseña que el usuario pone en la página, y contraseña se refiere a la credencial ya guardada en la base de datos (el campo en la bd se llama contraseña)*/
        $sql = "INSERT INTO administrador (email, password1) VALUES (:email, :password)"; 
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':email', $_POST['email']);
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
        $stmt->bindParam(':password', $password);
    
        if ($stmt->execute()) {
          $message = 'Usuario creado satisfactoriamente';
        } else {
          $message = '!Exceso de Caféina: Ocurrió un error, verifica tus datos¡';
        }
      }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets\css\styles.css">
    <link rel="stylesheet" href="assets\css\fontello.css">
    <link rel="stylesheet" href="assets\css\estilos.css">     
</head>
<body>
    <?php// require 'modelo/header.php'?> 
<!-- La siguiente instrucción mandará un mensaje el cual se concatena de la linea 14 o 16, segun sea el caso!-->
    <?php if(!empty($message)): ?>
      <p><?= $message ?></p>
    <?php endif; ?>

    <h1>Registro</h1>
    <span>O <a href="login.php">Ingresa a tu cuenta</a></span>
    
    <form action="registro.php" method="POST">
        <input type="text" name="email" placeholder="Ingresa tu email"> 
        <input type="password" name="password" placeholder="Ingresa tu contraseña">
        <input type="password" name="confirm_password" placeholder="Confirma tu contraseña">
        <input type="submit" value="Enviar">
    </form>
</body>
<?php
include_once("COFFE PLACE- Foot.html");
?>
</html>