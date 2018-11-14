<?php


require 'lib/nusoap.php';

$server = new nusoap_server();
$server -> configureWSDL ('converter'.'urn:converters');
$server -> register ("convert",
array("code" => 'xsd:string', "num" => 'xsd:float'),
array ("return"=> 'xsd:float')

);
$HTTP_RAW_POST_DATA = isset($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : '';
 $server->service($HTTP_RAW_POST_DATA);
?>