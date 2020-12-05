
<?php

session_start();

if(isset($_SESSION['user_id'])){
    //header('Location: /ProgWeb2020/cafeteriaprog/CafeteriaAuth/'); //Esta instrucción es para cuando el usuario ya ha ingresado a su cuenta
                                            //ya no pueda regresar a la ventana de logIn ya que sería ilógico.
}

require 'modelo/AccesoDatos.php'; 

if (!empty($_POST['email']) && !empty($_POST['password'])) {
    $records = $conn->prepare('SELECT idadmin, email, password1 FROM administrador WHERE email=:email');
    $records->bindParam(':email', $_POST['email']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $message = '';

    if (count($results) > 0 && password_verify($_POST['password'], $results['password1']))  {
        $_SESSION['user_id'] = $results['idadmin'];
        header('Location: /ProgWeb2020/cafeteriaprog/CafeteriaAuth');
    } else {
        $message = '<p style="color: red">!Contraseña Incorrecta!</p> Verifica nuevamente tus credenciales';
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="stylesheet" href="assets/css/fontello.css">
    
</head>

<body>
    <?php //require 'modelo/header.php' ?>
    <h1>¡Te damos la bienvenida a Coffee Place&#174 !</h1>
    <h2>Login</h2>
    <span>O <a href="registro.php">Registrate</a></span>

    <?php if (!empty($message)) : ?>
        <p><?= $message ?></p>
    <?php endif; ?>

    <form action="login.php" method="POST">
        <input type="text" name="email" placeholder="Ingresa tu email">
        <input type="password" name="password" placeholder="Ingresa tu contraseña">
        <input type="submit" value="Enviar">
    </form>
</body>
<?php
include_once("COFFE PLACE- Foot.html");
?>
</html>