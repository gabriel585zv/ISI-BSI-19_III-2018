<!DOCTYPE html>
<html>
<head>
	<title> Action Post Ejercicio 10 php  </title> 
</head>
<body>
<h1>Informacion recibida</h1>
<p style="color: red" >Su nombre es : </p> 
<?php echo $_POST["texto1"]; ?>
<p  style="color: red" >Su genero es :</p> 
<?php echo $_POST["Genero"]; ?>
<p  style="color: red" >Su edad</p>
<?php echo $_POST["Rango1"]; ?>
<p  style="color: red"  >Estado Soltero</p>
<?php echo $_POST["status"]; ?>

<p  style="color: red"  >Satisfaccion (0 insatisfecho - 100 muy satisfecho) </p>
<?php echo $_POST["Satisfaction"]; ?>
</body>
</html>