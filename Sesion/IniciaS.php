<!-- /////////////////////////////////////////// CODIGO (EDITAR CON CUIDADO) ///////////////////////////////////////////////////////// -->
<?php
if ( isset($_POST['sesion']) ){
	include('../conexion.php');
	$usuario=mysqli_real_escape_string($conexion, $_POST['usuario']);
	$contraseña=mysqli_real_escape_string($conexion, $_POST['contraseña']);
	$ok=0;
			$UsuPassVacio=0; $UsuVacio=0; $PassVacio=0; $UsPsInc=0; $CuentInhab=0; $UsNoReg=0; $CuentNoVal=0;
	if(empty($usuario)&&empty($contraseña)){ $UsuPassVacio=1; $ok=1;
		}elseif(empty($usuario)){ $UsuVacio=1; $ok=1;
		}elseif(empty($contraseña)){ $PassVacio=1; $ok=1;
	}

if ($ok==0) {
$comprobacion_del_nombre='SELECT * FROM usuarios u JOIN usuarios_estado ue ON u.id_EstadoDeLaCuenta = ue.id_EstadoDeLaCuenta WHERE correo="'.$usuario.'"';
$comprobacion=$conexion->query($comprobacion_del_nombre);

		if ($comprobacion->num_rows>0){
			$consulta_a_la_base=mysqli_query($conexion, 'SELECT * FROM usuarios u JOIN usuarios_estado ue ON u.id_EstadoDeLaCuenta = ue.id_EstadoDeLaCuenta WHERE correo="'.$usuario.'"');
			$recoger_dato=mysqli_fetch_assoc($consulta_a_la_base);
			$comprobar_contraseña=password_verify($contraseña,$recoger_dato['contrasena']);

				if ($comprobar_contraseña) {
					if ( ($recoger_dato['EstadoDeLaCuenta']=='Inactiva') || ($recoger_dato['EstadoDeLaCuenta']=='inactiva') ){
						$CuentNoVal=1;
					}else if (($recoger_dato['EstadoDeLaCuenta']=='Inhabilitada') || ($recoger_dato['EstadoDeLaCuenta']=='inhabilitada')){
			   			$CuentInhab=1;
					}else if ( ($recoger_dato['EstadoDeLaCuenta']=='Activa') || ($recoger_dato['EstadoDeLaCuenta']=='activa') ) {
			   			session_start();
			   			$_SESSION['usuario'] = $recoger_dato;
						header('location: ../index.php');
					}
				}
				else{ $UsPsInc=1; }
		}else{ $UsNoReg=1; }
}//Fin ok==0
}
?>
<!-- /////////////////////////////////////////// CODIGO (EDITAR CON CUIDADO) ///////////////////////////////////////////////////////// -->


<!-- ////////////////////////////////////////////// SECTOR EDITABLE //////////////////////////////////////////////////////////// -->
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title>Iniciar sesión - Street Parking</title>
		<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
		<link rel="stylesheet" type="text/css" href="../css/submenus.css">
	</head>
<body>
	
<center>
<form action="IniciaS.php" method="post" enctype="application/x-www-form-urlencoded">

	<br><br><br><br>

	<label style="font-size: 30px; color: white; font-family: 'Open sans';"><b>Usuario (Correo) &rarr;</b></label>
		<input type="email" name="usuario" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" placeholder="Ingrese su correo electrónico" maxlength="100" style="WIDTH: 500px; HEIGHT: 35px; font-size: 25px; text-align: center;" size=50 autofocus> <br>

	<br><br>

	<label style="font-size: 30px; color: white; font-family: 'Open sans';"><b>Contraseña &rarr;</b></label>
		<input type="password" name="contraseña" pattern="[A-Za-z0-9_-]{1,50}" placeholder="Ingrese su contraseña" maxlength="100" style="WIDTH: 500px; HEIGHT: 35px; font-size: 25px; text-align: center;" size=50>

<!-- /////////////////////////// Mensajes de error /////////////////////////// -->
<?php
	if ( isset($_POST['sesion']) ){
		if ($UsuPassVacio==1) {	echo '<br><br><label style="color: red; font-size: 28px;"><b>Ingrese sus datos !</b></label>'; }
		elseif ($UsuVacio==1) { echo '<br><br><label style="color: red; font-size: 28px;"><b>Ingrese su correo !</b></label>'; }
		elseif ($PassVacio==1) { echo '<br><br><label style="color: red; font-size: 28px;"><b>Ingrese su contraseña !</b></label>'; }
		elseif ($UsPsInc==1) { 
			echo '<br><br><label style="color: red; font-size: 28px;"><b>Usuario o contraseña incorrecto !</b></label>';
		}elseif ($CuentInhab==1) {
			echo '<br><br><label style="color: red; font-size: 28px;"><b>Su cuenta se encuentra inhabilitada.</b></label><br><br><a href="HabilitarCuenta.php"><button style="color: black; font-size: 28px;">¿Desea volver a habilitarla?</button></a>';
		}elseif ($UsNoReg==1) { echo '<br><br><label style="color: red; font-size: 28px;"><b>El usuario no se encuntra registrado o esta mal escrito.<br>Verifique que el usuario y/o contraseña esten bien escritos.</b></label>';
		}elseif ($CuentNoVal==1) {
			echo '<br><br><label style="color: red; font-size: 28px;"><b>Su cuenta aún no ha sido validada.<br>Por favor ingrese a su correo electrónico y valide su cuenta para comenzar a utilizarla.</b></label>';
		}
	}
?>
<!-- /////////////////////////// Mensajes de error /////////////////////////// -->

	<br><br>

	<input type="submit" name="sesion" id="sesion" value="Iniciar sesión" style="font-size: 25px;">

</form>
		<br><br><br>
		<font size="4"><p><b style="font-size: 28px; color: white;">¿Aún no tienes una cuenta?</b></p></font>
</center>
			<center>
			<a href="../Registro/Registrarse.php"><button style="font-size: 25px;">Registrate</button></a><br><br><br><br><br><br><br>
			<a href="../index.html"><button style="font-size: 25px;">Regresar al menu principal</button></a>
			</center>
</body>
</html>
<!-- ////////////////////////////////////////////// SECTOR EDITABLE //////////////////////////////////////////////////////////// -->