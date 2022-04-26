<?php
include '../conexion.php';
$SelectSexo= 'SELECT * FROM sexo';
$QuerySexo=mysqli_query($conexion,$SelectSexo) or die ('No se pudo insertar datos<br>'.mysqli_error($conexion));
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/FormRegistroUsu.css">
	<meta charset="utf-8">
	<title>Formulario de registro</title>
	<meta name="viewport" content="width-device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1">
	<!-- Si te causa problemas este meta viewport sacalo es para q auto escale la pantalla -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="contenedor">
    <div class="form">
        <center><h2>Ingrese los datos requeridos para completar el siguiente <span>formulario</span></h2></center> <br>
    </div>    
        <form action="ValidarRegistrarse.php" method="POST" enctype="application/x-www-form-urlencoded">
<font size="4">
		<center>CUIT (Solo números) &rarr;
			<input type="int" name="cuit" placeholder= "&#128100; CUIT" maxlength="11" required>
		</center><br><br>

	    <center>Nombre/s &rarr;
	    	<input type="text" name="nombre" placeholder="&#128100; Nombre/s" maxlength="100" required>
	    </center><br><br>

	    <center>Apellido &rarr;
	    	<input type="text" name="apellido" placeholder="&#128100; Apellido" maxlength="100" required>
	    </center><br><br>

	    <center>Contraseña &rarr;
	    	<input type="password" name="contrasena" placeholder="&#128273; Contraseña" maxlength="150" required>
		</center><br><br>

        <center>
        	Correo &rarr;<input type="email" name="correo" placeholder="&#128100; Correo electrónico" maxlength="80" required>
    	</center><br>

        <center>Teléfono &darr; <br>
        		<input type="radio" name="tipotel" value="Celular">Celular
        		<input type="radio" name="tipotel" value="Fijo">Fijo
        </center>

        <center>
        	<input type="tel" name="telefono" placeholder="&#9742; Teléfono" maxlength="11" required>
        </center><br>

           <center>&#128100; Fecha de nacimiento &rarr;
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
		    </select></center><br>

         <center>&#128100; Sexo &rarr;
            <select name="sexo">
                <?php while ( $TablaSexo=mysqli_fetch_assoc($QuerySexo) ){ ?>
                    <option>
                        <?php echo $TablaSexo['Sexo']; ?>
                    </option>
                <?php } ?>
		    </select>
        </center> 
</font>
            <center><div class="btn"></center>

            <input class="btn_reset" type="reset" name="Limpiar" align="center">
            <input class="btn_submit" type="submit" name="Registrarse" id="Registrarse" value="Registrarse" align="center"> 

            </div>
    </form>
    </div>
    <p style="font-size: 25px; text-align: center;"><a href="../index.html">Regresar al menu principal</a></p>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>