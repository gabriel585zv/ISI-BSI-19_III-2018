<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css.css">

<head>
	<title>
		Conversor de Unidades 
	</title>
</head>
<body>

	<h1>Convertor de unidades de longitud</h1>
<p>Elija el tipo de conversion a realizar</p>
<select id="dropdown">

<option value="none">None</option>	
<option value="ktom" >Kilometros a metros</option>	
<option value="ktoc">Kilometros a Centimetros</option>	
<option value="ktomi">Kilometros a Milimetros</option>	
<option value="mtok">Metros a Kilometros</option>	
<option value="mtoc">Metros a Centimetros</option>	
<option value="mtomi">Metros a Milimetros</option>	
<option value="ctom">Centimetros a Metros</option>	
<option value="ctok">Centimetros a Kilometros</option>	
<option value="ctomi">Centimetros a Milimetros</option>	
<option value="mitom">Milimetros a Metros</option>	
<option value="mitoc">Milimetros a Centimetros </option>	
<option value="mitok">Milimetros a Kilometros </option>	

</select>

<br>
<div id="form">
<label>Ingrese el primer valor</label>
<br>

<input type="text" id="num1" name="num1">
 

<button id="Calculo">Calcular</button>

<p>Resultado:</p>
<p id="result"></p>
</div>

<script type="text/javascript">
  	var btn = document.getElementById('Calculo');

btn.addEventListener( "click",function(){ 

var selected = document.getElementById('dropdown').value;
var numero =  document.getElementById('num1').value;
 

 $.ajax({
        url: "client.php",
       data: {code:selected,
               num:numero},
        type: 'POST',
        dataType: 'text',
        success: function( result ) {
          var resultado =document.getElementById("result");
          resultado.innerHTML=result;
console.log(result);
  

        }

// end ajax

      }); // end event listener 


})

 </script>
</body>
</html>