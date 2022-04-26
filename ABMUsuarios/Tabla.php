<?php
session_start();

if ($_SESSION == null || $_SESSION == '') {
		echo '<script type="text/javascript">
				window.location="/StreetParking/Sesion/IniciaS.php";
				alert("No tienes autorización para acceder a esta página, ya que no has iniciado sesión...");
			 </script>';
		die();
}
else if(isset($_SESSION['usuario'])){

include '../conexion.php';

$SUser='SELECT CUIT,nombres,apellido,FechaDeNacimiento,correo,Sexo,CodigoPostal,Localidad,Calle,altura,SaldoEnCuenta,rol FROM ussxubcestrol WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$QryUser=mysqli_query($conexion,$SUser) or die ('Usuario sin datos<br>'.mysqli_error($conexion));
$DatosUser=mysqli_fetch_assoc($QryUser);

	$SUser2='SELECT id_usuario,CUIT,nombres,apellido,FechaDeNacimiento,correo,Sexo,CodigoPostal,Localidad,Calle,altura,SaldoEnCuenta,EstadoDeLaCuenta,rol FROM ussxubcestrol';
	$QryUser2=mysqli_query($conexion,$SUser2) or die ('Usuario sin datos<br>'.mysqli_error($conexion));
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Street Parking</title>
	<link rel="stylesheet" type="text/css" href="../css/submenus.css">
	<STYLE>A {text-decoration: none;} </STYLE>
</head>
<body>
	<header>

<div style="font-size: 30px; color: white; padding: 10px; font-family: 'Open sans';">
	<b>
			<?php echo $DatosUser['apellido'].' '.$DatosUser['nombres']; ?>
	   <br>Rol: <?php echo $DatosUser['rol']; ?>
	</b>
</div>

<div style="text-align-last: center; font-size: 25px;">

<a href="index.php"><img class="LogoSP" src="../Imagenes/1.png" alt="Street Parking Logo"></a>

		<nav class="navegacion">
			<ul class="menu">
		<?php if ($_SESSION['usuario']['id_rol']==1){ ?>

				<li><a href="../Sesion/Perfil.php">Perfil</a></li><!-- /////////-->

				<li><a href="Tabla.php">ABM Usuarios</a></li>
				<li><a href="">ABM Zonas</a></li>
				<li><a href="">ABM Precios</a></li>				

				<li><a href="../Sesion/CierraS.php">Cerrar sesión</a></li><!-- /////////-->

		<?php } ?>
			</ul>
		</nav>
<center>

	<div class="Tabla">
		<font size="6">
		<table border="1" cellspacing="0" style="background-color: white; color: black;">
				<tr>
					<b>
					<th>CUIT</th>
					<th>Nombre/s</th>
					<th>Apellido</th>
					<th>Fecha de Nacimiento</th>
					<th>Sexo</th>
					<th>Saldo</th>
					<th>Estado</th>
					<th>Rol</th>

						<th>
							<a href="ABMUsuarios/Crear.php">
								<button div class="boton1" style="font-size: 45px;">Crear</button>
							</a>
						</th>
					</b>
				</tr>

					<?php while ($filas = $QryUser2->fetch_assoc()) { ?>
							<tr align="center">
									<td><b><?php echo $filas['CUIT'];   	 		?></b></td>
									<td><b><?php echo $filas['nombres'];   		    ?></b></td>
									<td><b><?php echo $filas['apellido']; 	 		?></b></td>
									<td><b><?php echo $filas['FechaDeNacimiento'];  ?></b></td>
									<td><b><?php echo $filas['Sexo'];   			?></b></td>
									<td><b><?php echo $filas['SaldoEnCuenta'];   	?></b></td>
									<td><b><?php echo $filas['EstadoDeLaCuenta'];   ?></b></td>
									<td><b><?php echo $filas['rol'];   				?></b></td>
								<td>
		 					    	<form method="POST" action="ABMUsuarios/Editar.php">
		 					    		<input type="hidden" name="id_usuarioE" value="<?php echo $filas['id_usuario']; ?>">
		 					    		<input type="submit" name="Editar" id="Editar" div class="boton1" style="font-size: 40px;" value="Editar" div class="boton1">
		 					    	</form>

		 					    	<form method="POST" action="index.php">
		 					    		<input type="hidden" name="id_usuarioB" value="<?php echo $filas['id_usuario']; ?>">
		 					    		<input type="submit" name="Borrar" id="Borrar" div class="boton1" style="font-size: 40px;" value="Borrar" div class="boton1">
		 					    	</form>
		 					    </td>
							</tr>
					<?php } ?>
		</table>
		</font>
	</div>
</center>
</div>
	</header>
<br><br><br><center><footer><p>Copyright © 2019 Todos los derechos reservados</p></footer></center><br><br><br><br>
</body>
</html>
<?php 	} 	?>