<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ejemplo1._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <script src="js/jquery.js" type="text/javascript"></script>    
    <script src="js/mootools-core.js" type="text/javascript"></script>
    <script src="js/mootools-more.js" type="text/javascript"></script>  
    <script src="js/breadcrumb.js" type="text/javascript"></script>
    <link href="css/breadcrumb.css" rel="stylesheet" type="text/css" />    
    <title>Ejemplo 1</title>
    <script type="text/javascript">
     
    
    
var bb;    
var i=1;

$(document).ready(function() {

 bb=new jQuery.breadcrumb("contentbreadcrumbs",
            {
                //imgarrow:'img/arrow.png', //ruta para la imagen de la flecha entre crrums
                classarrow:'arrowcrum', // clase de estilo para la flecha entre crrums
                autocrum:true, // si es true  borra los crum hasta el clicado
                classcrum:'crumclass', // clase de estilo para cada crum
                classbread:'breadcrumbbs', // clase de estilo para cada el contenedor de los crum
                dinamic: true,     // si es  true al hacer clik en el elemento realiza la función con los parametros definas en cada crum
                crumclick: function (op,o) {          //función que realiza el hacer clik en cada crum si es el parametro anterior es dinamic                     
                     if(op!=null)
                        if(op.functioncrum!=null)
                            op.functioncrum(this,op,o,op.args.id,op.args.texto,1,2,3);                       
                }      
            }
        );        
  
});



function add()
{
     var newitem=new jQuery.itembread("hola",
     function (a,b,c,d,e,f)
     {
        alert('hola, 1º argumento opcional: '+d+' 2º argumento opcional: '+e);
     },
     {id:i,texto:'este es el segundo parametro opcional'}); // 1ºarg: texto a mostrar, 2º arg: parametro functioncrum, string , 3º arg: opciones para cada crum, aquí puedes poner los argumentos que quieras
     
     bb.addcrum(newitem);
     i++;
}


function remove()
{ 
    bb.removecrum();
}
function change()
{   
    var newitem=new jQuery.itembread("Cambio menú",
    function (a,b,c,d,e,f)
    {
          alert('Menú cambiado, 1º argumento opcional: '+d+' 2º argumento opcional: '+e);
    },
    {id:i,texto:'este es el segundo parametro opcional del menu cambiado.'}); 
    bb.changecrum(newitem);
    i++;
}
    
    

    
    </script>
    
</head>
<body >

    <form id="form1" runat="server">
    <div>
     <div id="tuts">
    <div class="tuts_inner">
    		<div id='contentbreadcrumbs' class="breadcrumbs">    							

<div class="inner-content">   </div>
    </div>
        </div>
        <br />
        <br />
        <input type="button" value="add" onclick="add()" />        
        <input type="button" value="remove" onclick="remove()" />
        <input type="button" value="cambio" onclick="change()" />        
    </form>
    <div id="contentexec"></div>
</body>
</html>
