
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
 <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


</head>


<body onload="initialize()" id="page-top">

<%
	UserBean ub = new UserBean();
	UserController uc = new UserController();
	
	ub.setUsername(request.getParameter("username"));
	ub.setEmail(request.getParameter("email"));
	
	if(uc.updateUser(ub, request.getParameter("uname"))){%>
	<script type="text/javascript">alert("User Updated.")</script>
<% 
		response.sendRedirect("../user/welcome.jsp");
	} else { %>
		<script type="text/javascript">alert("Update User Failed")</script>
	<% 
	response.sendRedirect("../user/welcome.jsp");
	}

%>
	
	<%-- <div class="row wrapper">


		<jsp:include page="/jsp/commons/header.jsp" />
		






				<div class="row mt-5 w-100">

			<div class="col-auto mt-3 w-auto h-100">
				<script type="text/javascript"
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />



			</div>




				<main class="col mt-5 content">











				<div class="row">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-start justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Update User Form</h1>

					</div>
				</div>
			


 <form action="<%=request.getContextPath()%>/jsp/delete/User_list.jsp" method="POST">
				<div class="form-row">
				
				
				<%
				
				
				UserController UserController = new UserController();

				ArrayList userlist = UserController.searchUsers(userbean);
		
					
				%>	
				
					<!--User Name  -->
                    
					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Name:</label> <input type="text" name="username" class="form-control" value= "<%=userbean.getUsername() %>"
							disabled />
					</div>





					<!-- User Type -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							UTA Email:</label> <input type="text" name="email" class="form-control" value= "<%=userbean.getEmail() %>"/>
					</div>
					
					</div>
					
					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Password:</label> <input type="text" name="password" class="form-control" value= "<%=userbean.getPassword() %>" />
					</div>
					






				<div class="form-row">


		<!-- Phone Number -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Phone Number:</label> <input type="number" name="phoneNumber" class="form-control" />
					</div>





					<!-- Address -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Address:</label> <input type="text" name="address" class="form-control" />
					</div>
					
					</div>




			

				<div class="form-row">

						<!-- Phone Number -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Password:</label> <input type="text" name="password" class="form-control" />
					</div>





					<!-- Address -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">
							Confirm Password:</label> <input type="text" name="password" class="form-control" />
					</div>
					
					</div>
					
				

	
 
  	
	

				<div class="col m-1 w-auto">
                <button type="submit" class="btn btn-primary btn-block mb-4 w-auto" value="Add User" onclick="validateForm();">
                  Submit
                </button>
                </div>
               
               
                
			

			
		</form>
</main>

				</div>
				</div>
			

		
		

 --%>

</body>

</html>