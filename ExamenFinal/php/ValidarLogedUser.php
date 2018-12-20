<?php
   session_start();

$usuario = stripslashes($_POST['Username']);


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

$var_consulta= "SELECT * FROM users WHERE Username='$usuario'";
$var_resultado = $obj_conexion->query($var_consulta);

if($var_resultado->num_rows>0)
  {
while ($var_fila=$var_resultado->fetch_array())
{


if($var_fila['idrol'] == 1){
echo "Admin";



}else if ($var_fila['idrol']==2) {
echo "Juez";
}else {



header("Location:../login.html");


 }



 }
}
else
  {
header("Location:../login.html");

  }  }


mysqli_close($obj_conexion);


?>