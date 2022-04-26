<?php
session_start();

if ($_SESSION == null || $_SESSION == '') {
		echo '<script type="text/javascript">
				alert("No tienes autorización para acceder a esta página, ya que no has iniciado sesión...");
				window.location="/StreetParking/Sesion/IniciaS.php";
			 </script>'; die();
}
else if(isset($_SESSION['usuario'])){

include '../conexion.php';
	$SelectTipo='SELECT * FROM tipo';
	$QryTipo=$conexion->query($SelectTipo) or die ("Error al consultar tipo".mysqli_error($conexion));

	$SelectMarca='SELECT * FROM marca';
	$QryMarca=$conexion->query($SelectMarca) or die ("Error al consultar marca".mysqli_error($conexion));

	$SelectModelo='SELECT * FROM modelo';
	$QryModelo=$conexion->query($SelectModelo) or die ("Error al consultar modelo".mysqli_error($conexion));

	$SelectColor='SELECT * FROM color';
	$QryColor=$conexion->query($SelectColor) or die ("Error al consultar color".mysqli_error($conexion));

	$SelectEstado='SELECT * FROM vehic_estado';
	$QryEstado=$conexion->query($SelectEstado) or die ("Error al consultar estado".mysqli_error($conexion));
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/CompletarTarjeta.css">
	<meta charset="utf-8">
	<title>Añadir vehículo</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
		<STYLE>
			A {text-decoration: none;} 

			.radio { width: 20px; height: 20px; }
		</STYLE>
</head>
<body>
    <div class="contenedor">
    <div class="form">
        <center><h2 style="font-size: 35px; color: orange;">Cargar datos del vehículo</h2></center>
    </div>    
        <form action="vehiculosUsu.php" method="POST" enctype="multipart/form-data">
	    
	    <center><b style="font-size: 22px;">Tipo de vehiculo &#128663; &rarr;</b>
			<select style="font-size: 22px; text-align-last: center;" name="Tipo">
				<option value="0">Elegir...</option>
					<?php while ($VTip = $QryTipo->fetch_assoc()) { ?>
			  			<option value=<?php echo $VTip['id_tipo'] ?>>
							<?php echo $VTip['Tipo']; ?>
						</option>
					<?php } ?>
			</select>
		</center>

		<br> <br>

	    <center><b style="font-size: 22px;">Marca &#128663; &rarr;</b>
	    	<select style="font-size: 22px; text-align-last: center;" name="Marca">
				<option value="0">Elegir...</option>
					<?php while ($VMarc = $QryMarca->fetch_assoc()) { ?>
			  			<option value=<?php echo $VMarc['id_marca'] ?>>
							<?php echo $VMarc['Marca']; ?>
						</option>
					<?php } ?>
			</select>
	    </center>

	    <br> <br>

	   	<center><b style="font-size: 22px;">Modelo &#128663; &rarr;</b>
	    	<select style="font-size: 22px; text-align-last: center;" name="Modelo">
				<option value="0">Elegir...</option>
					<?php while ($VMod = $QryModelo->fetch_assoc()) { ?>
			  			<option value=<?php echo $VMod['id_modelo'] ?>>
							<?php echo $VMod['Modelo']; ?>
						</option>
					<?php } ?>
			</select>
	    </center>

	    <br> <br>

	    <center><b style="font-size: 22px;">Año &#128663; &rarr; </b>
	    	<select style="font-size: 22px; text-align-last: center;" name="anio">
	    		<option value="0">Elegir...</option>
	    			<?php for ($i=date('o'); $i >= 1990 ; $i--) { echo '<option value="'.$i.'">'.$i.'</option>'; } ?>
	    	</select>
		</center> 

	    <br> <br>
	    
	   	<center><b style="font-size: 22px;">Color &#128663; &rarr;</b>
	    	<select style="font-size: 22px; text-align-last: center;" name="Color">
				<option value="0">Elegir...</option>
					<?php while ($VCol = $QryColor->fetch_assoc()) { ?>
			  			<option value=<?php echo $VCol['id_color'] ?>>
							<?php echo $VCol['Color']; ?>
						</option>
					<?php } ?>
			</select>
	    </center>

	    <br> <br>

		<center><b style="font-size: 22px;">Tipo de patente &#128663; &rarr;</b>
        	<select style="font-size: 22px;" name="TdP" id="TdP" onchange="d1(this)">
                <center>
                	<option value="0">Elija una opción</option>
                	<option value="1">Patente vieja (Argentina)</option>
					<option value="2">Patente nueva (Argentina)</option>
                	<option value="3">Patente del Mercosur</option>
                </center>
            </select>
<br><br><br>
			<label style="font-size: 22px;">
				<label style="font-size: 21px;">
					<b>Si el tipo de patente elegida es del Mercosur, por favor seleccioné el país correspondiente.</b>
				</label><br><br>
				<fieldset style="width: 300px; background-color: lightyellow;">
            		<input type="radio" name="PatMerc" id="P1" value="ven" class="radio" disabled="true"/> Venezuela (Ej. AB 123 CD)<br><br>
            		<input type="radio" name="PatMerc" id="P2" value="bra" class="radio" disabled="true"/> Brasil (Ej. AB 123 CD)<br><br>
            		<input type="radio" name="PatMerc" id="P3" value="uru" class="radio" disabled="true"/> Uruguay (Ej. ABC 1234)<br><br>
            		<input type="radio" name="PatMerc" id="P4" value="par" class="radio" disabled="true"/> Paraguay (Ej. ABC 1234)<br>
				</fieldset>
					<br>
            	<b style="font-size: 22px;">Patente &#128663; &rarr;</b>
            		<input type="text" name="Patente" id="Patente" placeholder= "Patente" maxlength="7" style="font-size: 22px; text-align-last: center;">
        	</label>
        </center>

            <center>
                <div class="btn">
                    <input class="btn_reset" type="reset" name="Limpiar" style="font-size: 22px;">
                    <input class="btn_submit" type="submit" name="Finalizar" id="Finalizar" value="Finalizar" style="font-size: 22px;">
                    <a href="../index.php" class="btn_submit"><center style="font-size: 22px;">Volver</center></a>
                </div>
            </center>
    </form>
    </div>


<script language="javascript" type="text/javascript">

function d1(selectTag){

 	if(selectTag.value == '3'){
		document.getElementById('P1').disabled = false;
		document.getElementById('P2').disabled = false;
		document.getElementById('P3').disabled = false;
		document.getElementById('P4').disabled = false;

 	}else{
 		document.getElementById('P1').disabled = true;
 		document.getElementById('P2').disabled = true;
 		document.getElementById('P3').disabled = true;
 		document.getElementById('P4').disabled = true;
 	}
}

</script>

</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>

<?php
	if (isset($_POST['Finalizar'])) {

	   	$Tipo=mysqli_real_escape_string($conexion, $_POST['Tipo']); 		 $Marca=mysqli_real_escape_string($conexion, $_POST['Marca']);
	   	$Modelo=mysqli_real_escape_string($conexion, $_POST['Modelo']);      $anio=mysqli_real_escape_string($conexion, $_POST['anio']);
	   	$Color=mysqli_real_escape_string($conexion, $_POST['Color']); 	     $TipoDePat=mysqli_real_escape_string($conexion, $_POST['TdP']);
	   	$Patente=mysqli_real_escape_string($conexion, $_POST['Patente']);

	   	$TipoNoElejido=0; $MarcaNoElejida=0; $ModeloNoElejido=0; $AnioNoElejido=0; $AnioAlterado=0; $ColorNoElejido=0; $TipoDePatNoElejida=0;
	   	$TipoDePatlterado=0; $PatMercAtlterado=0; $PatMercVacio=0; $PatenteVacio=0; $PatenteNoValida=0; $VehicExist=0; $ok=0;

	   	$Patente=trim($Patente); $Patente=strtoupper($Patente);

	   	if ($Tipo==0) { $TipoNoElejido=1; $ok=1; } if ($Marca==0) { $MarcaNoElejida=1; $ok=1; } if ($Modelo==0) { $ModeloNoElejido=1; $ok=1; }
	   	if ($anio==0) { $AnioNoElejido=1; $ok=1; }else{ if ( ($anio<1990) || ($anio>date('o')) ) { $AnioAlterado=1; $ok=1; } }
	   	if ($Color==0) { $ColorNoElejido=1; $ok=1; }

	   	if ($TipoDePat==0) { $TipoDePatNoElejida=1; $ok=1; }else{
	   		if ($TipoDePat<0 || $TipoDePat>3) { $TipoDePatlterado=1; $ok=1; }else{
	   			if ($TipoDePat==3) {
	   				$PatMerc=mysqli_real_escape_string($conexion, $_POST['PatMerc']);
	   					if ($PatMerc!='') {
	   						if ( ($PatMerc!='ven') && ($PatMerc!='bra') && ($PatMerc!='uru') && ($PatMerc!='par') ) {
	   							$PatMercAtlterado=1; $ok=1;
	   						}elseif ($PatMerc=='ven') {
	   							$patronValida="/^[a-zA-Z]{2}[0-9]{3}[a-zA-Z]{2}+$/";
	   							if ((!preg_match($patronValida, $Patente))){ 
	   								if (empty($Patente)){ $PatenteVacio=1; $ok=1; }else{ $PatenteNoValida=1; $ok=1; }
	   							}
	   						}elseif ($PatMerc=='bra') {
	   							$patronValida="/^[a-zA-Z]{2}[0-9]{3}[a-zA-Z]{2}+$/";
	   							if ((!preg_match($patronValida, $Patente))){ 
	   								if (empty($Patente)){ $PatenteVacio=1; $ok=1; }else{ $PatenteNoValida=1; $ok=1; }
	   							}
	   						}elseif ($PatMerc=='uru') {
	   							$patronValida="/^[a-zA-Z]{3}[0-9]{4}+$/";
	   							if ((!preg_match($patronValida, $Patente))){ 
	   								if (empty($Patente)){ $PatenteVacio=1; $ok=1; }else{ $PatenteNoValida=1; $ok=1; }
	   							}
	   						}elseif ($PatMerc=='par') {
	   							$patronValida="/^[a-zA-Z]{3}[0-9]{4}+$/";
	   							if ((!preg_match($patronValida, $Patente))){ 
	   								if (empty($Patente)){ $PatenteVacio=1; $ok=1; }else{ $PatenteNoValida=1; $ok=1; }
	   							}
	   						}
	   					}else{ $PatMercVacio=1; $ok=1; }
	   			}elseif ($TipoDePat==2) {
	   				$patronValida="/^[a-zA-Z]{2}[0-9]{3}[a-zA-Z]{2}+$/";
	   				if ((!preg_match($patronValida, $Patente))){ if (empty($Patente)){ $PatenteVacio=1; $ok=1; }else{ $PatenteNoValida=1; $ok=1; } }
	   			}elseif ($TipoDePat==1) {
	   				$patronValida="/^[a-zA-Z]{3}[0-9]{3}+$/";
	   				if ((!preg_match($patronValida, $Patente))){ if (empty($Patente)){ $PatenteVacio=1; $ok=1; }else{ $PatenteNoValida=1; $ok=1; } }
	   			}
	   		}
	   	}

	   	$V='SELECT * FROM vehiculos';
		$QryV=$conexion->query($V) or die ("Error al consultar vehiculos".mysqli_error($conexion));

		while ( $VecVehic=mysqli_fetch_assoc($QryV) ){ 
			if( ($VecVehic['anio']==$anio) && ($VecVehic['patente']==$Patente) && ($VecVehic['id_marca']==$Marca) && ($VecVehic['id_tipo']==$Tipo) && ($VecVehic['id_modelo']==$Modelo) && ($VecVehic['id_color']==$Color) && ($VecVehic['id_usuario']==$_SESSION['usuario']['id_usuario']) ){ 
				$VehicExist=1; $ok=1;
			}
			if (($VecVehic['patente']==$Patente) && ($VecVehic['id_marca']==$Marca) && ($VecVehic['id_tipo']==$Tipo) && ($VecVehic['id_modelo']==$Modelo) && ($VecVehic['id_usuario']==$_SESSION['usuario']['id_usuario']) ) {
				$VehicExist=1; $ok=1;
			}
			if ($VecVehic['patente']==$Patente && ($VecVehic['id_usuario']==$_SESSION['usuario']['id_usuario'])) {
				$VehicExist=1; $ok=1;
			}
		}

	   	if ($ok==0) {
			$InsertVehiculo='INSERT INTO vehiculos(anio,patente,id_marca,id_tipo,id_modelo,id_color,id_usuario,id_EstadoVehic) VALUES("'.$anio.'","'.$Patente.'","'.$Marca.'","'.$Tipo.'","'.$Modelo.'","'.$Color.'","'.$_SESSION['usuario']['id_usuario'].'",1)';
				$QueryVehiculo=mysqli_query($conexion,$InsertVehiculo) or die ('No se pudo insertar el vehiculo.<br>'.mysqli_error($conexion));
				mysqli_close($conexion);
					echo '<div style="font-size: 28px; color: green; text-align-last: center;"><b>Vehiculo agregado exitosamente!</b></div>';
	   	}

	   	if ($ok==1) {				
			if($TipoNoElejido==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe elegir un tipo de vehiculo.</b></div>';
			}
			if($MarcaNoElejida==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe elegir una marca.</b></div>';
			}
			if($ModeloNoElejido==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe elegir un modelo.</b></div>';
			}
			if($AnioNoElejido==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe elegir el año.</b></div>';
			}
			if($AnioAlterado==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>El año ha sido alterado.</b></div>';
			}
			if($ColorNoElejido==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe elegir un color.</b></div>';
			}
			if($TipoDePatNoElejida==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe elegir el tipo de patente deseado.</b></div>';
			}
			if($TipoDePatlterado==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Datos alterados...</b></div>';
			}
			if($PatMercAtlterado==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Datos alterados...</b></div>';
			}
			if($PatMercVacio==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Datos alterados...</b></div>';
			}
			if($PatenteVacio==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>Debe ingresar una patente.</b></div>';
			}
			if($PatenteNoValida==1){
				echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>La patente ingresada no es valida.</b></div>';
			}
	   		if($VehicExist==1){
	   			echo '<div style="font-size: 28px; color: red; text-align-last: center;"><b>El vehiculo ya se encuentra cargado.</b></div>';
	   		}
	   	}
	}
} // Fin if(isset($_SESSION['usuario'])) 
?>