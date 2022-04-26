<?php
session_start();

if ($_SESSION == null || $_SESSION == '') {
		echo '<script type="text/javascript">
				alert("No tienes autorización para acceder a esta página, ya que no has iniciado sesión...");
				window.location="/StreetParking/Sesion/IniciaS.php";
			 </script>'; die();
}
else if(isset($_SESSION['usuario'])){

	@$fecha = date("d-m-Y H:i:s",time());
	$date = new DateTime($fecha, new DateTimeZone('America/Argentina/Buenos_Aires'));
	date_default_timezone_set('America/Argentina/Buenos_Aires');
	$zonahoraria = date_default_timezone_get(); @$fecha=date("Y-m-d",time()); $Hoy=date('Y-m-d');

include '../conexion.php';
	$TN='SELECT * FROM tarjetas_nombres';
	$QryTN=$conexion->query($TN) or die ("Error al consultar tarjetas_nombres".mysqli_error($conexion));
		$Bc='SELECT * FROM banco';
		$QryBc=$conexion->query($Bc) or die ("Error al consultar tarjetas_nombres".mysqli_error($conexion));
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/CompletarTarjeta.css">
	<meta charset="utf-8">
	<title>Agregar tarjeta</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<STYLE>A {text-decoration: none;} </STYLE>
</head>
<body>
    <div class="contenedor" style="font-size: 22px;">
    <div class="form">
        <center><h2 style="font-size: 35px; color: red;"><u>Cargue los datos de la tarjeta</u></h2></center>
    </div>    
        <form action="Completar_tarjeta.php" method="POST" enctype="application/x-www-form-urlencoded">
	   	<center><b>Numero de Tarjeta &#128179; &rarr;</b> 
	   		<input type="text" name="nt1" maxlength="4" style="font-size: 22px; text-align-last: center; width: 100px;" required>
	   		<input type="text" name="nt2" maxlength="4" style="font-size: 22px; text-align-last: center; width: 100px;" required>
	   		<input type="text" name="nt3" maxlength="4" style="font-size: 22px; text-align-last: center; width: 100px;" required>
	   		<input type="text" name="nt4" maxlength="4" style="font-size: 22px; text-align-last: center; width: 100px;" required>
	   	</center> <br> <br>
	    <center><b>Vencimiento &#8986; &rarr;</b>
			<?php $Hoy=date('Y-m-d'); ?>
			<input type="date" name="fechEx" style="font-size: 22px; text-align-last: center;" value="<?php echo $Hoy; ?>" min="<?php echo $Hoy; ?>" required>
	    </center> <br><br>
	    <center><b>Codigo de seguridad &rarr;</b>
	    	<input type="password" name="codseg" placeholder="&#128272; Codigo de seguridad" maxlength="3" style="font-size: 22px; text-align-last: center;" required>
	    </center> <br> <br>
    <center>
    	<b>Elija una Tarjeta &rarr;</b> <select style="font-size: 22px;" name="tarjeta">
                    			 			<option value="0">Elija una tarjeta</option>
                								<?php while ($VT = $QryTN->fetch_assoc()) { ?>
                    								<option value=<?php echo $VT['id_NombreDeTarjeta'] ?>>
                        								<?php echo $VT['NombreDeTarjeta']; ?>
                    								</option>
                								<?php } ?>
            				  	 	   </select>
		&nbsp; &nbsp; &nbsp;
            <select name="banco" style="font-size: 22px;">
                <option value="0">Elija un banco</option>
					<?php while ($VB = $QryBc->fetch_assoc()) { ?>
						<option value=<?php echo $VB['id_banco'] ?>>
							<?php echo $VB['NombreDeBanco']; ?>
						</option>
					<?php } ?>
            </select> <b>&larr; Elija un banco</b>
    </center>
            <div class="btn">
            	<input class="btn_reset" type="reset" name="Limpiar" style="font-size: 22px;">&nbsp;
            	<input class="btn_submit" type="submit" name="Finalizar" id="Finalizar" value="Finalizar" style="font-size: 22px;">
            		&nbsp;
            	<a href="../index.php" class="btn_submit" style="font-size: 22px;"><center>Volver</center></a>
            </div>
    </form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
<?php 
if (isset($_POST['Finalizar'])) {
	$NroTar1=mysqli_real_escape_string($conexion, $_POST['nt1']);		$NroTar2=mysqli_real_escape_string($conexion, $_POST['nt2']);
	$NroTar3=mysqli_real_escape_string($conexion, $_POST['nt3']);    	$NroTar4=mysqli_real_escape_string($conexion, $_POST['nt4']);
	$FechaExp=mysqli_real_escape_string($conexion, $_POST['fechEx']); 	$CodSeg=mysqli_real_escape_string($conexion, $_POST['codseg']);
	$IDTarjeta=mysqli_real_escape_string($conexion, $_POST['tarjeta']);	$IDBanco=mysqli_real_escape_string($conexion, $_POST['banco']);

	$NroTar1Vacio=0;  $NroTar2Vacio=0; 	 $NroTar3Vacio=0; $NroTar4Vacio=0;   $CodSegVacio=0;   $NroTar1CNSL=0;
	$NroTar2CNSL=0;   $NroTar3CNSL=0;  	 $NroTar4CNSL=0;  $FechaNoElejida=0; $FechaNoValida=0; $CodSegTNSL=0;  
	$TarjNoElejida=0; $BancoNoElejido=0; $TarjExist=0;    $ok=0;

	$patronNroTarjeta = "/^[0-9]{4}+$/";	$patronCodSeg = "/^[0-9]{3}+$/";
  		if (!preg_match($patronNroTarjeta, $NroTar1)){ if (empty($NroTar1)){ $NroTar1Vacio=1; $ok=1; }else{ $NroTar1CNSL=1; $ok=1; } }
  		if (!preg_match($patronNroTarjeta, $NroTar2)){ if (empty($NroTar2)){ $NroTar2Vacio=1; $ok=1; }else{ $NroTar2CNSL=1; $ok=1; } }
  		if (!preg_match($patronNroTarjeta, $NroTar3)){ if (empty($NroTar3)){ $NroTar3Vacio=1; $ok=1; }else{ $NroTar3CNSL=1; $ok=1; } }
  		if (!preg_match($patronNroTarjeta, $NroTar4)){ if (empty($NroTar4)){ $NroTar4Vacio=1; $ok=1; }else{ $NroTar4CNSL=1; $ok=1; } }
  		if (empty($FechaExp)){ $FechaNoElejida=1; $ok=1; } elseif ($FechaExp < $Hoy){ $FechaNoValida=1; $ok=1; }
  		if (!preg_match($patronCodSeg, $CodSeg)){ if (empty($CodSeg)){ $CodSegVacio=1; $ok=1; }else{ $CodSegTNSL=1; $ok=1; } }

  		if ($IDTarjeta==0) { $TarjNoElejida=1; $ok=1; }		if ($IDBanco==0) { $BancoNoElejido=1; $ok=1; }

  		$NroTar=$NroTar1.$NroTar2.$NroTar3.$NroTar4;

  		$T='SELECT * FROM tarjetas';
		$QryT=$conexion->query($T) or die ("Error al consultar tarjetas".mysqli_error($conexion));

		while ( $VecTarj=mysqli_fetch_assoc($QryT) ){ 
			if( ($VecTarj['Num_Tarjeta']==$NroTar) && ($VecTarj['id_usuario']==$_SESSION['usuario']['id_usuario']) ){ 
				$TarjExist=1; $ok=1; 
			} 
		}

  	if ($ok==0) {
		$NroTar1=trim($NroTar1);    $NroTar2=trim($NroTar2);  $NroTar3=trim($NroTar3);  $NroTar4=trim($NroTar4); 
		$FechaExp=trim($FechaExp);  $CodSeg=trim($CodSeg);

		$InsertTarjeta='INSERT INTO tarjetas(Num_Tarjeta,FechaDeExpiracion,id_banco,NroConfirm,id_NombreDeTarjeta,id_usuario) VALUES("'.$NroTar.'","'.$FechaExp.'","'.$IDBanco.'","'.$CodSeg.'","'.$IDTarjeta.'","'.$_SESSION['usuario']['id_usuario'].'")';
		$QueryTarjeta=mysqli_query($conexion,$InsertTarjeta) or die ('No se pudo insertar la tarjeta<br>'.mysqli_error($conexion));
		mysqli_close($conexion);

		echo '<div style="font-size: 28px; color: green; text-align-last: center;"><b>Tarjeta agregada exitosamente!</b></div>';
  	}

  	if ($ok==1) {
  		if (($NroTar1Vacio==1) || ($NroTar2Vacio==1) || ($NroTar3Vacio==1) || ($NroTar4Vacio==1)) {
  			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Asegúrese de completar los 4 casilleros de número de tarjeta.</b></div>';
  		}
  		if ($CodSegVacio==1) {
  			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Ingrese su código de seguridad.</b></div>';
  		}
		if (($NroTar1CNSL==1) || ($NroTar2CNSL==1) || ($NroTar3CNSL==1) || ($NroTar4CNSL==1)) {
  			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe ingresar los 16 numeros de su tarjeta respetando los casilleros.<br>Cada casillero debe contener 4 numeros.</b></div>';
		}
		if ($FechaNoElejida==1) {
  			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>No has elejido una fecha.</b></div>';
		}
		if ($FechaNoValida==1) {
  			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>La fecha ingresada no es valida, por favor seleccione otra.</b></div>';
		}
		if ($CodSegTNSL==1) {
  			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>El código de seguridad debe estar compuesto por tres numeros y no debe tener letras.</b></div>';
		}
		if ($TarjNoElejida==1) {
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debes elejir una tarjeta.</b></div>';
		}
		if ($BancoNoElejido==1) {
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debes elejir un banco.</b></div>';
		}
		if ($TarjExist==1) {
			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>La tarjeta ya se encuentra cargada.</b></div>';
		}
  	}
}// Fin if (isset($_POST['Finalizar']))
} // Fin if(isset($_SESSION['usuario'])) ?>