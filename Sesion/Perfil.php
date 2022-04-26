<?php
session_start();

if ($_SESSION == null || $_SESSION == '') {
		echo '<script type="text/javascript">
				alert("No tienes autorización para acceder a esta página, ya que no has iniciado sesión...");
				window.location="/StreetParking/Sesion/IniciaS.php";
			 </script>';
		die();
}
else if(isset($_SESSION['usuario'])){

include '../conexion.php';

	@$fecha = date("d-m-Y H:i:s",time());
	$date = new DateTime($fecha, new DateTimeZone('America/Argentina/Buenos_Aires'));
	date_default_timezone_set('America/Argentina/Buenos_Aires');
	$zonahoraria = date_default_timezone_get();
	@$fecha=date("Y-m-d",time());

$SUser='SELECT CUIT,nombres,apellido,FechaDeNacimiento,correo,Sexo,CodigoPostal,Localidad,Calle,altura,rol FROM ussxubcestrol WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$QryUser=mysqli_query($conexion,$SUser) or die ('No se pudo consultar la tabla sexo<br>'.mysqli_error($conexion));
$DatosUser=mysqli_fetch_assoc($QryUser);
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Street Parking</title>
	<link rel="stylesheet" type="text/css" href="../css/submenus2.css">
</head>
<body>
	<header>
		<div style="font-size: 30px; color: white; padding: 10px; font-family: 'Open sans';">
			<b>
			 	 	 <?php echo $DatosUser['apellido'].' '.$DatosUser['nombres']; ?> <br>
   				Rol: <?php echo $DatosUser['rol']; ?>
			</b>
		</div>
		<div style="text-align-last: center; font-size: 25px;">
			<a href="../index.php"><img class="LogoSP" src="../Imagenes/1.png" alt="Street Parking Logo"></a>
				<br><br><br><br><br>
			<nav class="navegacion">
				<ul class="menu">
					<li><a href="../index.php">Regresar al menu pricipal</a>
				</ul>
			</nav>
		</div>
	</header>
</body>

<div style="font-size: 30px; color: white; font-family: 'Open sans'; text-align-last: center;">
	<b>
<?php
	$TimeStamp=strtotime($DatosUser['FechaDeNacimiento']);		$Fecha=date("d-m-Y",$TimeStamp);
?>
<center>
	<table cellspacing="80">
	<tr>
		<td>
			<?php  
				echo 'CUIT &rarr; '.$DatosUser['CUIT'].'<br><br> Correo &rarr; '.$DatosUser['correo'].'<br><br> Genero &rarr; '.$DatosUser['Sexo'].'<br><br> Fecha de nacimiento &rarr; '.$Fecha.'<br><br>';
			?>
		</td>
		
		<td>
			<?php 
				if ($DatosUser['CodigoPostal']!='') { echo 'Codigo postal &rarr; '.$DatosUser['CodigoPostal']; } echo '<br><br>';
				if ($DatosUser['Localidad']!='') { echo 'Localidad &rarr; '.$DatosUser['Localidad']; } echo '<br><br>';
				if ($DatosUser['Calle']!='') { echo 'Calle &rarr; '.$DatosUser['Calle']; } echo '<br><br>';
				if ($DatosUser['altura']!=0) { echo 'Altura &rarr; '.$DatosUser['altura']; }
			?>
		</td>
	</tr>
	</table>
</center>

	</b>
</div>

</body>
</html>

<?php } ?>