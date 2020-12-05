
<?php
include_once("COFFE PLACE-Head.html");
?>
<?php
session_start();

require 'modelo/AccesoDatos.php';

if (isset($_SESSION['user_id'])) {
  $records = $conn->prepare('SELECT idadmin, email, password1 FROM administrador WHERE idadmin=:id');
  $records->bindParam(':id', $_SESSION['user_id']);
  $records->execute();
  $results = $records->fetch(PDO::FETCH_ASSOC);

  $user = null;

  if (count($results) > 0) {
    $user = $results;
  }
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bienvenido a COFFEE PLACE</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="assets\css\styles.css">
  <link rel="stylesheet" href="assets\css\body.css">
</head>

<body>
<?php if (!empty($user)) : ?>
    <br>Bienvenido <p style="color: #834A37;"><?= $user['email'] ?></p>
    Haz ingresado a tu cuenta satisfactoriamente <br>
    <a href="logout.php">Logout</a>
  <?php else : ?>
   <section> <br>
        <h1>Hola mundo</h1> <br>
   </section>
   <?php endif; ?>
</body>
<?php
include_once("COFFE PLACE- Foot.html");
?>
</html>