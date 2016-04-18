<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<html>
  <head>
  	<meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,300,700,600,500' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/responsive.css">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
            $('#btnAdd').click(function() {
                var num     = $('.clonedInput input').length; // how many "duplicatable" input fields we currently have
                var newNum  = new Number(num + 1);      // the numeric ID of the new input field being added
                $('#participants').val(newNum);
 
                // create the new element via clone(), and manipulate it's ID using newNum value
                var newNumber = $('#example' + num).clone().attr('id', 'example' + newNum);
                var newName = $('#exampleInputName' + num).clone().attr('id', 'exampleInputName' + newNum);
                var newExcl = $('#exampleInput' + num).clone().attr('id', 'exampleInput' + newNum);
 
                // manipulate the name/id values of the input inside the new element
                newNumber.attr('id', 'example' + newNum).text(newNum);
                newName.attr('id', 'exampleInputName' + newNum).attr('name', 'username' + newNum);
                newExcl.attr('id', 'exampleInput' + newNum).attr('name', 'excl' + newNum);
 
                // insert the new element after the last "duplicatable" input field
                $('#example' + num).after(newNumber);
                $('#exampleInputName' + num).after(newName);
                $('#exampleInputName' + newNum).before("</br>");
                $('#exampleInput' + num).after(newExcl);
                $('#exampleInput' + newNum).before("</br>");
                
                // enable the "remove" button
                $('#btnDel').removeAttr('disabled');
            });
            $('#btnDel').click(function() {
                var num = $('.clonedInput input').length; // how many "duplicatable" input fields we currently have
                $('#example' + num).remove();     // remove the last element
                $('#exampleInputName' + num).remove();
                $('#exampleInput' + num).remove();
                $('#usernames').find('br:last').remove();
                $('#excls').find('br:last').remove();
                
                $('#participants').val(num-1);
 
                // if only one element remains, disable the "remove" button
                if (num == 4)
                    $('#btnDel').attr('disabled','disabled');
            });
            $('#btnDel').attr('disabled','disabled');
        });
    </script>
    
  </head>
  <body>
        <section id="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block-left">
							<nav class="navbar navbar-default" role="navigation">
							  <div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
								  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								  </button>
                  <div class="nav-logo">
                  <a href="#"><img src="img/logo.png" alt="logo"></a>
                  </div>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                  <li class="active"><a href="/Grupos">Mis Grupos <span class="sr-only">(current)</span></a></li>
                  <li><a href="/listas_deseos">Mis Deseos</a></li>
                  <li><a href="amigos.jsp">Mis Amigos</a></li>
                  <li><a href="chat.jsp">Chat</a></li>
                  </ul>
								  <ul class="nav navbar-nav dcha">
 				  				<c:if test="${not empty pageContext.request.userPrincipal}">
								    <li><a href="/Login"/>Cerrar Sesi�n</a></li>
								</c:if>
								<c:if test="${empty pageContext.request.userPrincipal}">
								    <li><a href="/Login"/>Iniciar Sesi�n</a></li>
								</c:if>
                  </ul>
								</div><!-- /.navbar-collapse -->
							  </div><!-- /.container-fluid -->
							</nav>
                        </div>
                    </div><!-- .col-md-6 -->

                </div><!-- .row close -->
            </div><!-- .container close -->
        </section><!-- #heder close -->

        <!-- Service Start
        ============================================================= -->

        <section id="service">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block-top">
                            <div class="service-header">
                              <form action="grupos.jsp" method="post">
                                <div class="form-inline">
                                   <div class="form-group" style="max-width:200px;">
                                     <label for="exampleInputName">Nombre del grupo</label>
                                     <input type="text" class="form-control" name=groupname><br/>
                                   </div>
                                   <div class="form-group" style="max-width:200px;">
                                     <label for="exampleInputMoney">Importe m�ximo</label>
                                     <input type="text" class="form-control" name=maxprice><br/>
                                   </div>
                                   <div class="form-group" style="max-width:200px;">
                                     <label for="exampleInputDate">Fecha <span class="glyphicon glyphicon-calendar"></span></label>
                                     <input type="text" class="form-control" name="date"><br/>
                                   </div>
                                 </div>
                                 <br />
                                 <div class="form-inline">
                                 <input type="hidden" id="participants" name="participants" value="3">
	                               <div class="form-group">
	                                 <label for="exampleInputName" style= "display: inline;"></label>
	                                 <p id="example1">1</p>
	                                 <p id="example2">2</p>
	                                 <p id="example3">3</p>
	                               </div>
                                   <div class="form-group clonedInput" id="usernames">
                                     <label for="exampleInputName">Nombre de usuario</label>
                                     <input type="text" class="form-control" id="exampleInputName1" name="username1" placeholder="Nombre"/><br/>
                                  	 <input type="text" class="form-control" id="exampleInputName2" name="username2" placeholder="Nombre"/><br/>
                                  	 <input type="text" class="form-control" id="exampleInputName3" name="username3" placeholder="Nombre"/><br/>
                                </div>
                                   <div class="form-group" id="excls">
                                     <label for="exampleInput">Excluir <span class="glyphicon glyphicon-question-sign"></span></label>
                                     <input type="text" class="form-control" name="excl1" id="exampleInput1"/><br/>
                                     <input type="text" class="form-control" name="excl2" id="exampleInput2"/><br/>
                                     <input type="text" class="form-control" name="excl3" id="exampleInput3"/><br/>
                                   </div>
                                 </div>
                                 <p style="margin-top:20px;">
                                <button type="button" class="btn btn-default" style="margin-top:20px;" id="btnAdd">
                                <span class="glyphicon glyphicon-plus-sign"></span> A�adir un amigo</button>
                                <button type="button" class="btn btn-default" style="margin-top:20px;" id="btnDel">
                                <span class="glyphicon glyphicon-minus-sign" style="color:red;"></span> Eliminar un amigo</button>
                                </p>
                                 <br />
                                 <div class="form-group" style="max-width:600px; margin-left:auto; margin-right:auto;">
                                   <label for="exampleInputMessage">Escribe el mensaje que recibir�is:</label>
                                   <input type="text" class="form-control" id="exampleInputMessage">
                                 </div>
                                 <br />
                                 <div class="row">
                                   <div class="col-md-6">
                                     <button type="submit" class="btn btn-default" onclick="this.form.action='Grupos'"><span class="glyphicon glyphicon-circle-arrow-left"></span> Anterior</button>
                                   </div>
                                   <div class="col-md-6">
                                     <button type="submit" class="btn btn-default" onclick="this.form.action= 'creadorgrupos'">Siguiente <span class="glyphicon glyphicon-circle-arrow-right"></span></button>
                                   </div>
                                 </div>
                               </form>
                           </div>
                        </div>
                    </div><!-- .col-md-12 close -->
                </div><!-- row close -->
            </div><!-- .container close -->
        </section><!-- #service close -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
