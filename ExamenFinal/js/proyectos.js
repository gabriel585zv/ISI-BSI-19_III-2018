document.addEventListener('DOMContentLoaded', function() {
validar();

Getproyectos();
Getestudiantes();
Getprovincia();

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

   console.log("Juez");
var div =document.getElementById("divnew");
   div.style.display = 'none';
}else{
        window.location.href = "login.html"; 


}


        }



      });

}
var  btn_del =document.getElementById("btn_del");
btn_del.addEventListener(
"click",function (){

if(confirm("Esta seguro que desea eliminar ?")){

var id= document.getElementById("id").value;
 

//Aca tengo construido el jason listo para insert

$.ajax({
        url: "php/delproyecto.php",
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

Getproyectos();

setTimeout(function(){
msj.textContent="";
}, 3000);


        }



      });


var id_ = document.getElementById("id");
var codigo_ = document.getElementById("codigo");
var nombre_ = document.getElementById("nombre");
var descripcion_ = document.getElementById("textarea").textContent;
var centroeducativo_ = document.getElementById("centroeducativo");
var Provincia_ = document.getElementById("provincia");
var Canton_ = document.getElementById("canton");
var Distrito_ = document.getElementById("distrito");
 var tutor_ = document.getElementById("docente");
var caldoc_ = document.getElementById("caldoc");
 var caljuz_ = document.getElementById("caljuz");
 var caltotal_ = document.getElementById("caltotal");
 var est1_ = document.getElementById("estudiante1");
 var est2_ = document.getElementById("estudiante2");

id_.value = "";
codigo_.value="";
nombre_.value="";
descripcion_.value="";
centroeducativo.value="";
 tutor_.value="";
caldoc_.value="";
caljuz_.value="";
caltotal_.value ="";
  tinymce.get('textarea').setContent("");

}


} );






$('#Tbl').on('click', 'tr', function(event) {
   var id = $(this).find('td').eq(0).html(); // gets column 1 values
   var codigo = $(this).find('td').eq(1).html(); // gets column 2 values
   var nombre = $(this).find('td').eq(2).html(); // gets column 2 values
   var descripcion = $(this).find('td').eq(3).html(); // gets column 2 values
   var Centroeducativo = $(this).find('td').eq(4).html(); // gets column 2 values
   var Provincia = $(this).find('td').eq(5).html(); // gets column 2 values
   var Canton = $(this).find('td').eq(6).html(); // gets column 2 values
   var Distrito = $(this).find('td').eq(7).html(); // gets column 2 values
   var tutor = $(this).find('td').eq(8).html(); // gets column 2 values
   var caldoc = $(this).find('td').eq(9).html(); // gets column 2 values
   var caljuz = $(this).find('td').eq(10).html(); // gets column 2 values
   var caltotal = $(this).find('td').eq(11).html(); // gets column 2 values
   var est1 = $(this).find('td').eq(12).html(); // gets column 2 values
   var est2 = $(this).find('td').eq(13).html(); // gets column 2 values



var id_ = document.getElementById("id");
var codigo_ = document.getElementById("codigo");
var nombre_ = document.getElementById("nombre");
var descripcion_ = document.getElementById("textarea").textContent;
var centroeducativo_ = document.getElementById("centroeducativo");
var Provincia_ = document.getElementById("provincia");
var Canton_ = document.getElementById("canton");
var Distrito_ = document.getElementById("distrito");
 var tutor_ = document.getElementById("docente");
var caldoc_ = document.getElementById("caldoc");
 var caljuz_ = document.getElementById("caljuz");
 var caltotal_ = document.getElementById("caltotal");
 var est1_ = document.getElementById("estudiante1");
 var est2_ = document.getElementById("estudiante2");


id_.value=id;
 codigo_.value=codigo;
nombre_.value=nombre;
tinymce.get('textarea').setContent(descripcion);
centroeducativo_.value=Centroeducativo;
Provincia_.value=Provincia;
 tutor_.value=tutor;
caldoc_.value=caldoc;
caljuz_.value=caljuz;
caltotal_.value=caltotal;
est1_.value=est1;
est2_.value=est2;


});

function Getprovincia () {

    $.ajax({
   url: "https://ubicaciones.paginasweb.cr/provincias.json",
        type: 'Get',
        dataType: 'json',
        success: function( result ) {

 var html = "<select id='op_provincia'>";
                            for(key in result) {
                                html += "<option value='"+key+"'>"+result[key]+"</option>";
                            }
                            html += "</select";
                            $('#provincia').html(html);

        }

    });

}
function GetCantones () {
var provincia = document.getElementById("op_provincia");
var selectedprovincia=provincia.options[provincia.selectedIndex].value;

    $.ajax({
   url: "https://ubicaciones.paginasweb.cr/provincia/"+selectedprovincia+"/cantones.json",
        type: 'Get',
        dataType: 'json',
        success: function( result ) {

 var html = "<select id='op_cantones'>";
                            for(key in result) {
                                html += "<option value='"+key+"'>"+result[key]+"</option>";
                            }
                            html += "</select";
                            $('#canton').html(html);

        }

    });

}

function GetDistritos () {
var canton = document.getElementById("op_cantones");
var selectedcanton=canton.options[canton.selectedIndex].value;
var provincia = document.getElementById("op_provincia");
var selectedprovincia=provincia.options[provincia.selectedIndex].value;

    $.ajax({
   url: "https://ubicaciones.paginasweb.cr/provincia/"+selectedprovincia+"/canton/"+selectedcanton+"/distritos.json",
        type: 'Get',
        dataType: 'json',
        success: function( result ) {

 var html = "<select id='op_distritos'>";
                            for(key in result) {
                                html += "<option value='"+key+"'>"+result[key]+"</option>";
                            }
                            html += "</select";
                            $('#distrito').html(html);

        }

    });

}






function Getestudiantes(){

	var	Estudiante1 =document.getElementById("estudiante1");
    var	Estudiante1 =document.getElementById("estudiante2");
$.ajax({
        url: "php/loadestudiantes.php",
        type: 'Get',
        dataType: 'json',
        success: function( result ) {
          

var size=result.length;
var html = "<select = id='estudiante1' required>";
for (var i = 0; i < size; i++) {
html += "<option value='"+result[i].ID+"'>"+(result[i].Nombre+","+result[i].Apellidos)+"</option>";

}


html += "</select";
$('#estudiante1').html(html);

//
var html2 = "<select = id='estudiante2' required>";
for (var i = 0; i < size; i++) {
html2 += "<option value='"+result[i].ID+"'>"+(result[i].Nombre+","+result[i].Apellidos)+"</option>";

}


html2 += "</select";
$('#estudiante2').html(html2);
         
        }

      });



}


function Getproyectos () {

$.ajax({
        url: "php/getproyectos.php",
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
var cel10= row.insertCell(0);
var cel11 = row.insertCell(0);
var cel12 = row.insertCell(0);
var cel13 = row.insertCell(0);
var cel14 = row.insertCell(0);


cel1.innerHTML =   	  result[i].Estudiante2;    //bien
cel2.innerHTML = result[i].Estudiante1 ;
cel3.innerHTML =  result[i].Calificaciontotal ;
cel4.innerHTML =    result[i].Calificacionjuzg ;
cel5.innerHTML = 	  result[i].Calificaciondocumento ;
cel6.innerHTML =  result[i].Docentetutor ;
cel7.innerHTML =result[i].Distrito ;
cel8.innerHTML =result[i].Canton ;
cel9.innerHTML = result[i].Provincia ;
cel10.innerHTML = result[i].Centroeducativo ;
cel11.innerHTML = result[i].Descripcion ;
cel12.innerHTML = result[i].Nombre ;
cel13.innerHTML =result[i].Codigo ;
cel14.innerHTML =result[i].idProyecto ;

//	result[i].Calificacionjuzg 
}


}


//Validaciones para mostrar opciones de canton y distrit
var provincia = document.getElementById("provincia");
provincia.addEventListener("click",function(){

GetCantones();



});

var canton = document.getElementById("canton");
canton.addEventListener("click",function(){
GetDistritos();



});



var btn_new=document.getElementById("btn_new");
btn_new.addEventListener(
"click",
function(){

  if($('#divnew :valid').length){

var prov= document.getElementById("op_provincia");
var cant= document.getElementById("op_cantones");
var dist= document.getElementById("op_distritos");
var nombre= document.getElementById("nombre").value;
var id= document.getElementById("id").value;
var codigo= document.getElementById("codigo").value;
var descripcion= tinyMCE.activeEditor.getContent();
var centroeducativo= document.getElementById("centroeducativo").value;
var Provincia= prov.options[prov.selectedIndex].value;
var canton= cant.options[cant.selectedIndex].value;
var dist=dist.options[dist.selectedIndex].value;
var estudiante1= $("#estudiante1 option:selected").val();
var estudiante2= $("#estudiante2 option:selected").val();
var tutor= document.getElementById("docente").value;
var caltotal= document.getElementById("caltotal").value;
var caldoc= document.getElementById("caldoc").value;
var caljuz= document.getElementById("caljuz").value;


//gabo585

 
$.ajax({
        url: "php/newproyecto.php",
        type: 'POST',
        dataType: 'text',
        data :
        {

id:id,
codigo:codigo,
descripcion:descripcion,
centroeducativo:centroeducativo,
Provincia:Provincia,
canton:canton,
dist:dist,
estudiante1:estudiante1,
estudiante2:estudiante2,
nombre:nombre,
tutor:tutor,
caltotal:caltotal,
caldoc:caldoc,
caljuz:caljuz

        },
        success: function( result ) {
          var msj =document.getElementById("msj");
 msj.textContent= result;    
msj.style="display:block";     
 $("#Tbl").find("tr:not(:first)").remove();

Getproyectos();



        }



      });

  }else {
          var msj =document.getElementById("msj");
msj.textContent="Revise los datos ingresados, no se esta ingresando el formato adecuado";

  }




}

    );

