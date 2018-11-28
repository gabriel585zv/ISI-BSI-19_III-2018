<?php
   session_start();

$usuario = $_POST['username'];
$pass = sha1($_POST['password']);


if(empty($usuario) || empty($pass)){
echo "No ingreso la informacion requerida";
exit();
}


$cons_usuario="root";
$cons_contra="";
$cons_base_datos="dbtarea";
$cons_equipo="localhost";

$obj_conexion = mysqli_connect($cons_equipo,$cons_usuario,$cons_contra,$cons_base_datos);
if(!$obj_conexion)
{
    echo "<h3>No se ha podido conectar PHP - MySQL, verifique sus datos.</h3><hr><br>";
}
else
{
    echo "<h3>Conexion Exitosa PHP - MySQL</h3><hr><br>";
}

$var_consulta= "SELECT * FROM user WHERE Email='$usuario'";
$var_resultado = $obj_conexion->query($var_consulta);

if($var_resultado->num_rows>0)
  {
while ($var_fila=$var_resultado->fetch_array())
{




if($var_fila['password'] == $pass){
   $_SESSION['Username'] = $usuario;


header("Location:../home.html");


}else{

header("Location:../index.html");


 }



 }
}
else
  {
    echo "No hay Registros";

  }  

mysqli_close($obj_conexion);


?>