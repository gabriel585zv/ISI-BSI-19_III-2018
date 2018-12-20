$('#frm').submit(function() {
var  Username =document.getElementById("username").value;
Cookies.set('Username', Username);
validar();
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
      
 $("#Tbl").find("tr:not(:first)").remove();
 if (result=="Admin") {
Cookies.set('Role', result);

}else if (result="Juez") {

Cookies.set('Role', Juez);

}else {

Cookies.set('Role', "none");

}


        }



      });

}