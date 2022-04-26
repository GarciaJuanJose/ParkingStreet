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

include 'conexion.php';

$SUser='SELECT CUIT,nombres,apellido,FechaDeNacimiento,correo,Sexo,CodigoPostal,Localidad,Calle,altura,SaldoEnCuenta,rol FROM ussxubcestrol WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$QryUser=mysqli_query($conexion,$SUser) or die ('Usuario sin datos<br>'.mysqli_error($conexion));
$DatosUser=mysqli_fetch_assoc($QryUser);

$SUserTarjeta='SELECT * FROM tarjetaview WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$QryUserTarjeta=mysqli_query($conexion,$SUserTarjeta) or die ('Usuario sin tarjetas<br>'.mysqli_error($conexion));

$SUserVehiculo='SELECT * FROM vehiculomtmce WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$QryUserVehiculo=mysqli_query($conexion,$SUserVehiculo) or die ('Usuario sin tarjeta<br>'.mysqli_error($conexion));

/////////////////////////////////// ingresa datos de ubicacion ///////////////////////////////////////
$DatosFaltan=0;		$_SESSION['CompletarUbicacion']=0;

if (($DatosUser['CodigoPostal']=='') || ($DatosUser['Localidad']=='') || ($DatosUser['Calle']=='') || ($DatosUser['altura']==0)){
	$DatosFaltan=1; 	$_SESSION['CompletarUbicacion']=1;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Street Parking</title>
	<link rel="stylesheet" type="text/css" href="css/submenus.css">
	<STYLE>A {text-decoration: none;} </STYLE>
</head>
<body>
	<header>

<div style="font-size: 30px; color: white; padding: 10px; font-family: 'Open sans';">
	<b>
			<?php echo $DatosUser['apellido'].' '.$DatosUser['nombres']; ?>
				<?php if ($_SESSION['usuario']['id_rol']==3){ ?>
			 		<?php for ($i=1; $i <=120 ; $i++) { echo '&nbsp;'; } ?>
			 			<a href="Saldo/cargar_saldo.php">
							<label style="color: lightgreen;">Mi saldo: $ <?php echo $DatosUser['SaldoEnCuenta']; ?> &uarr;</label>
						</a>
				<?php } ?>
						<br>Rol: <?php echo $DatosUser['rol']; ?>
				<?php if ($_SESSION['usuario']['id_rol']==3){ ?>	
					<?php for ($i=1; $i <=112 ; $i++) { echo '&nbsp;'; } ?>
	   <?php if ( ($DatosUser['SaldoEnCuenta']>0) && ($DatosUser['SaldoEnCuenta']<=50) ) { 
	   			echo '<label style="color: red;">Su saldo esta proximó a agotarse</label>'; 
	   		 } 
	   ?> 
				<?php } ?>
	   <br>
	</b>
</div>

<div style="text-align-last: center; font-size: 25px;">

<a href="index.php"><img class="LogoSP" src="Imagenes/1.png" alt="Street Parking Logo"></a>

		<nav class="navegacion">
			<ul class="menu">

		<?php if ($_SESSION['usuario']['id_rol']==3){ ?>

				<li><a href="Sesion/Perfil.php">Perfil</a></li>

				<li><a>Información requerida</a>
					<ul class="submenu">

						<?php if ($DatosFaltan==1) { ?>
							<li>
								<a href="DatosObligatorios/CompletarUbiUsu.php">
									<label style="color: white; font-size: 40px;">&#9823;</label> Datos personales 
									<label style="color: red;">&#10060;</label>
								</a>
							</li>
						<?php }else{ ?>
							<li>
								<a>
									<label style="color: white; font-size: 40px;">&#9823;</label> Datos personales 
									<label style="color: green;">&#10004;</label>
								</a>
							</li>
						<?php } ?>

						<?php if ($QryUserTarjeta->num_rows>0) { ?>
							<li>
								<a href="DatosObligatorios/Completar_tarjeta.php">
									&#128179; Tarjeta de credito <label style="color: green;">&#10004;</label>
								</a>
							</li>
						<?php }else{ ?>
							<li>
								<a href="DatosObligatorios/Completar_tarjeta.php">
									&#128179; Tarjeta de credito <label style="color: red;">&#10060;</label>
								</a>
							</li>
						<?php } ?>

						
						<?php if ($QryUserVehiculo->num_rows>0) { ?>
							<li>
								<a href="DatosObligatorios/vehiculosUsu.php">
									<label style="font-size: 30px;">&#128663;</label> Vehiculos 
									<label style="color: green;">&#10004;</label>
								</a>
							</li>
						<?php }else{ ?>
							<li>
								<a href="DatosObligatorios/vehiculosUsu.php">
									<label style="font-size: 30px;">&#128663;</label> Vehiculos 
									<label style="color: red;">&#10060;</label>
								</a>
							</li>
						<?php } ?>
					</ul>
				</li>

				<li><a href="Saldo/cargar_saldo.php">Cargar saldo</a></li>
				
				<li><a>Estacionar</a>
					<ul class="submenu">
						<li><a href="Estacionamiento/EstacionamientoManual.php">Manual</a></li>
						<li><a href="Estacionamiento/EstacionamientoAutomatico.php">Automatico</a></li>
					</ul>
				</li>

				<li><a>Mi historial</a>
					<ul class="submenu">
						<li><a href="">Recargas</a></li>
						<li><a href="">Movimientos</a></li>
					</ul>
				</li>

				<li><a href="Sesion/CierraS.php">Cerrar sesión</a></li>
		<?php } ?>

		<?php if ($_SESSION['usuario']['id_rol']==1){ ?>

				<li><a href="Sesion/Perfil.php">Perfil</a></li><!-- /////////-->

				<li><a href="ABMUsuarios/Tabla.php">ABM Usuarios</a></li>
				<li><a href="">ABM Precios</a></li>		
				<li><a href="">ABM Zonas</a></li>

				<li><a href="Sesion/CierraS.php">Cerrar sesión</a></li><!-- /////////-->

		<?php } ?>
			</ul>
		</nav>
<center>
		<fieldset style="width: 1200px; color: white; text-align-last: center;">

			<br><br>

			<h3> Requisitos minimos para utilizar el servicio de estacionamiento online: </h3> 

			<br><br>
			
			&#9312; Completar la información requerida los cuales son: <br><br>
							
					<strong style="font-size: 30px;">&#128073;</strong> Datos personales (Obligatorio). <br>
					
					<strong style="font-size: 30px;">&#128073;</strong> Tarjeta de credito (Opcional).<br>
					
					<strong style="font-size: 30px;">&#128073;</strong> Cargar un vehiculo (Minimo 1 vehiculo, obligatorio).<br><br>
			
			&#9313; Debera disponer de saldo en su cuenta (Podra obervar su saldo en la parte superior derecha de la pantalla). 

			<br><br>
			
			&#9314; Metodos para cargar saldo:<br><br>
							
					<strong style="font-size: 30px;">&#128073;</strong> Efectivo: Seleccionar saldo a cargar y acercarse al lugar mas cercano asociado con el sitio y su cupon de pago.<br>
					
					<strong style="font-size: 30px;">&#128073;</strong> Tarjeta de credito: Si dispone de una tarjeta dar <a href="../StreetParking\DatosObligatorios/Completar_tarjeta.php" style="color: red;">Click aqui</a> y registre su tarjeta. Así podra cargar saldo al sitio de forma directa.

					<br><br>
									
		</fieldset>
</center>
</div>
	</header>
<br><br><br><center><footer><p>Copyright © 2019 Todos los derechos reservados</p></footer></center><br><br><br><br>
</body>
</html>

<?php 	} 	?>