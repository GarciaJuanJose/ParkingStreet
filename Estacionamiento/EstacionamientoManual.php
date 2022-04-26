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
	if ($_SESSION['usuario']['id_rol'] == 3) {
		include '../conexion.php';

//// Comprueba tabla vehiculos ////
$CompSelectVehic='SELECT ve.anio, ve.patente, ma.Marca, ti.Tipo, mo.Modelo, co.Color, vh.EstadoVehic FROM vehiculos ve JOIN marca ma ON ve.id_marca = ma.id_marca JOIN tipo ti ON ve.id_tipo = ti.id_tipo JOIN modelo mo ON ve.id_modelo = mo.id_modelo JOIN color co ON ve.id_color = co.id_color JOIN vehic_estado vh ON ve.id_EstadoVehic = vh.id_EstadoVehic WHERE ve.id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$CompQryVehiculos=mysqli_query($conexion,$CompSelectVehic) or die ('No se pudo consultar vehiculos<br>'.mysqli_error($conexion));
////  Fin Comprueba tabla vehiculos ////

//// Comprueba tabla zona ////
$CompSelectZona='SELECT * FROM zona';
$CompQryZona=mysqli_query($conexion,$CompSelectZona) or die ('No se pudo consultar vehiculos<br>'.mysqli_error($conexion));
////  Fin Comprueba tabla zona ////

	@$fecha = date("d-m-Y H:i:s",time());
	$date = new DateTime($fecha, new DateTimeZone('America/Argentina/Buenos_Aires'));
	date_default_timezone_set('America/Argentina/Buenos_Aires');
	$zonahoraria = date_default_timezone_get();
	@$fecha=date("Y-m-d",time());
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Street Parking - Estacionamiento Manual</title>
	<link rel="stylesheet" type="text/css" href="css/index.css">
		<STYLE>
			A {text-decoration: none;} 

			.radio { width: 20px; height: 20px; }
		</STYLE>
</head>
<body style="background-color: lightblue;">

	<p align="center" style="font-size: 42px;"><b><u>Estacionamiento</u></b></p>

<?php if (!isset($_POST['Parte1'])) { ?>

<center>
	<form action="EstacionamientoManual.php" method="POST">
		<fieldset style="background-color: #F9BC51;">
<!-- ////////////////////////// Parte 1 ////////////////////////// -->
<?php 
if ($CompQryVehiculos->num_rows>0){
	$SelectVehic='SELECT ve.id_vehiculo, ve.anio, ve.patente, ma.Marca, ti.Tipo, mo.Modelo, co.Color, vh.EstadoVehic FROM vehiculos ve JOIN marca ma ON ve.id_marca = ma.id_marca JOIN tipo ti ON ve.id_tipo = ti.id_tipo JOIN modelo mo ON ve.id_modelo = mo.id_modelo JOIN color co ON ve.id_color = co.id_color JOIN vehic_estado vh ON ve.id_EstadoVehic = vh.id_EstadoVehic WHERE ve.id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
	$QryVehiculos=mysqli_query($conexion,$SelectVehic) or die ('No se pudo consultar vehiculos<br>'.mysqli_error($conexion));
?>
	<label style="font-size: 25px; font-family: Century;"><b style="font-size: 25px;"><u>Seleccione su vehiculo a utilizar</u></b> <br><br>
		<select name="Vehiculo" size="1" id="Vehiculo" style="font-size: 25px; font-family: Century;">
			<?php while ( $TablaVehiculos=mysqli_fetch_assoc($QryVehiculos) ){ ?>
       			<option style="font-size: 25px; font-family: Century;" value=<?php echo $TablaVehiculos['id_vehiculo'] ?>>
<?php 
echo 'Patente &rarr; '.$TablaVehiculos['patente'].' | Marca &rarr; '.$TablaVehiculos['Marca'].' | Modelo &rarr; '.$TablaVehiculos['Modelo'];
?>
       			</option>
       		<?php } ?>
 		</select>
	</label>
<?php }else{ ?>
	<label style="font-size: 25px; font-family: Century;"><b>Necesitas de almenos un vehiculo para continuar.</b></label>
<?php } ?>
<!-- ////////////////////////// Fin Parte 1 ////////////////////////// -->

<br><br>

<!-- ////////////////////////// Parte 2 ////////////////////////// -->
<?php 
if ($CompQryZona->num_rows>0){
	$SelectZona='SELECT * FROM zona';
	$QryZona=mysqli_query($conexion,$SelectZona) or die ('No se pudo consultar vehiculos<br>'.mysqli_error($conexion));
	
	$NdeZona=1;
?>
	<label style="font-size: 25px; font-family: Century;"><b><u>Seleccione la zona</u></b> <br><br>
		<select name="Zona" size="1" id="Zona" style="font-size: 25px; font-family: Century;">
			<?php while ( $TablaZona=mysqli_fetch_assoc($QryZona) ){ ?>
       			<option style="font-size: 25px; font-family: Century;" value=<?php echo $TablaZona['id_zona'] ?>>
<?php echo 'Zona '.$NdeZona;	?>
       			</option>
       			<?php $NdeZona++; ?>
       		<?php } ?>
 		</select>
	</label>

<?php }else{ ?>
	<label style="font-size: 25px; font-family: Century;"><b>No hay zonas disponibles.</b></label>
<?php } ?>
<!-- ////////////////////////// Fin Parte 2 ////////////////////////// -->

<br><br><input type="submit" name="Parte1" id="Parte1" value="Continuar" style="font-size: 25px; font-family: Century;">
		</fieldset>
	</form>
</center>

<?php } ?>

<?php 

if (isset($_POST['Parte1'])) { ?>

<?php $Vehiculo=mysqli_real_escape_string($conexion, $_POST['Vehiculo']); 	$Zona=mysqli_real_escape_string($conexion, $_POST['Zona']); ?>

<center>
	<form action="EstacionamientoManual.php" method="POST">
		<fieldset style="background-color: #A6ED83">
<!-- ////////////////////////// Parte 3 ////////////////////////// -->
<?php 
if ($CompQryZona->num_rows>0){
	$SelectZona2='SELECT EspaciosDisponibles,id_precio FROM zona WHERE id_zona = "'.$Zona.'"';
	$QryZona2=mysqli_query($conexion,$SelectZona2) or die ('No se pudo consultar zona<br>'.mysqli_error($conexion));
	$RD=mysqli_fetch_assoc($QryZona2);
	$NdeZona2=1;
?>
	<label style="font-size: 25px; font-family: Century;"><b><u>Seleccione un espacio</u></b> <br><br>
		<select name="Espacio" size="1" id="Espacio" style="font-size: 25px; font-family: Century;">
			<?php while ( $NdeZona2 <= $RD['EspaciosDisponibles']){ ?>
       			<option style="font-size: 25px; font-family: Century;" value=<?php echo $NdeZona2 ?>>
					<?php echo 'Espacio '.$NdeZona2;	?>
       			</option>
       			<?php $NdeZona2++; ?>
       		<?php } ?>
 		</select>
	</label>

<?php }else{ ?>
	<label style="font-size: 25px; font-family: Century;"><b>No hay zonas disponibles.</b></label>
<?php } ?>
<!-- ////////////////////////// Fin Parte 3 ////////////////////////// -->

<br><br>

<!-- ////////////////////////// Parte 4 ////////////////////////// -->
<?php 

	$SelectPrecio='SELECT id_precio,PrecioFijo,PrecioPorHora,PrecioExcedido FROM precio WHERE id_precio = "'.$RD['id_precio'].'"';
	$QryPrecio=mysqli_query($conexion,$SelectPrecio) or die ('No se pudo consultar precio<br>'.mysqli_error($conexion));
	$RDPrecio=mysqli_fetch_assoc($QryPrecio);
?>

<label style="font-size: 25px; font-family: Century;"> 
	<b><u>Tiempo de estacionamiento</u></b>									<br> <br>
			<input type="radio" name="TiempoR" value="Promedio" class="radio">Promedio	<br>
			Precio por hora 🡺 $<?php echo $RDPrecio['PrecioFijo']; ?> <br>
			Si se excede del tiempo estimado, se le añadira un monto por tiempo excedido, el cual es 🡺 $<?php echo $RDPrecio['PrecioExcedido']; ?>
<br><br>
		<center>
			<select name="horas" style="font-size: 25px; font-family: Century;">
				<option value="1" selected>1 hs</option> 
 				<option value="2">2 hs</option>
  				<option value="3">3 hs</option>
  				<option value="4">4 hs</option>
  				<option value="5">5 hs</option>
  				<option value="6">6 hs</option>
  				<option value="7">7 hs</option>
  				<option value="8">8 hs</option>
  				<option value="9">9 hs</option>
  				<option value="10">10 hs</option>
  				<option value="11">11 hs</option>
  				<option value="12">12 hs</option>
			</select>
		</center> <br>
			<input type="radio" name="TiempoR" value="Libre" class="radio">Libre &rarr; (En reparación) <br>
				Precio por hora 🡺 $<?php echo $RDPrecio['PrecioPorHora']; ?> <br>
</label>

<!-- ////////////////////////// Fin Parte 4 ////////////////////////// -->

<input type="hidden" name="Veh" id="Veh" value="<?php echo $Vehiculo; ?>">
<input type="hidden" name="Zon" id="Zon" value="<?php echo $Zona; ?>">
<br><br><input type="submit" name="Parte2" id="Parte2" value="Continuar" style="font-size: 20px; font-family: Century;">
		</fieldset>
	</form>
</center>

<?php 
} // fin if (isset($_POST['Parte1'])) 


if (isset($_POST['Parte2'])) {

$id_Veh=mysqli_real_escape_string($conexion, $_POST['Veh']); 	$id_Zon=mysqli_real_escape_string($conexion, $_POST['Zon']);
$Esp=mysqli_real_escape_string($conexion, $_POST['Espacio']); 	$Tiemp=mysqli_real_escape_string($conexion, $_POST['TiempoR']);

$ok=0;

	if ($Tiemp=='Promedio') { 
		$horas=mysqli_real_escape_string($conexion, $_POST['horas']);

		$Hoy=date('Y-m-d H:i:s');
		$Agregado=strtotime($Hoy."+".$horas."hours");

		$FIN = date('Y-m-d H:i:s', strtotime($Hoy."+".$horas."hours"));

		if ($ok==0) {
			$InsEstac='INSERT INTO estacionamiento(FechaHoraInicio,latitud,longitud,id_EstadoEstac,id_usuario,id_vehiculo,id_zona,FechaHoraFin) VALUES("'.$Hoy.'",0,0,1,"'.$_SESSION['usuario']['id_usuario'].'","'.$id_Veh.'","'.$id_Zon.'","'.$FIN.'")';
			$QueryEstac=mysqli_query($conexion,$InsEstac) or die ('No se pudo completar el estacionamiento.<br>'.mysqli_error($conexion));
			mysqli_close($conexion);
				echo '<script type="text/javascript">
							alert("Estacionamiento reservado exitosamente!");
							window.location="../index.php";
			 		  </script>';
		}
	}

	if ($Tiemp=='Libre') {
				echo '<script type="text/javascript">
							alert("El estacionamineto libre aun no esta disponible.");
							window.location="../index.php";
			 		  </script>';
	}
}

?>

</body>
</html>

<?php 	
	} //isset($_SESSION['usuario']
} // ['id_rol'] == 3
?>