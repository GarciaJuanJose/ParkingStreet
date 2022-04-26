<?php 
$conexion=mysqli_connect('localhost','root','','streetparking') or die('No se pudo conectar a la base de datos'.msqli_error($conexion));
$conexion -> set_charset("utf8");
?>