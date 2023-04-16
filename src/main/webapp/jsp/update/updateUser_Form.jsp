

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
 <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta name="description" content="">
<meta name="author" content="">

<title>OIE Dashboard</title>







<link rel="stylesheet" href="<%=jsppath%>sams/sample.css"
	type="text/css" title="International Stylesheet">




<%
UserController usercontroller  = new UserController();
UserBean user = new UserBean();
	if(request.getParameter("username") != null){
		user = usercontroller.getUserByUserName(request.getParameter("username"));
	}
	else{
	user = (UserBean) session.getAttribute("user");
	}
%>


<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


</head>

<body onload="initialize()" id="page-top">
	

		<jsp:include page="/jsp/commons/header.jsp" />
		






				<div class="container-fluid">

			<div class="row">
				<script type="text/javascript"
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />

<div class="col">
					<!-- Page Heading -->
					<div class="container-fluid">
					<div class="row display-4">Edit Details
					</div>
				<!-- <div class="row"> -->
					<!-- Page Heading -->
					
			


 <form action="<%=request.getContextPath()%>/jsp/update/updateUser.jsp?uname=<%= user.getUsername()%>" method="POST">
				<div class="form-row">
				
					<!--User Name  -->
                    
					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Name:</label> <input type="text" name="username" value="<%= user.getUsername() %>" class="form-control" />
					</div>





					<!-- User Type -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Email:</label> <input type="text" name="email" value="<%= user.getEmail() %>" class="form-control" />
					</div>
					
					</div>


				<div class="col m-1 w-auto">
                <button type="submit" class="btn btn-primary" value="Add User" onclick="validateForm();">
                  Update User
                </button>
                </div>
                <!-- <div class="col w-auto">
                
                 <button type="reset" class="btn btn-secondary" value="Reset Form">
                  Cancel
                </button>
                </div> -->
               
                
			

			
		</form>
</div></div>

				</div>
				</div>
			

		
		



</body>

</html>