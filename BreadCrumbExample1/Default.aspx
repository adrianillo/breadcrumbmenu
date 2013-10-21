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
                //imgarrow:'img/arrow.png', // path to the separator´s image  between menus
                classarrow: 'arrowcrum', // style class for the separator image among menus
                autocrum: true, // if true deletes the menus to the menu clicked
                classcrum: 'crumclass', //style class for each menu
                classbread: 'breadcrumbbs', // style class for each container menus
                dinamic: true,     // if true clicking on the element performs the function with its parameters   that are defined in each menu
                crumclick: function (op, o) {          // function is performed to click on each crum if the parameter above is dinamic                     
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
     { id: i, texto: 'este es el segundo parametro opcional' }); //Arg 1: text to display, 2nd arg: functioncrum parameter, string, 3rd arg: options for each menu, here you can put the arguments you want
     
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

<div class="inner-content">
   </div>
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
