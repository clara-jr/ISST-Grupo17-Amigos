<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </head>
  <body>
        <%@include file="marco.jsp" %>

        <!-- Service Start
        ============================================================= -->

        <section id="service">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block-top">
                            <div class="service-header">
                                <p>Si no se te ocurre nada para regalar por el amigo invisible, no te preocupes, aquí encontrarás algunas ideas </p>
                                <br />
                                <div class="row">
	                                <c:forEach items="${usuarios_inv}" var="usuario">
	                                 <div class="col-md-6">
	                                    <p>Lista de deseos de ${usuario.nick}</p>
	                                    <ul style="list-style:none; padding-left:0px; color:#AFB8B8;">
	                                    <c:forEach items="${deseos_inv}" var="deseo">
		                                    <c:if test="${deseo.user == usuario.nick}">
		                                     	<li>${deseo.item}</li>
		                                   	</c:if> 
	                                    </c:forEach>
	                                    </ul>
	                                  </div>
	                                </c:forEach>
	                                <c:forEach items="${usuarios_v}" var="usuario">
	                                 <div class="col-md-6">
	                                    <p>Lista de deseos de ${usuario.nick}</p>
	                                    <ul style="list-style:none; padding-left:0px; color:#AFB8B8;">
	                                    <c:forEach items="${deseos_v}" var="deseo">
		                                    <c:if test="${deseo.user == usuario.nick}">
		                                     	<li>${deseo.item}
		                                     	<form method="post" style= "display: inline;">
		                                     	<input type="hidden" name="user" value='${deseo.user}'>	
		                                     	<input type="hidden" name="item" value='${deseo.item}'>	                                     
			                                    <button onclick="this.form.action = 'listas_deseos_amigos';" type="submit" class="btn btn-default" style="margin: 0; padding: 0; background:transparent; border: none;"><span class="glyphicon glyphicon-minus-sign" style="color:red;"></span></button>
	                                    	    </form></li>
		                                   	</c:if> 
	                                    </c:forEach>
	                                    </ul>
	                                  </div>
	                                </c:forEach>
                                </div>
                                <br />
                                <br />
                                <button onclick="location.href='https://www.amazon.es/';" type="button" class="btn btn-primary">Amazon</button>
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
