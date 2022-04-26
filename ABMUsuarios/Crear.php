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

$SelectSexo= 'SELECT * FROM sexo';
$QuerySexo=mysqli_query($conexion,$SelectSexo) or die ('No se pudo insertar datos<br>'.mysqli_error($conexion));

$ConsultaUbi='SELECT * FROM usuarios_ubicacion';
$RUbi=$conexion->query($ConsultaUbi) or die ("Error al consultar ubicacion".mysqli_error($conexion));

$ConsultaCalle='SELECT * FROM calle';
$RCalle=$conexion->query($ConsultaCalle) or die ("Error al consultar calle".mysqli_error($conexion));

$ConsultaRol='SELECT * FROM rol';
$RRol=$conexion->query($ConsultaRol) or die ("Error al consultar rol".mysqli_error($conexion));

$ConsultaEstadoCuenta='SELECT * FROM usuarios_estado';
$REstadoCuenta=$conexion->query($ConsultaEstadoCuenta) or die ("Error al consultar rol".mysqli_error($conexion));
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/FormRegistroUsu.css">
	<meta charset="utf-8">
	<title>ABM Usuarios</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<!-- Si te causa problemas este meta viewport sacalo es para q auto escale la pantalla -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="contenedor">
    <div class="form">
        <center><h2>ABM <span>Usuarios</span></h2></center> <br>
    </div>    
        <form action="Crear.php" method="POST" enctype="application/x-www-form-urlencoded">
        	<font style="font-size: 20px;">
	    <center><b>CUIT (Solo números)</b><input type="int" name="cuit" placeholder= "&#128100; CUIT" maxlength="11" style="WIDTH: 250px; HEIGHT: 40px; text-align: center;" required></center><br>
	    <center><b>Nombre/s</b><input type="text" name="nombre" placeholder="&#128100; Nombre/s" maxlength="100" style="WIDTH: 350px; HEIGHT: 40px; text-align: center;" required></center> <br>
	    <center><b>Apellido</b><input type="text" name="apellido" placeholder="&#128100; Apellido" maxlength="100" style="WIDTH: 350px; HEIGHT: 40px; text-align: center;" required></center> <br>

	    <center><b>Contraseña</b><input type="password" name="contrasena" placeholder="&#128273; Contraseña" maxlength="150" style="WIDTH: 350px; HEIGHT: 40px; text-align: center;" required></center>
	    <br>
	    
        <center><b>Correo electrónico</b><input type="email" name="correo" placeholder="&#128100; Correo electrónico" maxlength="80" style="WIDTH: 350px; HEIGHT: 40px; text-align: center;" required></center> 
        <br>

<center><b>Tipo de Teléfono</b><br>
<table>
	<td>
		<input type="radio" name="tipotel" style="WIDTH: 25px; HEIGHT: 25px; text-align: center;" value="Celular"> <b>Celular</b>
	</td>
	<td></td><td></td><td></td><td></td><td></td>
	<td style="font-size: 40px;">&hArr;</td>
	<td></td><td></td><td></td><td></td><td></td>
	<td>
		<input type="radio" name="tipotel" style="WIDTH: 25px; HEIGHT: 25px; text-align: center;" value="Fijo"> <b>Fijo</b>
	</td>
</table>
</center>
        <center><b>Teléfono <font size="6">&rarr;</font></b>
        	<input type="tel" name="telefono" placeholder="&#9742; Teléfono" maxlength="11" required>
        </center> <br>
           <center>&#128100; <b>Fecha de nacimiento</b><br>
		    <select name="dia">
        	    <?php
        		    for ($i=1; $i<=31; $i++) {
            		  if ($i == date('j')){ echo '<option value="'.$i.'" selected>'.$i.'</option>'; }
            		  else{ echo '<option value="'.$i.'">'.$i.'</option>'; }
            	    }
        	    ?>
		    </select>
		    <select name="mes">
        	    <?php
        		    for ($i=1; $i<=12; $i++) {
            		    if ($i == date('m')){ echo '<option value="'.$i.'" selected>'.$i.'</option>'; }
            		    else{ echo '<option value="'.$i.'">'.$i.'</option>'; }
            	    }
        	    ?>
		    </select>
		    <select name="ano">
        	    <?php
        		    for($i=date('o'); $i>=1910; $i--){
            		    if ($i == date('o')){ echo '<option value="'.$i.'" selected>'.$i.'</option>'; }
            		    else{ echo '<option value="'.$i.'">'.$i.'</option>'; }
        		    }
        	    ?>
		    </select> <font size="6">&crarr;</font></center> <br>


         <center>&#128100; <b>Sexo</b>
            <select name="sexo">
                <?php while ( $TablaSexo=mysqli_fetch_assoc($QuerySexo) ){ ?>
                    <option value=<?php echo $TablaSexo['id_Sexo'] ?>>
                        <?php echo $TablaSexo['Sexo']; ?>
                    </option>
                <?php } ?>
		    </select>
        </center>
			</font>
<br>

<center>
<label for="caja6"><b>Rol</b>
	<?php if ($_SESSION['usuario']['id_rol'] == 2) { ?>
				<p>Cliente</p>
	<?php } ?>
	<?php if ($_SESSION['usuario']['id_rol'] == 1) { ?>
				<select name="rol" size="1" id="rol" >
					<?php while ( $TablaRol=mysqli_fetch_assoc($RRol) ){ ?>
        	        	<option value=<?php echo $TablaRol['id_rol'] ?>>
        	        		<?php echo $TablaRol['rol']; ?>
        	        	</option>
                	<?php } ?>
 		    	</select>
	<?php } ?>
</label>
<br><br>

<label for="caja6">Estado de la cuenta
	<select name="EstadoC" size="1" id="EstadoC" >
		<?php while ( $TablaEstadoCuenta=mysqli_fetch_assoc($REstadoCuenta) ){ ?>
       		<option value=<?php echo $TablaEstadoCuenta['id_EstadoDeLaCuenta'] ?>>
       			<?php echo $TablaEstadoCuenta['EstadoDeLaCuenta']; ?>
       		</option>
       	<?php } ?>
 	</select>
</label>
</center>

<p align="center">
	<font style="font-size: 20px;"><b>Código Postal - Localidad</b></font><br><br>
		<select name="CPLoc" size="1" id="CPLoc" style="WIDTH: 350px; HEIGHT: 40px; font-size: 20px;">
			<?php while ($VecUbica = $RUbi->fetch_assoc()) { ?>
				<?php if ($VecUbica['CodigoPostal'] != '' && $VecUbica['Localidad'] != ''){ ?>
					<option value=<?php echo $VecUbica['id_UbiUsu'] ?>>
						<?php echo $VecUbica['CodigoPostal'].' - '.$VecUbica['Localidad']; ?>
					</option>	
				<?php } ?>
			<?php } ?>
 		</select>
</p>

<p align="center">
	<font style="font-size: 20px;"><b>Calle</b></font><br><br>
		<select name="Calle" size="1" id="Calle" style="WIDTH: 350px; HEIGHT: 40px; font-size: 20px;">
			<?php while ($VecCalle = $RCalle->fetch_assoc()) { ?>
				<?php if ($VecCalle['Calle'] != ''){ ?>
					<option value=<?php echo $VecCalle['id_calle'] ?>>
						<?php echo $VecCalle['Calle']; ?>
					</option>
				<?php } ?>
			<?php } ?>
 		</select>
</p>

<p align="center">
	<font style="font-size: 20px;"><b>Altura</b></font><br><br>
<input type="number" name="Altura" placeholder="Altura" maxlength="50" style="WIDTH: 350px; HEIGHT: 40px; font-size: 20px; text-align: center; size=20;" required>
</p>

            <center><div class="btn"></center>

            <input class="btn_reset" type="reset" name="Limpiar" align="center">
            <input class="btn_submit" type="submit" name="Registrarse" id="Registrarse" value="Registrarse" align="center">
            <a href="../index.php" class="submit"> Volver </a>

            </div>
    </form>
    </div>
    <p style="font-size: 25px; text-align: center;"><a href="../index.php">Regresar al menu principal</a></p>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>

<?php
if (isset($_POST['Registrarse'])) {

	include '../conexion.php';

@$fecha = date("d-m-Y H:i:s",time());	$date = new DateTime($fecha, new DateTimeZone('America/Argentina/Buenos_Aires'));
date_default_timezone_set('America/Argentina/Buenos_Aires');	$zonahoraria = date_default_timezone_get();
@$fecha=date("Y-m-d",time());

	$CUIT=mysqli_real_escape_string($conexion, $_POST['cuit']);
	$Nombre=mysqli_real_escape_string($conexion, $_POST['nombre']);
	$Apellido=mysqli_real_escape_string($conexion, $_POST['apellido']);
	$Correo=mysqli_real_escape_string($conexion, $_POST['correo']);
	$ConEncrip=password_hash($_POST['contrasena'], PASSWORD_DEFAULT);
  $Telefono=mysqli_real_escape_string($conexion, $_POST['telefono']);
  $TipoDeTel=mysqli_real_escape_string($conexion, $_POST['tipotel']);

///////////////////////////////////// lo nuevo ////////////////////////////////////
  $Rol=mysqli_real_escape_string($conexion, $_POST['rol']);
  $EstadoDeLaCuenta=mysqli_real_escape_string($conexion, $_POST['EstadoC']);

  $CPLoc=mysqli_real_escape_string($conexion, $_POST['CPLoc']);
  $Calle=mysqli_real_escape_string($conexion, $_POST['Calle']);
  $Altura=mysqli_real_escape_string($conexion, $_POST['Altura']);
////////////////////////////////////////////////////////////////////////////////////

$CompRol = 'SELECT * FROM rol WHERE rol = "Cliente" OR rol = "cliente"';
$QRyCompRol=$conexion->query($CompRol);
    if ($QRyCompRol->num_rows>0){
     $QRyRol=mysqli_query($conexion, 'SELECT * FROM rol WHERE rol = "Cliente" OR rol = "cliente"');
        $recoger_rol=mysqli_fetch_assoc($QRyRol);
          $IDdelRol=$recoger_rol['id_rol'];
    }else{
          echo '<script type="text/javascript">
                    window.location="./Registrarse.php";
                    alert("No hemos podido procesar tu registro,\n por favor inténtelo de nuevo más tarde.");
                </script>';
    }

$CompEstado = 'SELECT * FROM usuarios_estado WHERE EstadoDeLaCuenta = "Inactiva" OR EstadoDeLaCuenta = "inactiva"';
$QRyCompEstado=$conexion->query($CompEstado);
  if ($QRyCompEstado->num_rows>0){
        $QRyEstado=mysqli_query($conexion, 'SELECT * FROM usuarios_estado WHERE EstadoDeLaCuenta = "Inactiva" OR EstadoDeLaCuenta = "inactiva"');
        $recoger_estado=mysqli_fetch_assoc($QRyEstado);
          $IDdelEstado=$recoger_estado['id_EstadoDeLaCuenta'];
  }else{
          echo '<script type="text/javascript">   
                    window.location="./Registrarse.php";
                    alert("No hemos podido procesar tu registro,\n por favor inténtelo de nuevo más tarde.");
                </script>';
  }

/////////////////////////////////// Variables Bandera de Control //////////////////////////////
$CuitNoValido=0; $CuitExistente=0; $CorreoExistente=0; $FormularioVacio=0; $CuitVacio=0; $CuitOnceNumerosSinLetras=0;
$NombreVacio=0; $NombreNoNumeros=0; $ApellidoVacio=0; $ApellidoNoNumeros=0; $CorreoVacio=0; $CorreoMalEscrito=0;
$ContraseñaVacio=0; $TelefonoFijoVacio=0; $TelefonoCelularVacio=0; $TelefonoCelularDiezNumerosSinLetras=0;
$TelefonoFijoOnceNumerosSinLetras=0; $TelefonoExistente=0; $MenorADieciocho=0; $DiaNoValido=0; $MesNoValido=0;
$AnoNoValido=0;	$FechaNoEsValida=0; $DiaValido=0;	$MesValido=0;	$AnoValido=0; $SexoInvalido=0; $ok=0;
///////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////// Valida CUIT ///////////////////////////////////////////
$patroncuit = "/^[0-9]{11}+$/";
$patronNombre = "/[^\s][a-zA-ZÁáÀàÉéÈèÍíÌìÓóÒòÚúÙù\s]+$/";
$patronApellido = "/[^\s][a-zA-ZÁáÀàÉéÈèÍíÌìÓóÒòÚúÙù\s]+$/";
$patronCorreo = "/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$/";
$patronFijo = "/^[0-9]{11}+$/";
$patronCelular = "/^[0-9]{10}+$/";

$CUIT = str_replace("-","",$CUIT);    $CUIT = str_replace(".","",$CUIT);	$CUIT = str_replace(" ","",$CUIT);

if (!preg_match($patroncuit, $CUIT)) {
    if (empty($CUIT)) {	$CuitVacio=1; $ok=1; } else { $CuitOnceNumerosSinLetras=1; $ok=1; }
}

function validarCuit($CT){
	$CT = preg_replace('/[^\d]/', '', (string) $CT);		$CuitTipos = [20, 23, 24, 27, 30, 33, 34];
	if (strlen($CT) != 11) {   return FALSE;	}			$Tipo = (int) substr($CT, 0, 2);
	if (!in_array($Tipo, $CuitTipos, TRUE)) {	return FALSE;	}
	$acumulado=0;		$ArrayCuit=str_split($CT);		$digito=array_pop($ArrayCuit);		$contador=count($ArrayCuit);
	for ($i = 0; $i < $contador; $i++) {	$acumulado += $ArrayCuit[ 9 - $i ] * (2 + ($i % 6));	}
	$verif = 11 - ($acumulado % 11);	$verif = $verif == 11 ? 0 : $verif;		return $digito == $verif;
}

$Resultado=validarCuit($CUIT);

if ($Resultado == 1) { $ok=0; }else{ $CuitNoValido=1; $ok=1; }
//////////////////////////////////// Fin Valida CUIT ///////////////////////////////////////////

  ////////// Valida Fecha de nacimiento  //////////
  $ano=mysqli_real_escape_string($conexion, $_POST['ano']);   $AnoActual=date('o');
  $mes=mysqli_real_escape_string($conexion, $_POST['mes']);   $MesActual=date('m');
  $dia=mysqli_real_escape_string($conexion, $_POST['dia']);   $DiaActual=date('j');
    $FechaActual=$AnoActual.'-'.$MesActual.'-'.$DiaActual;
  if ($dia >= 1 && $dia <= 31) { $DiaValido=1; }else{ $ok=1; $DiaNoValido=1; }
  if ($mes >= 1 && $mes <= 12) { $MesValido=1; }else{ $ok=1; $MesNoValido=1; }
  if ($ano >= 1910 && $ano <= $AnoActual) { $AnoValido=1; }else{ $ok=1; $AnoNoValido=1; }
  if ($DiaValido == 1 && $MesValido == 1 && $AnoValido == 1) {
  	$FechaDeNacimiento=$ano.'-'.$mes.'-'.$dia;
        $ActualMenosNac=strtotime($FechaActual)-strtotime($FechaDeNacimiento);
        $Edad=intval($ActualMenosNac/60/60/24/365.25);
        if ($Edad < 18) { $MenorADieciocho=1; $ok=1; }
  }else{ $ok=1; $FechaNoEsValida=1; }
  ////////// Fin Valida Fecha de nacimiento  //////////

  ////////// Valida Sexo  //////////
  $sexo=mysqli_real_escape_string($conexion, $_POST['sexo']);

  $SelectSexo = 'SELECT id_Sexo,Sexo FROM sexo';
  $QuerySexo=mysqli_query($conexion,$SelectSexo) or die ('No se pudo consultar la tabla sexo<br>'.mysqli_error($conexion));
  	  while ( $TablaSexo=mysqli_fetch_assoc($QuerySexo) ){
  	    if ($TablaSexo['Sexo'] == $sexo) {
  		     $IDSexEnc=$TablaSexo['id_Sexo'];
         }
  	  }
  	         if ($IDSexEnc == 0) {  $ok=1;  $SexoInvalido=1;  }
   ////////// Fin Valida Sexo  //////////

$SFU = 'SELECT CUIT,correo FROM usuarios';
$comprobacion=$conexion->query($SFU);// que pasaria si no huebieran usuarios registrados?
    if ($comprobacion->num_rows>0){
	   $consulta=mysqli_query($conexion, 'SELECT CUIT,correo FROM usuarios');
		    while ( $recoger_usuario=mysqli_fetch_assoc($consulta) ){
      		    if($CUIT == $recoger_usuario['CUIT']){  $CuitExistente=1;  $ok=1;  }
      		    if($Correo == $recoger_usuario['correo']){  $CorreoExistente=1;  $ok=1;  }
  		    }
    }

$CompTE = 'SELECT telefono FROM telefono';
$qryCompTE=$conexion->query($CompTE);
    if ($qryCompTE->num_rows>0){
      $qryTE=mysqli_query($conexion, 'SELECT telefono FROM telefono');
          while ( $recoger_telefono=mysqli_fetch_assoc($qryTE) ){
              if($Telefono == $recoger_telefono['telefono']){  $TelefonoExistente=1;  $ok=1;  }
          }
    }

if (empty($CUIT) && empty($Nombre) && empty($Apellido) && empty($Correo) && empty($ConEncrip) && empty($Telefono)) {
  $FormularioVacio=1;  $ok=1;  
}

if ((!preg_match($patronNombre, $Nombre))) {
    if (empty($Nombre)) {  $NombreVacio=1;  $ok=1;  } else {  $NombreNoNumeros=1;  $ok=1;  }
}

if ((!preg_match($patronApellido, $Apellido))) {
    if (empty($Apellido)) {  $ApellidoVacio=1;  $ok=1;  } else {  $ApellidoNoNumeros=1;  $ok=1;  }
}

if (!preg_match($patronCorreo, $Correo)) {
    if (empty($Correo)) {  $CorreoVacio=1;  $ok=1;  } else {  $CorreoMalEscrito=1;  $ok=1;  }
}

if(empty($ConEncrip)) {  $ContraseñaVacio=1;  $ok=1;  }

if ($TipoDeTel == 'Fijo') {
  if (!preg_match($patronFijo, $Telefono)) {
    if (empty($Telefono)) {  $TelefonoFijoVacio=1;  $ok=1;  } else {  $TelefonoFijoOnceNumerosSinLetras=1;  $ok=1;  }
  }
}

if ($TipoDeTel == 'Celular') {
  if (!preg_match($patronCelular, $Telefono)) {
    if (empty($Telefono)) { $TelefonoCelularVacio=1; $ok=1; } else { $TelefonoCelularDiezNumerosSinLetras=1; $ok=1; }
  }
}

if ( ($Rol != 'Cliente') && ($Rol != 2) && ($Rol != 1) ) {   
echo '<script type="text/javascript"> window.location="../index.php";  alert("El rol ha sido alterado, expulsando...");
    </script>'; $ok=1; 
}

if (empty($Rol)) {
  echo '<script type="text/javascript"> window.location="../index.php";  alert("El rol ha sido alterado, expulsando...");
      </script>'; $ok=1;
}

if ( ($EstadoDeLaCuenta != 1) && ($EstadoDeLaCuenta != 2) ) {   
echo '<script type="text/javascript"> window.location="../index.php";  alert("Estado de la cuenta alterado, expulsando...");
    </script>'; $ok=1; 
}

if (empty($EstadoDeLaCuenta)) {
  echo '<script type="text/javascript"> window.location="../index.php";  alert("Estado de la cuenta alterado, expulsando...");
      </script>'; $ok=1;
}

if ($ok==0) {

$Nombre=strtolower($Nombre);  $Nombre=ucwords($Nombre);  $Nombre=trim($Nombre);  $Apellido=strtolower($Apellido);
$Apellido=ucwords($Apellido);  $Apellido=trim($Apellido);  $Correo=strtolower($Correo);  $Correo=trim($Correo);
$Telefono=trim($Telefono);  $Telefono=trim($Telefono);

$SelectCUsr='SELECT COUNT("id_usuario") AS CuentaUsr FROM usuarios';
$QueryCUsr=mysqli_query($conexion,$SelectCUsr) or die ('No se pudo tomar el id del telefono<br>'.mysqli_error($conexion));
$FetchUsr=mysqli_fetch_assoc($QueryCUsr);
$id_UsrNuevo=$FetchUsr['CuentaUsr']+1;

$SelectCTel='SELECT COUNT("id_telefono") AS CuentaTel FROM telefono';
$QueryCTel=mysqli_query($conexion,$SelectCTel) or die ('No se pudo tomar el id del telefono<br>'.mysqli_error($conexion));
$FetchTel=mysqli_fetch_assoc($QueryCTel);
$TelNuevo=$FetchTel['CuentaTel']+1;

$SelectCUbi='SELECT COUNT("id_ubicacion") AS CuentaUbi FROM usuarios_ubicacion';
$QueryCUbi=mysqli_query($conexion,$SelectCUbi) or die ('No se pudo tomar el id la ubicacion<br>'.mysqli_error($conexion));
$FetchUbi=mysqli_fetch_assoc($QueryCUbi);
$UbiNuevo=$FetchUbi['CuentaUbi']+1;

$SelectCCalle='SELECT COUNT("id_calle") AS CuentaCa FROM calle';
$QueryCCalle=mysqli_query($conexion,$SelectCCalle) or die ('No se pudo tomar el id de la calle<br>'.mysqli_error($conexion));
$FetchCa=mysqli_fetch_assoc($QueryCCalle);
$Ca=$FetchCa['CuentaCa']+1;

$InsertUbi='INSERT INTO usuarios_ubicacion(id_UbiUsu,CodigoPostal,Localidad) VALUES("'.$UbiNuevo.'","'.''.'","'.''.'")';
$QueryUbiMasAltura=mysqli_query($conexion,$InsertUbi) or die ('No se pudo insertar la ubicacion<br>'.mysqli_error($conexion));

$InsertCALL='INSERT INTO calle(id_calle,Calle) VALUES("'.$Ca.'","'.''.'")';
$QueryCALL=mysqli_query($conexion,$InsertCALL) or die ('No se pudo insertar la calle<br>'.mysqli_error($conexion));

$Datos= 'INSERT INTO usuarios(id_usuario,CUIT,nombres,apellido,FechaDeNacimiento,correo,contrasena,id_sexo,id_UbiUsu,id_calle,altura,id_EstadoDeLaCuenta,id_rol) VALUES("'.$id_UsrNuevo.'","'.$CUIT.'","'.$Nombre.'","'.$Apellido.'","'.$FechaDeNacimiento.'","'.$Correo.'","'.$ConEncrip.'","'.$IDSexEnc.'","'.$UbiNuevo.'","'.$Ca.'",0,"'.$EstadoDeLaCuenta.'","'.$Rol.'")';
$InsertaDatos=mysqli_query($conexion,$Datos) or die ('No se pudo insertar datos<br>'.mysqli_error($conexion));

$InsertTel='INSERT INTO telefono(id_telefono,telefono,id_usuario) VALUES("'.$TelNuevo.'","'.$Telefono.'","'.$id_UsrNuevo.'")';
$QueryTel=mysqli_query($conexion,$InsertTel) or die ('No se pudo insertar la calle<br>'.mysqli_error($conexion));


mysqli_close($conexion);

include '../Mailer/EnviarCorreo.php';  EnviarCorreo($CUIT, $Nombre, $Apellido, $Correo);
}

if ($ok==1) {		
	include 'Registrarse.php';
	print '<footer><h2 align="center"><font color="black"><u>No se ha podido registrar debido a que:</u></font></h2>';
		if ($FormularioVacio == 1) {
			print '<h2 align="center"><font color="black">* El formulario de registro esta vacio, por favor complete los campos solicitados.</font></h2>';
		}else{
			if ($CuitNoValido == 1) {
				print '<h2 align="center"><font color="black">* La CUIT ingresada no es valida.</font></h2>';
			}
			if ($CuitExistente == 1) {
				print '<h2 align="center"><font color="black">* La CUIT ingresada ya pertenece a un usuario registrado.</font></h2>';
			}
			if ($CorreoExistente == 1) {
				print '<h2 align="center"><font color="black">* Correo en uso, por favor ingrese otro.</font></h2>';
			}
      if ($TelefonoExistente == 1) {
          		print '<h2 align="center"><font color="black">* Teléfono en uso, por favor ingrese otro.</font></h2>';
      }
			if ($CuitVacio == 1) {
				print '<h2 align="center"><font color="black">* No ha ingresado su CUIT.</font></h2>';
			}
			if ($CuitOnceNumerosSinLetras == 1) {
				print '<h2 align="center"><font color="black">* La CUIT debe tener 11 números y no llevar letras.</font></h2>';
			}
			if ($NombreVacio == 1) {
				print '<h2 align="center"><font color="black">* No ha ingresado su nombre.</font></h2>';
			}
			if ($NombreNoNumeros == 1) {
				print '<h2 align="center"><font color="black">* El nombre no puede tener números.</font></h2>';
			}
			if ($ApellidoVacio == 1) {
				print '<h2 align="center"><font color="black">* Llene el campo apellido.</font></h2>';
			}
			if ($ApellidoNoNumeros == 1) {
				print '<h2 align="center"><font color="black">* El apellido no puede tener números.</font></h2>';
			}
			if ($CorreoVacio == 1) {
				print '<h2 align="center"><font color="black">* No ha ingresado su correo.</font></h2>';
			}
			if ($CorreoMalEscrito == 1) {
				print '<h2 align="center"><font color="black">* Correo mal escrito. Ej: correo@example.com</font></h2>';
			}
			if ($ContraseñaVacio == 1) {
				print '<h2 align="center"><font color="black">* No ha ingresado su contraseña.</font></h2>';
			}
			if ($TelefonoFijoVacio == 1) {
				print '<h2 align="center"><font color="black">* No ha ingresado su teléfono fijo.</font></h2>';
			}
        	if ($TelefonoCelularVacio == 1) {
          		print '<h2 align="center"><font color="black">* No ha ingresado su teléfono celular.</font></h2>';
        	}
        	if ($TelefonoFijoOnceNumerosSinLetras == 1) {
          		print '<h2 align="center"><font color="black">* El teléfono fijo debe tener 11 números y no puede tener letras.</font></h2>';
        	}
        	if ($TelefonoCelularDiezNumerosSinLetras == 1) {
          		print '<h2 align="center"><font color="black">* El teléfono celular debe tener 10 números y no puede tener letras.</font></h2>';
        	}
			    if ($SexoInvalido == 1) {
          		print '<h2 align="center"><font color="black">* El valor de sexo no es valido. Ha sido alterado.</font></h2>';
        	}
        	if ($MenorADieciocho == 1) {
          		print '<h2 align="center"><font color="black">* La edad minima permitida es de 18 años.</font></h2>';
        	}
        	if ($DiaNoValido == 1) {
          		print '<h2 align="center"><font color="black">* El valor de dia no es valido. Ha sido alterado.</font></h2>';
        	}
        	if ($MesNoValido == 1) {
          		print '<h2 align="center"><font color="black">* El valor de mes no es valido. Ha sido alterado.</font></h2>';
        	}
        	if ($AnoNoValido == 1) {
          		print '<h2 align="center"><font color="black">* El valor de año no es valido. Ha sido alterado.</font></h2>';
        	}
        	if ($FechaNoEsValida == 1) {
          		print '<h2 align="center"><font color="black">* La feche de nacimiento ingresada no es valida.</font></h2>';
        	}
				Print '</footer>';
		}
}

} // FIN isset($_POST['Registrarse']
?>

<?php   }   ?>