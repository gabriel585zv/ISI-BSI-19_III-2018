document.addEventListener('DOMContentLoaded', function() {

validar();

	Getevaluaciones();
 	Getproyects();
// listeners


}, false);

 
var logout=document.getElementById("logout");
logout.addEventListener("click",function (){
  delete_cookie("Username");

Seesion.Abandon();
Response.Cookies.Clear();
 

});



function validar (){
 function delete_cookie(name) {
  document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
var logout=document.getElementById("logout");
logout.addEventListener("click",function (){

delete_cookie("Username");

});

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

   console.log("Juez");
var div =document.getElementById("btn_del");
   div.style.display = 'none';
}else{
        window.location.href = "login.html"; 


}


        }



      });

}

//load existen evaluaciones on click
$('#Tbl').on('click', 'tr', function(event) {
   var id = $(this).find('td').eq(0).html(); // gets column 1 values
   var fecha = $(this).find('td').eq(1).html(); // gets column 2 values
   var IDProyecto = $(this).find('td').eq(2).html(); // gets column 2 values
   var cal1 = $(this).find('td').eq(3).html(); // gets column 2 values
   var cal2 = $(this).find('td').eq(4).html(); // gets column 2 values
   var cal3 = $(this).find('td').eq(5).html(); // gets column 2 values
   var cal4 = $(this).find('td').eq(6).html(); // gets column 2 values
   var cal5 = $(this).find('td').eq(7).html(); // gets column 2 values
   var cal6 = $(this).find('td').eq(8).html(); // gets column 2 values
   var cal7 = $(this).find('td').eq(9).html(); // gets column 2 values
   var cal8 = $(this).find('td').eq(10).html(); // gets column 2 values
   var cal9 = $(this).find('td').eq(11).html(); // gets column 2 values
   var cal10 = $(this).find('td').eq(12).html(); // gets column 2 values
   var total = $(this).find('td').eq(13).html(); // gets column 2 values

var id_ = document.getElementById("id");
var fecha_ = document.getElementById("fecha");
var IDProyecto_ = document.getElementById("proyecto");
var cal1_ = document.getElementById("cal1");
var cal2_ = document.getElementById("cal2");
var cal3_ = document.getElementById("cal3");
var cal4_ = document.getElementById("cal4");
var cal5_ = document.getElementById("cal5");
var cal6_ = document.getElementById("cal6");
var cal7_ = document.getElementById("cal7");
var cal8_ = document.getElementById("cal8");
var cal9_ = document.getElementById("cal9");
var cal10_ = document.getElementById("cal10");
var total_ = document.getElementById("total");
 
id_.value=id;
fecha_.value=fecha;
IDProyecto_.value=IDproyecto;
cal1_.value=cal1;
cal2_.value=cal2;
cal3_.value=cal3;
cal4_.value=cal4;
cal5_.value=cal5;
cal6_.value=cal6;
cal7.value=cal7;
cal8_.value=cal8;
cal9_.value=cal9;
cal10_.value=cal10;
total_.value=total;


});



var btn_new=document.getElementById("btn_new");


btn_new.addEventListener(
"click",
function(){

var id= document.getElementById("id").value;
var fecha= document.getElementById("fecha").value;
var IDproyecto= $("#proyecto option:selected").val();
var cal1= document.getElementById("cal1").value;
var cal2= document.getElementById("cal2").value;
var cal3= document.getElementById("cal3").value;
var cal4= document.getElementById("cal4").value;
var cal5= document.getElementById("cal5").value;
var cal6= document.getElementById("cal6").value;
var cal7= document.getElementById("cal7").value;
var cal8= document.getElementById("cal8").value;
var cal9= document.getElementById("cal9").value;
var cal10= document.getElementById("cal10").value;
var cal11= document.getElementById("cal11").value;
var total= document.getElementById("total").value;


 
$.ajax({
        url: "php/newEvaluaciones.php",
        type: 'POST',
        dataType: 'text',
        data :
        {

id:id,
fecha:fecha,
IDproyecto:IDproyecto,
cal1:cal1,
cal2:cal2,
cal3:cal3,
cal4:cal4,
cal5:cal5,
cal6:cal6,
cal7:cal7,
cal8:cal8,
cal9:cal9,
cal10:cal10,
cal11:cal11,
total:total

        },
        success: function( result ) {
          var msj =document.getElementById("msj");
 msj.textContent= result;    
msj.style="display:block";     
 $("#Tbl").find("tr:not(:first)").remove();

	Getevaluaciones();



        }



      });

}

    );





//Funciones


function Getproyects(){

	var	Proyect =document.getElementById("proyecto");
 $.ajax({
        url: "php/loadproyects.php",
        type: 'Get',
        dataType: 'json',
        success: function( result ) {
          

var size=result.length;
var html = "<select = id='proyecto'>";
for (var i = 0; i < size; i++) {
html += "<option value='"+result[i].idProyecto+"'>"+result[i].Nombre+"</option>";

}


html += "</select";
$('#proyecto').html(html);

         
        }

      });



}



function Getevaluaciones () {

	$.ajax({
		url: "php/getevaluaciones.php",
		type: 'Get',
		dataType: 'json',
		success: function( result ) {
 
			Loadtable(result);

			
		}

	});

}


function Loadtable(result) {
	var tbl = document.getElementById('Tbl');
 
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
		var cel9 = row.insertCell(0);
		var cel10 = row.insertCell(0);
		var cel11 = row.insertCell(0);
		var cel12 = row.insertCell(0);
		var cel13 = row.insertCell(0);
		var cel14 = row.insertCell(0);



		cel1.innerHTML =   result[i].Total;
		cel2.innerHTML = result[i].CalificacionRubro10;	
		cel3.innerHTML =  result[i].CalificacionRubro9;	
		cel4.innerHTML =   result[i].CalificacionRubro8;
		cel5.innerHTML = 	result[i].CalificacionRubro7;
		cel6.innerHTML =   result[i].CalificacionRubro6;
		cel7.innerHTML =   result[i].CalificacionRubro5; 
		cel8.innerHTML = 	result[i].CalificacionRubro4;
		cel9.innerHTML = 	result[i].CalificacionRubro3;
		cel10.innerHTML =   result[i].CalificacionRubro2;
		cel11.innerHTML =   result[i].CalificacionRubro1; 
		cel12.innerHTML = result[i].Idproyecto;	
		cel13.innerHTML = result[i].fecha;	
		cel14.innerHTML = result[i].ID;	


	}


}


function Getprovincia () {

	$.ajax({
   url: "https://ubicaciones.paginasweb.cr/provincias.json",
		type: 'Get',
		dataType: 'json',
		success: function( result ) {

 var html = "<select>";
                            for(key in result) {
                                html += "<option value='"+key+"'>"+result[key]+"</option>";
                            }
                            html += "</select";
                            $('#provincia').html(html);

		}

	});

}


function GetCantones () {

	$.ajax({
   url: "https://ubicaciones.paginasweb.cr/provincias.json",
		type: 'Get',
		dataType: 'json',
		success: function( result ) {

 var html = "<select>";
                            for(key in result) {
                                html += "<option value='"+key+"'>"+result[key]+"</option>";
                            }
                            html += "</select";
                            $('#canton').html(html);

		}

	});

}




function GetDistritos (Canton) {
var selectedcanton = document.getElementById(canton).value;
	$.ajax({
   url: "https://ubicaciones.paginasweb.cr/provincia/'Canton'/cantones.json",
		type: 'Get',
		dataType: 'json',
		success: function( result ) {

 var html = "<select>";
                            for(key in result) {
                                html += "<option value='"+key+"'>"+result[key]+"</option>";
                            }
                            html += "</select";
                            $('#Distrito').html(html);

		}

	});

}


