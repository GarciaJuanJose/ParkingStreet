<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function EnviarCorreo($Correo){

  $CorreoEncriptado=password_hash($Correo, PASSWORD_DEFAULT);
  
	require 'PHPMailer/Exception.php';
	require 'PHPMailer/PHPMailer.php';
	require 'PHPMailer/SMTP.php';

	$mail = new PHPMailer(true);

	try {
    //Server settings
    	$mail->SMTPDebug = 0;                                       // Enable verbose debug output
    	$mail->isSMTP();                                            // Set mailer to use SMTP
    	$mail->Host       = 'smtp.gmail.com';  						// Specify main and backup SMTP servers
    	$mail->SMTPAuth   = true;                                   // Enable SMTP authentication
    	$mail->Username   = 'StreetParkingOnline@gmail.com';               // SMTP username
    	$mail->Password   = 'StreetParking1234';                               // SMTP password
    	$mail->SMTPSecure = 'tls';                                  // Enable TLS encryption, `ssl` also accepted
        $mail->Port       = 587;                                    // TCP port to connect to

    //Recipients
        $mail->CharSet = 'UTF-8';
        $mail->setFrom('StreetParkingOnline@gmail.com', 'Street Parking');
        $mail->addAddress($Correo);          // Add a recipient / Name is optional
          $mail->IsHTML(true);
          $mail->SMTPKeepAlive = true;  
		  $mail->Mailer = "smtp";

    // Attachments
        # $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
        # $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

    // Content
        $mail->Subject = 'Street Parking - Habilitar cuenta.';
        $mail->AltBody = 'Street Parking - Habilitar cuenta.';
        $mail->msgHTML('
          <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--[if !mso]><!-->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title></title>
<style type="text/css">
* {
  -webkit-font-smoothing: antialiased;
}
body {
  Margin: 0;
  padding: 0;
  min-width: 100%;
  font-family: Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  mso-line-height-rule: exactly;
}
table {
  border-spacing: 0;
  color: #333333;
  font-family: Arial, sans-serif;
}
img {
  border: 0;
}
.wrapper {
  width: 100%;
  table-layout: fixed;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
}
.webkit {
  max-width: 600px;
}
.outer {
  Margin: 0 auto;
  width: 100%;
  max-width: 600px;
}
.full-width-image img {
  width: 100%;
  max-width: 600px;
  height: auto;
}
.inner {
  padding: 10px;
}
p {
  Margin: 0;
  padding-bottom: 10px;
}
.h1 {
  font-size: 21px;
  font-weight: bold;
  Margin-top: 15px;
  Margin-bottom: 5px;
  font-family: Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
}
.h2 {
  font-size: 18px;
  font-weight: bold;
  Margin-top: 10px;
  Margin-bottom: 5px;
  font-family: Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
}
.one-column .contents {
  text-align: left;
  font-family: Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
}
.one-column p {
  font-size: 14px;
  Margin-bottom: 10px;
  font-family: Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
}
.two-column {
  text-align: center;
  font-size: 0;
}
.two-column .column {
  width: 100%;
  max-width: 300px;
  display: inline-block;
  vertical-align: top;
}
.contents {
  width: 100%;
}
.two-column .contents {
  font-size: 14px;
  text-align: left;
}
.two-column img {
  width: 100%;
  max-width: 280px;
  height: auto;
}
.two-column .text {
  padding-top: 10px;
}
.three-column {
  text-align: center;
  font-size: 0;
  padding-top: 10px;
  padding-bottom: 10px;
}
.three-column .column {
  width: 100%;
  max-width: 200px;
  display: inline-block;
  vertical-align: top;
}
.three-column .contents {
  font-size: 14px;
  text-align: center;
}
.three-column img {
  width: 100%;
  max-width: 180px;
  height: auto;
}
.three-column .text {
  padding-top: 10px;
}
.img-align-vertical img {
  display: inline-block;
  vertical-align: middle;
}
@media only screen and (max-device-width: 480px) {
table[class=hide], img[class=hide], td[class=hide] {
  display: none !important;
}
.contents1 {
  width: 100%;
}
.contents1 {
  width: 100%;
}
</style>
<!--[if (gte mso 9)|(IE)]>
  <style type="text/css">
    table {border-collapse: collapse !important;}
  </style>
  <![endif]-->
</head>

<body style="Margin:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;min-width:100%;background-color:#f3f2f0;">
<center class="wrapper" style="width:100%;table-layout:fixed;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;background-color:#f3f2f0;">
  <table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#f3f2f0;" bgcolor="#f3f2f0;">
    <tr>
      <td width="100%"><div class="webkit" style="max-width:600px;Margin:0 auto;"> 
          
          <!--[if (gte mso 9)|(IE)]>

            <table width="600" align="center" cellpadding="0" cellspacing="0" border="0" style="border-spacing:0" >
              <tr>
                <td style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;" >
                <![endif]--> 
          
          <!-- ======= start main body ======= -->
          <table class="outer" align="center" cellpadding="0" cellspacing="0" border="0" style="border-spacing:0;Margin:0 auto;width:100%;max-width:600px;">
            <tr>
              <td style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;"><!-- ======= start header ======= -->
                
                <table border="0" width="100%" cellpadding="0" cellspacing="0"  >
                  <tr>
                    <td><table style="width:100%;" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                          <tr>
                            <td align="center"><center>
                                <table border="0" align="center" width="100%" cellpadding="0" cellspacing="0" style="Margin: 0 auto;">
                                  <tbody>
                                    <tr>
                                      <td class="one-column" style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;" bgcolor="#FFFFFF"><!-- ======= start header ======= -->
                                        
                                        <table cellpadding="0" cellspacing="0" border="0" width="100%" bgcolor="#f3f2f0">
                                          <tr>
                                            <td class="two-column" style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;text-align:left;font-size:0;" ><!--[if (gte mso 9)|(IE)]>
                          <table width="100%" style="border-spacing:0" >
                          <tr>
                          <td width="20%" valign="top" style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:30px;" >
                          <![endif]-->
                                              
                                              <div class="column" style="width:100%;max-width:80px;display:inline-block;vertical-align:top;">
                                              </div>
                                              
                                              <!--[if (gte mso 9)|(IE)]>
                          </td><td width="80%" valign="top" style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;" >
                          <![endif]-->
                                              
                                              <div class="column" style="width:100%;max-width:518px;display:inline-block;vertical-align:top;">
                                                <table width="100%" style="border-spacing:0" cellpadding="0" cellspacing="0" border="0" >
                                                  <tr>
                                                    <td class="inner" style="padding-top:0px;padding-bottom:10px; padding-right:10px;padding-left:10px;"><table class="contents" style="border-spacing:0; width:100%" cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                          <td align="left" valign="top">&nbsp;</td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                </table>
                                              </div>
                                              
                                              <!--[if (gte mso 9)|(IE)]>
                          </td>
                          </tr>
                          </table>
                          <![endif]--></td>
                                          </tr>
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                        </table></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </center></td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
                </table>
                
                <!-- ======= end header ======= --> 
                
                <!-- ======= start hero image ======= --><!-- ======= end hero image ======= --> 
                
                <!-- ======= start hero article ======= -->
                
                <table class="one-column" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-spacing:0; border-left:1px solid #e8e7e5; border-right:1px solid #e8e7e5; border-bottom:1px solid #e8e7e5; border-top:1px solid #e8e7e5" bgcolor="#FFFFFF">
                  <tr>
                    <td align="left" style="padding:50px 50px 50px 50px"><p style="color:#262626; font-size:24px; text-align:left; font-family: Verdana, Geneva, sans-serif"><strong>Habilitar cuenta:</strong></p>
                      <p style="color:#000000; font-size:16px; text-align:left; font-family: Verdana, Geneva, sans-serif; line-height:22px ">Se ha realizado una solicitud para volver a habilitar su cuenta. <br><br>
Si no ha sido usted, por favor desestime este correo. <br />
                        <br />
                      </p>
                      <table border="0" align="left" cellpadding="0" cellspacing="0" style="Margin:0 auto;">
                        <tbody>
                          <tr>
                            <td align="center"><table border="0" cellpadding="0" cellspacing="0" style="Margin:0 auto;">
                                <tr>
<td width="250" height="60" align="center" bgcolor="#1f3ca6" style="-moz-border-radius: 30px; -webkit-border-radius: 30px; border-radius: 30px;"><a href="http://localhost/StreetParking/Sesion/FinalizaHabilitacion.php?C='.$CorreoEncriptado.'" style="width:250; display:block; text-decoration:none; border:0; text-align:center; font-weight:bold;font-size:18px; font-family: Arial, sans-serif; color: #ffffff" class="button_link">Habilitar</a></td>
                                </tr>
                              </table></td>
                          </tr>
                        </tbody>
                      </table>
                      <p style="color:#000000; font-size:16px; text-align:left; font-family: Verdana, Geneva, sans-serif; line-height:22px "><br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </p></td>
                  </tr>
                </table>
                
                <!-- ======= end hero article ======= --> 
                
                <!-- ======= start footer ======= -->
                
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                  <tr>
                    <td height="30">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="two-column" style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;text-align:center;font-size:0;"><!--[if (gte mso 9)|(IE)]>
                          <table width="100%" style="border-spacing:0" >
                          <tr>
                          <td width="60%" valign="top" style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;" >
                          <![endif]-->
                      
                      <!--[if (gte mso 9)|(IE)]>
                          </td><td width="40%" valign="top" style="padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;" >                <![endif]-->
                      
                      <div class="column" style="width:100%;max-width:248px;display:inline-block;vertical-align:top;">
                        <table width="100%" style="border-spacing:0">
                          <tr>
                            <td class="inner" style="padding-top:0px;padding-bottom:10px; padding-right:10px;padding-left:10px;"><table class="contents" style="border-spacing:0; width:100%">
                                <tr>
                                  <td width="32%" align="center" valign="top" style="padding-top:10px"><table width="150" border="0" cellspacing="0" cellpadding="0">

                                    </table></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
                      </div>
                      
                      <!--[if (gte mso 9)|(IE)]>  </td>                       </tr> </table>                  <![endif]--></td>
                  </tr>
                  <tr>
                    <td height="30">&nbsp;</td>
                  </tr>
                </table>
                
                <!-- ======= end footer ======= --></td>
            </tr>
          </table>
          <!--[if (gte mso 9)|(IE)]>
          </td>
        </tr>
      </table>
      <![endif]--> 
        </div></td>
    </tr>
  </table>
</center>
</body>
</html>');

echo'<h2 style="font-size: 25px; color: green;">Mensaje enviado correctamente!</h2>';
        $mail->send();
    } catch (Exception $e) {
        echo '<br><h2 align="center"><u>El mensaje no pudo ser enviado, debido al siguiente error: </u><br><br>', $mail->ErrorInfo;
    }
}