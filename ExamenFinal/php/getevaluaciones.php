<?php
$cons_usuario="root";
$cons_contra="";
$cons_base_datos="examenfinal";
$cons_equipo="localhost:8000";

$obj_conexion = mysqli_connect($cons_equipo,$cons_usuario,$cons_contra,$cons_base_datos);
if(!$obj_conexion)
{
	echo "<h3>No se ha podido conectar PHP - MySQL, verifique sus datos.</h3><hr><br>";
}
else
{

	$query =  "SELECT ID,fecha,proyectos.Nombre as Idproyecto,CalificacionRubro1, CalificacionRubro2,CalificacionRubro3,
CalificacionRubro4,CalificacionRubro5,CalificacionRubro6,CalificacionRubro7,CalificacionRubro8,CalificacionRubro9,
CalificacionRubro10,Total

FROM examenfinal.evaluaciones
join proyectos on proyectos.idProyecto =evaluaciones.Idproyecto;	";

	$result = mysqli_query($obj_conexion,$query);
	$dbdata = array();

//Fetch into associative array
	while ( $row = $result->fetch_assoc())  {
		$dbdata[]=$row;
	}

//Print array in JSON fo echo json_encode($dbdata);
	echo json_encode($dbdata);
	
}


mysqli_close($obj_conexion);


?>