<?php

function convert ($code,$num) {
 
if ($code == "ktom") {
// Kilometros a metros

return  $num/1000;
 

}else if ($code =="ktoc") {
###Kilometros a Centimetros
return  $num/100000;
 

}else if($code =="ktomi"){
## kilometros a Milimetros
return  $num/1000000;
 
}else if ($code=="mtok") {
	# Metros a Kilometros
 return  $num/1000;
 
}else if ($code=="mtoc") {
	# Metros a Centimetros
return  $num/100;
 

}else if ($code=="mtomi") {
#Metros a Milimetros
return  $num/1000;
 


}else if($code=="ctom"){

	#centimetros a metros 
	return  $num/100;
 


}else if ($code=="ctok") {
	# Centimetros a Kilometros
	return  $num/100000;
 

}else if ($code=="ctomi") {
# Centimetros a Milimetros
	return  $num/10;
 
}else if ($code=="mitom") {
	# Milimetros a Metros
	return  $num/1000;
 

}else if ($code=="mitoc") {
	# Milimetros a Centimetros
return  $num/10;
 

}else if ($code=="mitok") {
	# Milimetros a Kilometros
return  $num/1000000;
 
	
}else 

	return "Ha ocurrido un error inesperado";


}

?> 