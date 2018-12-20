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
$codigo = stripslashes ($_POST['codigo']);
$descripcion =stripslashes( $_POST['descripcion']);
$centroeducativo = stripslashes($_POST['centroeducativo']);
$provincia = stripslashes ($_POST['Provincia']);
$canton = stripslashes( $_POST['canton']);
$estudiante1 = stripslashes ($_POST['estudiante1']);
$estudiante2 = stripslashes ($_POST['estudiante2']);
$nombre = stripslashes ($_POST['nombre']);
$distrito =stripslashes( $_POST['dist']);
$docente = stripslashes ($_POST['tutor']);
$caltotal = stripslashes ($_POST['caltotal']);
$caldoc = stripslashes ($_POST['caldoc']);
$caljuz = stripslashes ( $_POST['caljuz']);


 
$var_consulta= "call newproyecto('$id','$codigo','$nombre',
'$descripcion','$centroeducativo','$provincia ','$canton','$distrito',
'$docente','$caldoc ','$caljuz','$caltotal' ,'$estudiante1','$estudiante2');";




if (mysqli_query( $obj_conexion,$var_consulta)) {
      echo "Cambios realizados con exito";

} else {
     
  echo("Error description: ". mysqli_error($obj_conexion));

}

}



mysqli_close($obj_conexion);



?>