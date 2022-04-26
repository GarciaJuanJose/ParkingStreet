<?php 
if (isset($_GET['C'])) {
	$CorreoEncriptado=$_GET['C'];
}else{
	$CorreoEncriptado='';
	echo '<script type="text/javascript"> 
				alert("No tienes autorización para acceder a esta página...");
				window.location="../Sesion/IniciaS.php";
		  </script>';
}
?>
<!DOCTYPE html>
<html lang="es">
	<head>
			<meta charset="utf-8"><title>Habilitar cuenta - Street Parking</title>
			<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	</head>
<body>
<?php
	include '../conexion.php';

$SX='SELECT correo FROM usuarios WHERE id_EstadoDeLaCuenta = 3';
$QryX=mysqli_query($conexion,$SX) or die ('No se pudo tomar correo.<br>'.mysqli_error($conexion));

$Correo='';

while ($VecCorreo = $QryX->fetch_assoc()) { 
	if(password_verify($VecCorreo['correo'], $CorreoEncriptado)){ $Correo=$VecCorreo['correo']; }
}

if ($Correo!='') {
	$S='UPDATE usuarios SET id_EstadoDeLaCuenta = 1 WHERE correo = "'.$Correo.'" AND id_EstadoDeLaCuenta = 3';
	$Qry=mysqli_query($conexion,$S) or die ('Su cuenta no se pudo habilitar<br>'.mysqli_error($conexion));
		echo '<h2 style="font-size: 25px; color: green;">Su cuenta se ha habilitado exitosamente!</h2>';
}

?>
</body>
</html>