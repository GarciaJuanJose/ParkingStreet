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
        if ($_SESSION['CompletarUbicacion'] == 1) {

include '../conexion.php';

$MyUbi=$_SESSION['usuario']['id_UbiUsu'];
$MyCalle=$_SESSION['usuario']['id_calle'];

$SUser='SELECT id_calle,CUIT,nombres,apellido,FechaDeNacimiento,correo,Sexo,CodigoPostal,Localidad,Calle,altura,rol FROM ussxubcestrol WHERE id_usuario = "'.$_SESSION['usuario']['id_usuario'].'"';
$QryUser=mysqli_query($conexion,$SUser) or die ('No se pudo consultar la tabla sexo<br>'.mysqli_error($conexion));
$DatosUser=mysqli_fetch_assoc($QryUser);

$ConsultaUbi='SELECT * FROM usuarios_ubicacion';
$RUbi=$conexion->query($ConsultaUbi) or die ("Error al consultar ubicacion".mysqli_error($conexion));

$ConsultaCalle='SELECT * FROM calle';
$RCalle=$conexion->query($ConsultaCalle) or die ("Error al consultar calle".mysqli_error($conexion));
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/FormRegistroUsu.css">
	<meta charset="utf-8">
	<title>Cargar ubicación</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
        <STYLE>A {text-decoration: none;} </STYLE>
</head>
<body>
    <div class="contenedor">
    <div class="form">
        <center><h2 style="font-size: 35px;">Completar datos de <span> ubicación</span></h2></center>
    </div>    
        <form action="" method="POST" enctype="application/x-www-form-urlencoded">

	    <center>
            <label style="font-size: 25px;">&#128234; <b>Codigo postal</b></label>
            <select name="CPLoc" size="1" id="CPLoc" style="WIDTH: 380px; HEIGHT: 35px; font-size: 22px; text-align-last: center;">
                        <option value="0">Seleccionar...</option>
                <?php while ($VecUbica = $RUbi->fetch_assoc()) { ?>
                    <?php if ($VecUbica['CodigoPostal'] != '' && $VecUbica['Localidad'] != ''){ ?>
                        <option value=<?php echo $VecUbica['id_UbiUsu'] ?>>
                            <?php echo $VecUbica['CodigoPostal'].' - '.$VecUbica['Localidad']; ?>
                        </option>   
                    <?php } ?>
                <?php } ?>
            </select>
        </center>
<br>
	    <center>
            <label style="font-size: 25px;">&#127968; <b>Calle</b></label>
            <select name="Calle" size="1" id="Calle" style="WIDTH: 380px; HEIGHT: 35px; font-size: 22px; text-align-last: center;">
                        <option value="0">Seleccionar...</option>
                <?php while ($VecCalle = $RCalle->fetch_assoc()) { ?>
                    <?php if ($VecCalle['Calle'] != ''){ ?>
                        <option value=<?php echo $VecCalle['id_calle'] ?>>
                            <?php echo $VecCalle['Calle']; ?>
                        </option>
                    <?php } ?>
                <?php } ?>
            </select>
        </center>
<br>
        <center>
            <label style="font-size: 25px;">&#127968; <b>Altura</b></label><br>
            <input type="number" name="Altura" placeholder="Altura" min="1" pattern="^[0-9]+" maxlength="5" style="WIDTH: 300px; HEIGHT: 30px; font-size: 25px; text-align: center; size=20;" required>
        </center> 
<br>
            <div class="btn">
                <input class="btn_reset" type="reset" name="Limpiar"> 
                <input class="btn_submit" type="submit" name="Finalizar" id="Finalizar" value="Finalizar"> <br>
                <a href="../index.php" class="btn_submit"><center>Volver</center></a>
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

    $CPLoc=mysqli_real_escape_string($conexion, $_POST['CPLoc']);
    $Calle=mysqli_real_escape_string($conexion, $_POST['Calle']);
    $Altura=mysqli_real_escape_string($conexion, $_POST['Altura']);

    $patronAltura = "/^[0-9]+$/";
    $alturaVacio=0; $alturaNoLetras=0; $alturaMenorUno=0; $CPCero=0; $CalleCero=0; $ok=0;

    if ($CPLoc==0) { $CPCero=1; $ok=1; }    if ($Calle==0) { $CalleCero=1; $ok=1; }

    if ((!preg_match($patronAltura, $Altura))){ 
        if (empty($Altura)){  
            $alturaVacio=1;  $ok=1;  
        }else{ 
            if ($Altura < 1) {  $alturaMenorUno=1;  $ok=1;  }
            $alturaNoLetras=1;  $ok=1; 
        } 
    }


    if ($ok == 0) {

        $Altura = trim($Altura);

        $InsUbiE='UPDATE usuarios SET `id_UbiUsu`="'.$CPLoc.'", `id_calle`="'.$Calle.'", `altura`="'.$Altura.'" WHERE id_usuario="'.$_SESSION['usuario']['id_usuario'].'"';
        $QueryUbiE=mysqli_query($conexion,$InsUbiE) or die ('No se pudo insertar ubicacion existente<br>'.mysqli_error($conexion));

        $Del = 'DELETE FROM usuarios_ubicacion WHERE id_UbiUsu = "'.$MyUbi.'"';
        $conexion->query($Del) or die ("Error al borrar ubicacion".mysqli_error($conexion));

        $Del2 = 'DELETE FROM calle WHERE id_calle = "'.$MyCalle.'"';
        $conexion->query($Del2) or die ("Error al borrar calle".mysqli_error($conexion));

        mysqli_close($conexion);
/*
        echo '<script type="text/javascript">  window.location="Registro/CierraS.php";
                    alert("Datos faltantes completados exitosamente.\nDebera volver a iniciar sesión para comenzar a usar su cuenta.");
              </script>';
*/
        echo '<script type="text/javascript">  window.location="../index.php";
                    alert("Datos faltantes completados exitosamente.");
              </script>';
    }

    if ($ok == 1) {
        print '<footer><h1 align="center"><font color="black"><u>Problema al completar los campos de ubicación:</u></font></h1>';
        if ($alturaVacio == 1) {
            print '<h1 align="center"><font color="black">* No ha ingresado la altura.</font></h1>'; 
        }
        if ($alturaMenorUno == 1) {
            print '<h1 align="center"><font color="black">* La altura no permite numeros negativos o 0.</font></h1>';
        }
        if ($alturaNoLetras == 1) {
            print '<h1 align="center"><font color="black">* La altura no puede contener letras.</font></h1>';
        }
        if ($CPCero == 1) {
            print '<h1 align="center"><font color="black">* Debe seleccionar un código postal.</font></h1>';
        }
        if ($CalleCero == 1) {
            print '<h1 align="center"><font color="black">* Debe seleccionar una calle.</font></h1>';
        }
        Print '</footer>';
    }

}

}else{
        echo '<script type="text/javascript"> window.location="../index.php"; alert("No tienes autorización para acceder a este sitio..."); </script>';
    }
} 
?>