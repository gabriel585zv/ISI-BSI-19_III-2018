document.addEventListener('DOMContentLoaded', function() {
  validar();
 Getjueces();
}, false);

 
var logout=document.getElementById("logout");
logout.addEventListener("click",function (){
  delete_cookie("Username");

Seesion.Abandon();
Response.Cookies.Clear();
 

});


function validar (){


var Username =  Cookies.get('Username');


$.ajax({
  //revisar que rol tiene el user que esta logueadologueado tiene rol 
        url: "php/ValidarLogedUser.php",
        type: 'POST',
        dataType: 'text',
        data :
        {
Username:Username
        },
        success: function( result ) {
          var msj =document.getElementById("msj");
     
 if (result=="Admin") {
   console.log("Admin");

}else if (result="Juez") {

var div =document.getElementById("divnew");
   div.style.display = 'none';
}else{
        window.location.href = "login.html"; 


}


        }



      });

}
 



//Event listeners


var  btn_del =document.getElementById("btn_del");
btn_del.addEventListener(
"click",function (){

if(confirm("Esta seguro que desea eliminar")){

var Username= document.getElementById("Username").value;
 

//Aca tengo construido el jason listo para insert

$.ajax({
        url: "php/deljuez.php",
        type: 'POST',
        dataType: 'text',
        data :
        {
Username:Username
        },
        success: function( result ) {
          var msj =document.getElementById("msj");
msj.textContent= result;    
msj.style="display:block";     
 $("#Tbl").find("tr:not(:first)").remove();

Getjueces();

setTimeout(function(){
msj.textContent="";
}, 3000);


        }



      });


var id_ = document.getElementById("id");
var cedula_ = document.getElementById("cedula");
var nombre_ = document.getElementById("nombre");
var apellidos_ = document.getElementById("apellidos");
var email_ = document.getElementById("email");
var telefono_ = document.getElementById("Telefono");
var genero_ = document.getElementById("genero");
var username_ = document.getElementById("Username");
 

id_.value="";
 cedula_.value="";
nombre_.value="";
 apellidos_.value= "";
email_.value="";
telefono_.value="";
genero_.value="";
username_.value="";


}


} );

//load existen evaluaciones on click
$('#Tbl').on('click', 'tr', function(event) {
   var id = $(this).find('td').eq(0).html(); // gets column 1 values
   var cedula = $(this).find('td').eq(1).html(); // gets column 2 values
   var nombre = $(this).find('td').eq(2).html(); // gets column 2 values
   var apellidos = $(this).find('td').eq(3).html(); // gets column 2 values
   var email = $(this).find('td').eq(4).html(); // gets column 2 values
   var telefono = $(this).find('td').eq(5).html(); // gets column 2 values
   var genero = $(this).find('td').eq(6).html(); // gets column 2 values
   var username = $(this).find('td').eq(7).html(); // gets column 2 values
  

var id_ = document.getElementById("id");
var cedula_ = document.getElementById("cedula");
var nombre_ = document.getElementById("nombre");
var apellidos_ = document.getElementById("apellidos");
var email_ = document.getElementById("email");
var telefono_ = document.getElementById("Telefono");
var genero_ = document.getElementById("genero");
var username_ = document.getElementById("Username");
 

id_.value=id;
 cedula_.value=cedula;
cedula_.style.readonly = "readonly";
cedula_.style.disabled = "true";

nombre_.value=nombre;
 apellidos_.value= apellidos;
email_.value=email;
telefono_.value=telefono;
genero_.value=genero;
username_.value=username;
 
});

//


var btn_new=document.getElementById("btn_new");
btn_new.addEventListener(
"click",
function(){
	var nuevo = [];
  var msj= document.getElementById("msj").value;

  var id= document.getElementById("id").value;
var cedula= document.getElementById("cedula").value;
var Nombre= document.getElementById("nombre").value;
var Apellidos= document.getElementById("apellidos").value;
var Email= document.getElementById("email").value;
var Telefono= document.getElementById("Telefono").value;
var Username= document.getElementById("Username").value;
var Genero= document.getElementById("genero");
var selectedgenero=Genero.options[Genero.selectedIndex].value;


//Aca tengo construido el jason listo para insert

$.ajax({
        url: "php/newjuez.php",
        type: 'POST',
        dataType: 'text',
        data :
        {

id:id,
cedula:cedula,
Nombre:Nombre,
Apellidos:Apellidos,
Email:Email,
Telefono:Telefono,
Username:Username,
Genero:selectedgenero



        },
        success: function( result ) {
          var msj =document.getElementById("msj");
msj.textContent= result;    
msj.style="display:block";     
 $("#Tbl").find("tr:not(:first)").remove();

Getjueces();
setTimeout(function(){
msj.textContent="";
}, 5000);


        }



      });







setTimeout(function(){
msj.textContent="";
}, 3000);



}

	);

//


var btn_new=document.getElementById("btn_new");
btn_new.addEventListener(
"click",
function(){

var id= document.getElementById("id").value;

//Aca tengo construido el jason listo para insert

$.ajax({
        url: "php/deljuez.php",
        type: 'POST',
        dataType: 'text',
        data :
        {
id:id
        },
        success: function( result ) {
          var msj =document.getElementById("msj");
msj.textContent= result;    
msj.style="display:block";     
 $("#Tbl").find("tr:not(:first)").remove();

Getjueces();



        }



      });








}

  );

//

function Getjueces () {

$.ajax({
        url: "php/getjueces.php",
        type: 'Get',
        dataType: 'json',
        success: function( result ) {

Loadtable(result);

         
        }

      });

}


function Loadtable(result) {
var tbl = document.getElementById('Tbl');
 $("#Tbl").find("tr:not(:first)").remove();
var size =result.length;




for (var i = 0; i < size; i++) {

var row = tbl.insertRow(tbl.rows.length);
var cel1 = row.insertCell(0);
var cel2 = row.insertCell(0);
var cel3 = row.insertCell(0);
var cel4 = row.insertCell(0);
var cel5 = row.insertCell(0);
var cel6 = row.insertCell(0);
var cel7 = row.insertCell(0);
var cel8 = row.insertCell(0);

cel1.innerHTML =   result[i].Username;
cel2.innerHTML = result[i].Genero;	
cel3.innerHTML =  result[i].Telefono;	
cel4.innerHTML =   result[i].Email;
cel5.innerHTML = 	result[i].Apellidos;
cel6.innerHTML =   result[i].Nombre;
cel7.innerHTML =   result[i].Cedula; 
cel8.innerHTML = 	result[i].ID;


}


}


function validaciones (){
var cedula =document.getElementById("cedula");
var msj =document.getElementById("msj");

if (cedula.value =="") {

msj.textContent="Debe ingresar el numero de cedula";

return true;

}

}



