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
  $zonahoraria = date_default_timezone_get(); @$fecha=date("Y-m-d",time()); $Hoy=date('Y-m-d');}

include '../conexion.php';
  
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/CompletarTarjeta.css">
  <meta charset="utf-8">
  <title>Baja de usuario</title>
  <meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
  
     </head>
<body>

      <center><h2 style="font-size: 35px;">Baja de <span> zona</span></h2></center>

      

    <center>
      <select>
        <!--<option value="Activo">Activo</option>-->
        <option value="Inactivo">Inactiva</option>
        <option value="Inhabilitada">Inhabilitada</option>
      </select>
    </center>

</body>
</html>
