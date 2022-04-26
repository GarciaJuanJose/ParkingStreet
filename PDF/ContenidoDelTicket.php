<?php 
session_start();
if ($_SESSION == null || $_SESSION == '') {
		echo '<script type="text/javascript">
				alert("No tienes autorización para acceder a esta página, ya que no has iniciado sesión...");
				window.location="/StreetParking/Sesion/IniciaS.php";
			 </script>';  die();
}
else if(isset($_SESSION['usuario'])){

?>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<title>Comprobante de estacionamiento - StreetParking</title>
		<style type="text/css">
			img { align-content: auto; }

			ul {
  				display: block;
  				list-style-type: none;
  				margin-top: 1em;
  				margin-bottom: 1 em;
  				margin-left: 0;
  				margin-right: 0;
  				padding-left: 40px;
			}

			fieldset {
    			border:1px solid green;
    			-moz-border-radius:8px;
    			-webkit-border-radius:8px;	
    			border-radius:8px;
    			background-color: lightyellow;
			}

			fieldset legend {
				background-color: lightgreen;
			}

		</style>
	</head>
<body>
	<div class="Portada">
		<p align="center">
			<img src="../Imagenes/1.png" width="700" height="135" />
		</p>
	</div>
<p>
	    <font style="font-size: 26px;"><u><b>Comprobante de la carga</b></u></font>
	<h2>
	   		<u>Cliente</u>: <?php echo $_SESSION['usuario']['CUIT']; ?><br><br>

	   		idTarjeta

	<fieldset>
			<legend>Datos de la operación:</legend>
	   	<ul>
	   		<li>Saldo anterior: <?php echo $VecUsrs['SaldoEnCuenta']; ?></li>
	   		<li>Monto a agregado: <?php echo $monto; ?></li>
	   		<li>Saldo actual: <?php echo $MontoACargar; ?></li>
		</ul>
	</fieldset>
		<br>
<font style="font-size: 16px;">
	<b>Importante: Este documento se debera descargar y/o imprimir para ser utilizado como comprobante. El precio puede variar. Se recomienda descargarlo una vez creada la reserva.</b>
</font>
	
	</h2>
</p>
	
</body>
</html>
<?php } ?>