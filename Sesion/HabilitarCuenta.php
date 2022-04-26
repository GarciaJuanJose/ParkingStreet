<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title>Habilitar cuenta - Street Parking</title>
		<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	</head>
<body>
<font style="font-size: 25px;">
	<form action="HabilitarCuenta.php" method="post" enctype="application/x-www-form-urlencoded">
		<p>Para volver a habilitar su cuenta deberá ingresar su correo electrónico: <br><br>
			<input type="email" name="Correo" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Ingrese su correo electrónico" maxlength="80" size=50 style="font-size: 25px;" required autofocus>
		</p>
		Se enviará un mensaje a su bandeja de entrada, con el cual podra recuperar su cuenta.
		<input type="submit" name="EnviarCorreo" id="EnviarCorreo" style="font-size: 25px;" value="Enviar">
	</form>
			<br><a href="../index.html"><button style="font-size: 25px;">Regresar al menu principal</button></a>
</font>
</body>
</html>

<?php 
if (isset($_POST['EnviarCorreo'])) {
	include '../conexion.php'; $Correo=$_POST['Correo'];
// $CorreoEncriptado=password_hash($_POST['Correo'], PASSWORD_DEFAULT);
// if(password_verify($upass, $userRow['user_pass'])){ //code for redirecting to login screen }

$SComp='SELECT correo FROM usuarios WHERE correo = "'.$Correo.'"';
$QryComp=mysqli_query($conexion,$SComp) or die ('El correo ingresado no es valido.<br>'.mysqli_error($conexion));

	if ($QryComp->num_rows>0){ 
		include '../Mailer/CorreoDeHabilitarCuenta.php'; EnviarCorreo($Correo);
	}else{ 
		echo '<h2 style="font-size: 25px; color: red;">* El correo ingresado no es un correo valido.</h2>';
	}
}
?>