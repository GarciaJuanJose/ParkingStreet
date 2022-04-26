<?php
session_start();
require '../vendor/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;

if ($_SESSION == null || $_SESSION == '') {
		echo '<script type="text/javascript">
				alert("No tienes autorización para acceder a esta página, ya que no has iniciado sesión...");
				window.location="/PoolAssemble/Registro/IniciaS.php";
			 </script>';  die();
}
else if(isset($_SESSION['usuario'])){

	if (isset($_POST['GenerarPDF'])){

		include '../Registro/conexion.php';
		
		$id_reserva=$_POST['id_reserva'];

		$sql="SELECT id_reserva,id_usuario,estadoReserva,Fecha,nombre,precio,NdeMesa,CodigoPostal,Localidad,Calle,altura FROM rlmu WHERE id_reserva = '".$id_reserva."'";

		$R=$conexion->query($sql) or die ("Error consultando reserva".mysqli_error($conexion));
		$VR=mysqli_fetch_assoc($R);

		ob_start();  require_once 'ContenidoDelTicket.php';  $html = ob_get_clean();
			
		$html2pdf = new Html2Pdf('P','A4','es','true','UTF-8');  $html2pdf->writeHTML($html);
		$html2pdf->output('Comprobante.pdf');

	}else{
		  echo '<script type="text/javascript">
				window.location="../index.php";
				alert("No tienes autorización para acceder a este sitio...");
		</script>';
	}

}
?>