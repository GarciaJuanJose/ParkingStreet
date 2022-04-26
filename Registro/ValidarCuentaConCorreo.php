<?php
include '../conexion.php';

$CUIT = $_GET['CUIT'];
$ok=0;

$SFU = 'SELECT u.CUIT,ue.EstadoDeLaCuenta FROM usuarios u JOIN usuarios_estado ue ON u.id_EstadoDeLaCuenta = ue.id_EstadoDeLaCuenta';
$comprobacion=$conexion->query($SFU);

if ($comprobacion->num_rows>0){

$consulta=mysqli_query($conexion, 'SELECT u.CUIT,ue.EstadoDeLaCuenta FROM usuarios u JOIN usuarios_estado ue ON u.id_EstadoDeLaCuenta = ue.id_EstadoDeLaCuenta');

    while ( $recoger_dato=mysqli_fetch_assoc($consulta) ){
        if( ($CUIT == $recoger_dato['CUIT']) && (($recoger_dato['EstadoDeLaCuenta'] == 'Inactiva') || ($recoger_dato['EstadoDeLaCuenta'] == 'inactiva')) ){ 
            $ok=1; 
        }
        if( ($CUIT == $recoger_dato['CUIT']) && (($recoger_dato['EstadoDeLaCuenta'] == 'Activa') || ($recoger_dato['EstadoDeLaCuenta'] == 'activa')) ){ 
            $ok=2; 
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Validación de registro</title>
    <meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
</head>
<body>
    
<?php 
$CompBusc='SELECT id_EstadoDeLaCuenta FROM usuarios_estado WHERE EstadoDeLaCuenta = "Activa" OR EstadoDeLaCuenta = "activa"';
$QryCompBusc=mysqli_query($conexion,$CompBusc) or die ("Error al consultar comprueba id estado".mysqli_error($conexion));
if ($QryCompBusc->num_rows>0){
    $Busc='SELECT id_EstadoDeLaCuenta FROM usuarios_estado WHERE EstadoDeLaCuenta = "Activa" OR EstadoDeLaCuenta = "activa"';
    $QryBusc=mysqli_query($conexion,$Busc) or die ("Error al consultar id estado".mysqli_error($conexion));
    $BuscRD=mysqli_fetch_assoc($QryBusc);
    
    if ($ok == 1){

$datos= 'UPDATE usuarios SET id_EstadoDeLaCuenta = "'.$BuscRD['id_EstadoDeLaCuenta'].'" WHERE CUIT = "'.$CUIT.'"';
$actualizar=mysqli_query($conexion,$datos) or die ('No se pudo actualizar el estado de la cuenta <br>'.mysqli_error($conexion));
mysqli_close($conexion);
?>  
    <h2 align="center"><u>Felicidades su cuenta ha sido validada correctamente,<br>ya puede comenzar a utilizarla.</u></h2>
    <br><br>
    <h2><button><a href="/StreetParking/Sesion/IniciaS.php"><font size="4"><b>¿Iniciar Sesión?</b></font></a></button></h2>

<?php } if ($ok == 2) { ?>
    <h2 align="center"><u>Su cuenta ya se encuentra validada.</u></h2>
    <br><br>
    <h2><button><a href="/StreetParking/Sesion/IniciaS.php"><font size="4"><b>¿Iniciar Sesión?</b></font></a></button></h2>
<?php } ?>

<?php if ($ok == 0) { ?>
    <h2 align="center"><u>Lo sentimos su cuenta no ha podido ser validada.</u></h2>
<?php } }else{ ?>
    <h2 align="center"><u>Su cuenta no se podido validar. Por favor intentelo denuevo más tarde.</u></h2>
<?php } ?>

</body>
</html>