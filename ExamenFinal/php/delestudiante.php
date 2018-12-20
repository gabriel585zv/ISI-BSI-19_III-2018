<?php
$cons_usuario="root";
$cons_contra="";
$cons_base_datos="examenfinal";
$cons_equipo="localhost:8000";
$id = $_POST['id'];

$obj_conexion = mysqli_connect($cons_equipo,$cons_usuario,$cons_contra,$cons_base_datos);
if(!$obj_conexion)
{
	echo "<h3>No se ha podido conectar PHP - MySQL, verifique sus datos.</h3><hr><br>";
}
else
{


 
$var_consulta = "call delestudiante('$id');";

if (mysqli_query( $obj_conexion,$var_consulta)) {
      echo "Cambios realizados con exito";

} else {
     
  echo("Error description: ". mysqli_error($obj_conexion));

}

	
}


mysqli_close($obj_conexion);


?>