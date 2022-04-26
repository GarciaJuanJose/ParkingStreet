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

$SUserTarjeta='SELECT * FROM tarjetaview WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$QryUserTarjeta=mysqli_query($conexion,$SUserTarjeta) or die ('Usuario sin tarjetas<br>'.mysqli_error($conexion));
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/FormRegistroUsu.css">
	<meta charset="utf-8">
	<title>Carga de saldo</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
		<STYLE>
			A {text-decoration: none;} 

			.radio { width: 20px; height: 20px; }
		</STYLE>
</head>
<body>
    <div class="contenedor">
    <div class="form">
        <center><h2 style="font-size: 38px; color: orange;">Añadir saldo</h2></center>
    </div>    
        
<form action="cargar_saldo.php" method="POST" enctype="application/x-www-form-urlencoded">
	<?php if (!isset($_POST['Siguiente'])) { ?>
	  		<center>
      		  <p style="font-size: 25px;"><b>Seleccione un metodo de pago:</b></p>
		
      		      <fieldset id="group1" style="font-size: 25px;">
      		           <input type="radio" class="radio" name="MdePago" value="Efectivo"><label style="font-size: 25px;">Efectivo</label>
      		           <input type="radio" class="radio" name="MdePago" value="Tarjeta"><label style="font-size: 25px;">Tarjeta</label>
      		      </fieldset>
      		</center>
      		      <div class="btn">
      		      		<input class="btn_reset" type="reset" name="Limpiar" style="font-size: 25px;"> 
      		      		<input class="btn_submit" type="submit" name="Siguiente" id="Siguiente" value="Siguiente" style="font-size: 25px;"> 
      		      		<a href="../index.php" class="btn_submit"><center style="font-size: 25px;">Volver</center></a>
      		      </div>
	<?php } ?>
</form>

<?php 
	if (isset($_POST['Siguiente'])) {

		if (isset($_POST['MdePago'])) {
    		$MdePago=mysqli_real_escape_string($conexion, $_POST['MdePago']);
		}else{
			echo '<script type="text/javascript">
                	alert("Debes seleccionar un metodo de pago.");
                	window.location="cargar_saldo.php";
             	 </script>';
		}

		if ($MdePago=="Efectivo") {
		   echo '<form action="cargar_saldo.php" method="POST" enctype="application/x-www-form-urlencoded">';
           echo'<center>'; 
           echo'<label style="font-size: 25px;"><b>Ingrese monto en pesos 🡺 </b></label>'; 
           echo'<input type="text" name="monto" style="font-size: 25px; text-align-last: center;" placeholder="&#36; Monto" maxlength="4" required>';
           echo'</center>';
           echo '<br><br>';

			echo '<div class="btn">';
            	echo '<input class="btn_reset" type="reset" name="Limpiar" style="font-size: 25px;"> ';
            	echo '<input class="btn_submit" type="submit" name="SiguienteEfectivo" id="SiguienteEfectivo" value="Siguiente" style="font-size: 25px;"> ';
				echo '<a href="../DireccionesPago/direcciones.php" class="btn_pagos"><center style="font-size: 25px;">Sucursales</center></a>';
            	echo '<a href="../index.php" class="btn_submit"><center style="font-size: 25px;">Menú principal</center></a>';
            echo '</div>';
            echo '</form>';
	
		}elseif ($MdePago=="Tarjeta") {
?>
<form action="cargar_saldo.php" method="POST" enctype="application/x-www-form-urlencoded">
<center>
	<label style="font-size: 25px;"><b>Seleccioné su tarjeta 🡺 </b></label>
		<select name="idTarjeta" size="1" id="CPLoc" style="WIDTH: 380px; HEIGHT: 35px; font-size: 22px; text-align-last: center;">
            <option value="0">Seleccionar...</option>
                <?php while ($VecTarjeta = $QryUserTarjeta->fetch_assoc()) { ?>
                    <option value=<?php echo $VecTarjeta['id_TarjetaDeCredito'] ?>>
<?php echo $VecTarjeta['NombreDeTarjeta'].' 🡺 '.$VecTarjeta['Num_Tarjeta']; ?>
                    </option>   
                <?php } ?>
		</select>
</center>
    
    <br><br>

<center>
	<label style="font-size: 25px;"><b>Ingrese el código de seguridad 🡺 </b></label>
	<input type="password" name="codseg" style="font-size: 25px; text-align-last: center;" placeholder="&#128272; Codigo de seguridad" maxlength="3" required>
</center>

	<br><br>

<center> 
	<label style="font-size: 25px;"><b>Ingrese el monto en pesos 🡺 </b></label>
	<input type="text" name="monto" style="font-size: 25px; text-align-last: center;" placeholder="&#36; Monto" maxlength="4" required>
</center>
	
	<br><br>

	<div class="btn">
        <input class="btn_reset" type="reset" name="Limpiar" style="font-size: 25px;">
        <input class="btn_submit" type="submit" name="SiguienteTarjeta" id="SiguienteTarjeta" value="Siguiente" style="font-size: 25px;">
        <a href="../index.php" class="btn_submit"><center style="font-size: 25px;">Menú principal</center></a>
	</div>
</form>

<?php 
		}
	}

if (isset($_POST['SiguienteTarjeta'])) {

    $idTarjeta=mysqli_real_escape_string($conexion, $_POST['idTarjeta']);
    $codseg=mysqli_real_escape_string($conexion, $_POST['codseg']);
    $monto=mysqli_real_escape_string($conexion, $_POST['monto']);

    $patroncodseg = "/^[0-9]{1,3}+$/"; 	$patronmonto = "/^[0-9]{1,4}+$/";

   	$CodSegVacio=0; $CodSegNoValido=0; $MontoVacio=0; $MontoNoValido=0; $idTarjetaNoElejido=0; $CodSegIncorrecto=0; $ok=0;
   	
   	if ($idTarjeta==0) { $idTarjetaNoElejido=1; $ok=1; }

    if (!preg_match($patroncodseg, $codseg)){ if (empty($codseg)) { $CodSegVacio=1; $ok=1; }else{ $CodSegNoValido=1; $ok=1; } }
    if (!preg_match($patronmonto, $monto)){ if (empty($monto)) { $MontoVacio=1; $ok=1; }else{ $MontoNoValido=1; $ok=1; } }

		$STC='SELECT NroConfirm FROM tarjetaview WHERE id_TarjetaDeCredito = "'.$idTarjeta.'"';
		$QrySTC=mysqli_query($conexion,$STC) or die ('Usuario sin tarjetas<br>'.mysqli_error($conexion));
		$VecSTC=mysqli_fetch_assoc($QrySTC);

		if ($VecSTC['NroConfirm']!=$codseg) { $CodSegIncorrecto=1; $ok=1; }

	if ($ok==0) {
		$SUsrs='SELECT SaldoEnCuenta FROM usuarios WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
		$QrySUsrs=mysqli_query($conexion,$SUsrs) or die ('Consulta del usuario<br>'.mysqli_error($conexion));
		$VecUsrs=mysqli_fetch_assoc($QrySUsrs);

		$MontoACargar=$VecUsrs['SaldoEnCuenta']+$monto;

		$ActSaldo= 'UPDATE usuarios SET `SaldoEnCuenta` = "'.$MontoACargar.'" WHERE `id_usuario` = "'.$_SESSION['usuario']['id_usuario'].'"';
		$QryActSaldo=mysqli_query($conexion,$ActSaldo) or die ('Error al actualizar el saldo<br>'.mysqli_error($conexion));
		mysqli_close($conexion);

		echo '<script type="text/javascript">
                window.location="../index.php";
                alert("Transacción de dinero realizada exitosamente!\nRegresando al menú principal.");
        	  </script>';
	}

	if ($ok==1) {
		if($CodSegVacio==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debes ingresar el código de seguridad.</b></div>';
		}
		if($CodSegNoValido==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>El código de seguridad no es valido.</b></div>';
		}
		if($MontoVacio==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debes ingresar un monto.</b></div>';
		}
		if($MontoNoValido==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>El monto ingresado no es valido.</b></div>';
		}
		if($idTarjetaNoElejido==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debes elejir una tarjeta.</b></div>';
		}
		if($CodSegIncorrecto==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>El código de confirmacion es incorrecto.</b></div>';
		}
		
	}
}

if (isset($_POST['SiguienteEfectivo'])) {

	$monto=mysqli_real_escape_string($conexion, $_POST['monto']);

	$patronmonto = "/^[0-9]{1,4}+$/"; $MontoVacio=0; $MontoNoValido=0; $ok=0;

	if (!preg_match($patronmonto, $monto)){ if (empty($monto)) { $MontoVacio=1; $ok=1; }else{ $MontoNoValido=1; $ok=1; } }


	if ($ok==0) {
		$SUsrs='SELECT SaldoEnCuenta FROM usuarios WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
		$QrySUsrs=mysqli_query($conexion,$SUsrs) or die ('Consulta del usuario<br>'.mysqli_error($conexion));
		$VecUsrs=mysqli_fetch_assoc($QrySUsrs);

		$MontoACargar=$VecUsrs['SaldoEnCuenta']+$monto;

		$ActSaldo= 'UPDATE usuarios SET `SaldoEnCuenta` = "'.$MontoACargar.'" WHERE `id_usuario` = "'.$_SESSION['usuario']['id_usuario'].'"';
		$QryActSaldo=mysqli_query($conexion,$ActSaldo) or die ('Error al actualizar el saldo<br>'.mysqli_error($conexion));
		mysqli_close($conexion);

		echo '<script type="text/javascript">
                window.location="../index.php";
                alert("Transacción de dinero realizada exitosamente!\nRegresando al menú principal.");
        	  </script>';
	}

	if ($ok==1) {
		if($MontoVacio==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debes ingresar un monto.</b></div>';
		}
		if($MontoNoValido==1){
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>El monto ingresado no es valido.</b></div>';
		}
	}
}

?>


    </div>    
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>

<?php   }   ?>