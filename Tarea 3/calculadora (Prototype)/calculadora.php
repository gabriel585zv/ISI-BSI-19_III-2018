<?php
$val1 = $_GET['valor1'];
$val2 = $_GET['valor2'];
$op = $_GET['opera'];

if($op == 'sumar'){
	echo $val1 + $val2;
}else if($op == 'restar'){
	echo $val1 - $val2;
}else if($op == 'multiplicar'){
	echo $val1 * $val2;
}else if($op == 'dividir'){
	echo $val1 / $val2;
}
else echo "Error";

?>
