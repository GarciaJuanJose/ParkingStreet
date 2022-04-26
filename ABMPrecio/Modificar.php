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
	<title>Editar precio</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<!-- Si te causa problemas este meta viewport sacalo es para q auto escale la pantalla -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="contenedor">
    <div class="form">
        <center><h2>Editar <span>precio</span></h2></center> <br>
    </div>    
          <form action="Modificar.php" method="POST" enctype="application/x-www-form-urlencoded">

        <center>Precio fijo&rarr;
      <input type = "number" step = "any" name="precioFijo" placeholder= "&#128100; precio fijo" maxlength="4" required>
    </center><br><br>

      <center>Precio por hora/s &rarr;
        <input type = "number" step = "any" name="precioHora" placeholder="&#128100; Precio por hora" maxlength="4" required>
      </center><br><br>

      <center>Precio excedido &rarr;
        <input type = "number" step = "any" name="precioExc" placeholder="&#128100; Precio excedido" maxlength="4" required>
      </center><br><br>
            <center><div class="btn"></center>

            <input class="btn_reset" type="reset" name="Limpiar" align="center">
            <input class="btn_submit" type="submit" name="Modificar" id="Modificar" value="Modificar" align="center">
            <a href="../index.php" class="submit"> Volver </a>

            </div>
    </form>

<?php   }   ?>