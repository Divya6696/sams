

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>




<%
UserController usercontroller  = new UserController();
UserBean user = new UserBean();
	if(request.getParameter("username") != null){
		user = usercontroller.getUserByUserName(request.getParameter("username"));
	}
	else{
	user = (UserBean) session.getAttribute("user");
	}
	System.out.println("to delete>>>>"+user.getUsername());
%>


<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


</head>

<body onload="initialize()" id="page-top">

	<!-- Page Wrapper -->

	


		<jsp:include page="/jsp/commons/header.jsp" />





		<div class="container-fluid">

			<div class="row">
				<script type="text/javascript"
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />

<div class="col">
					<!-- Page Heading -->
					<div class="container-fluid">
					<div class="row display-4">Delete Account
					</div>
 <form action="<%=request.getContextPath()%>/jsp/delete/deleteUser.jsp?uname=<%= user.getUsername()%>" method="POST">
				<div class="form-row">
				
					<!--User Name  -->
                    
					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Name:</label> <input type="text" name="username" value="<%= user.getUsername() %>" class="form-control" readOnly />
					</div>





					<!-- User Type -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Email:</label> <input type="text" name="email" value="<%= user.getEmail() %>" class="form-control" readOnly />
					</div>
					
					</div>

  	
	

				<div class="col m-1 w-auto">
                <button type="submit" class="btn btn-primary" onclick="validateForm();">
                  Delete
                </button>
                </div>
                
                
               
                
               
                
			

			
		</form>
</div></div>

				</div>
				</div>
			

		
		



</body>

</html>