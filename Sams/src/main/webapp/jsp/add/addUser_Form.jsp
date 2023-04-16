

<%
String jsppath = request.getContextPath() + "/jsp/commons/";
%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@page
	import="org.uta.sams.controller.UserController,org.uta.sams.beans.*"%><%@page
	contentType="text/html"%>
<%@ page
	import="org.uta.sams.beans.UserBean,org.uta.sams.controller.UserController,java.util.ArrayList"%>
<%@ page import="java.lang.reflect.*"%>

<jsp:useBean id="userbean" scope="request"
	class="org.uta.sams.beans.UserBean" />
<jsp:setProperty name="userbean" property="*" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>OIE Dashboard</title>







<link rel="stylesheet" href="<%=jsppath%>sams/sample.css"
	type="text/css" title="International Stylesheet">
<link rel="stylesheet" href="<%=jsppath%>sams/sample.css"
	type="text/css" title="International Stylesheet">
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

</script>



<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


</head>

<body id="page-top" onload="initialize()">
	

		<jsp:include page="/jsp/commons/header.jsp" />
		






		<div class="container-fluid">

			<div class="row">
				<script type="text/javascript"
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />


				<div class="col">
					<!-- Page Heading -->
					<div class="container-fluid">
					<div class="row display-4">Add User
					</div>


 <form name="userForm" action="<%=request.getContextPath()%>/jsp/add/addUser.jsp" method="POST">
				<div class="form-row">
					<!--User Name  -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Name:</label> <input type="text" name="username" class="form-control" />
					</div>





					<!-- User Type -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							UTA Email:</label> <input type="text" name="email" class="form-control" />
					</div>
					
					</div>


			

				<div class="form-row">

						<!-- Password -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Password:</label> <input type="password" name="password" class="form-control" />
					</div>





					<!-- Password -->

					<!-- <div class="col m-3">
						<label class="form-label" for="form3Example1">
							Confirm Password:</label> <input type="password" name="password" class="form-control" />
					</div>-->
					
					</div> 
					
				

	
 
  	
	

				<div class="col m-1 w-auto">
                <button type="submit" class="btn btn-primary" value="Add User" onclick="validateForm();">
                  Add User
                </button>
                </div>
                <div class="col w-auto">
                
                 <button type="reset" class="btn btn-secondary" value="Reset Form">
                  Reset
                </button>
                </div>
               
                
	
			
	
			
		</form>
		</div></div></div></div>
		
		



</body>

</html>