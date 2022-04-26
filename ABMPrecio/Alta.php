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

include '../conexion.php'; }

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/FormRegistroUsu.css">
	<meta charset="utf-8">
	<title>Precio</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<!-- Si te causa problemas este meta viewport sacalo es para q auto escale la pantalla -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="contenedor">
    <div class="form">
        <center><h2>Nuevo <span>precio</span></h2></center> <br>
    </div>    
        <form action="Alta.php" method="POST" enctype="application/x-www-form-urlencoded">

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
            <input class="btn_submit" type="submit" name="Crear" id="Crear" value="Crear" align="center">
            <a href="../index.php" class="submit"> Volver </a>

            </div>
    </form>
    </div>
    <!--<p style="font-size: 25px; text-align: center;"><a href="../index.php">Regresar al menu principal</a></p>-->
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>