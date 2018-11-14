<?php
require 'converter.php';
require  'lib/nusoap.php';

$code=$_POST["code"];
$num =$_POST["num"];
 
$client = new nusoap_client('http://localhost/TareaConvertorUnidades/service.php?wsdl');
$result = $client -> call ('converter',array("code" => $code, "num" => $num));
echo  json_encode($result) ;

 


 
?>