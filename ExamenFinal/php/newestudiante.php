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

$id = stripslashes($_POST['id']);
$Cedula =stripslashes( $_POST['cedula']);
$Nombre =stripslashes( $_POST['Nombre']);
$Apellidos = stripslashes ($_POST['Apellidos']);
$Email = stripslashes($_POST['Email']);
$Telefono = stripslashes ($_POST['Telefono']);
$Genero = stripslashes ($_POST['Genero']);
$Talla = stripslashes ($_POST['Talla']);



 
$var_consulta= "call newestudiante('$id','$Cedula','$Nombre',
'$Apellidos','$Email','$Telefono','$Genero','$Talla');";




if (mysqli_query( $obj_conexion,$var_consulta)) {
      echo "Cambios realizados con exito";

} else {
     
  echo("Error description: ". mysqli_error($obj_conexion));

}

}



mysqli_close($obj_conexion);



?>