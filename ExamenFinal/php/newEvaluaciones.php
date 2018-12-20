<?php
$cons_usuario="root";
$cons_contra="";
$cons_base_datos="examenfinal";
$cons_equipo="localhost:8000";

$bytes = openssl_random_pseudo_bytes(2);

$obj_conexion = mysqli_connect($cons_equipo,$cons_usuario,$cons_contra,$cons_base_datos);
if(!$obj_conexion)
{
	echo "<h3>No se ha podido conectar PHP - MySQL, verifique sus datos.</h3><hr><br>";
}

else {

$id = stripslashes ($_POST['id']);
$fecha = stripslashes($_POST['fecha']);
$IDproyecto =stripslashes( $_POST['IDproyecto']);
$cal1 = stripslashes($_POST['cal1']);
$cal2 = stripslashes( $_POST['cal2']);
$cal3 = stripslashes ($_POST['cal3']);
$cal4 = stripslashes($_POST['cal4']);
$cal5 = stripslashes($_POST['cal5']);
$cal6 = stripslashes ($_POST['cal6']);
$cal7 = stripslashes($_POST['cal7']);
$cal8 = stripslashes( $_POST['cal8']);
$cal9 = stripslashes($_POST['cal9']);
$cal10 = stripslashes( $_POST['cal10']);
$cal11 = stripslashes ($_POST['cal11']);
$total = stripslashes ($_POST['total']);

 
$var_consulta = "call new_evaluacion('$fecha', '$IDproyecto','$cal1','$cal2','$cal3',
'$cal4','$cal5','$cal6','$cal7','$cal8','$cal9','$cal10','$cal11','$total');";

if (mysqli_query( $obj_conexion,$var_consulta)) {
      echo "Cambios realizados con exito";

} else {
     
  echo("Error description: ". mysqli_error($obj_conexion));

}

}



mysqli_close($obj_conexion);



?>