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

$ConsultaCalle='SELECT * FROM calle';
$RCalle=$conexion->query($ConsultaCalle) or die ("Error al consultar calle".mysqli_error($conexion));}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <!--<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">-->
    <link rel="stylesheet" type="text/css" href="../css/FormRegistroUsu.css">
  <meta charset="utf-8">
  <title>Editar Zona</title>
  <meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
  <!-- Si te causa problemas este meta viewport sacalo es para q auto escale la pantalla -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="contenedor">
    <div class="form">

  <br> <br>

    <center><h2 style="font-size: 35px;">Editar <span> zona</span></h2></center>

    <br> <br>

      <center>
      <select>
        <option value="Seleccionar">Seleccionar calle</option>
        <option value=""></option>
        <!--Mostrar calles .. añadir de forma manual -->
      </select>
    </center>

    <br> <br>

    <center>

        <form action="#" method="POST" enctype="application/x-www-form-urlencoded">

        <font size="2"></font>
            <center>Altura desde &rarr;
              <input type="int" name="altD" placeholder= "&#128100; Altura desde" maxlength="5" required> 
            </center><br><br>

            <center>Altura hasta &rarr;
                <input type="int" name="altH" placeholder="&#128100; Altura hasta" maxlength="5" required> 
            </center><br><br>
    </center>

            <center><div class="btn"></center>

            <input class="btn_reset" type="reset" name="Limpiar" align="center">
            <input class="btn_submit" type="submit" name="Editar" id="Editar" value="Editar" align="center">
            <a href="../index.php" class="submit"> Volver </a>

            </div>
</form>

</body>

</html>