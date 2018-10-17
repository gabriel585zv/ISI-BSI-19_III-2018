<?php 

$val= $_GET['ocult'].serialize();
if ($val=="") {
echo "Validacion con el servidor correcta";

}else {
 
echo "El campo oculto fue modificado";

}

 ?>