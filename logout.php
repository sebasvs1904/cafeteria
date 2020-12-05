<?php 
    session_start(); //iniciamos con session

    session_unset(); //quitamos la sesión

    session_destroy(); //Destruimos el proceso actual

    header('Location: index.php'); //Redirecciono a la página principal. En mi caso tengo una carpeta en 
                                            //htdocs que se llama ProgWeb2020 y dentro tengo otra que se llama logIn
                                        
?>