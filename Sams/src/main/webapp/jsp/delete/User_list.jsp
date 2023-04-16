
<%
String jsppath = request.getContextPath() + "/jsp/commons/";
%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page
	import="org.uta.sams.beans.*,org.uta.sams.controller.UserController,java.util.ArrayList"%>
<jsp:useBean id="Userbean" scope="request"
	class="org.uta.sams.beans.UserBean" />
<jsp:setProperty name="Userbean" property="*" />



<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="<%=jsppath%>sams/sample.css"
	type="text/css" title="International Stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>JSP Page</title>
<style type="text/css">
</style>
</head>



<body>

	<div class="row wrapper">

    <jsp:include page="/jsp/commons/header.jsp" />





		<div class="row mt-5 w-100 ">

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
						<h1 class="h3 mb-0 text-gray-800 ml-3">Update User List</h1>

					</div>
				</div>
			<table class="table">

				<thead>


					<tr>
						<th>User Name</th>
						<th width="20%">Email</th>
						<th width="20%">Password</th>
					</tr>
				</thead>


				<%
				
				
				UserController UserController = new UserController();

				ArrayList userlist = UserController.searchUsers(Userbean);
				
				if(Userbean.getPassword() == null){
					
				%>	

					<tr valign="top">
			
						<td> No record found </td>
						
						
					</tr>
					
				<%	
				}
				else{
					
				
				
				%>


				<tr valign="top">
		
					<td width="15%"><%=Userbean.getUsername()%> </td>
					<td width="15%"><%=Userbean.getEmail()%></td>
					<td width="15%"><%=Userbean.getPassword()%></td>
					
					
				</tr>
				
				<%
				
				}

				%>

 </main>
	
		</div>
	</div>
	
	
	
	<form action="<%=request.getContextPath()%>/jsp/update/updateUser.jsp" method="POST">
	
	<button type="submit" class="btn btn-primary btn-block mb-4 w-auto" value="Update User" onclick="validateForm();">
                  Update User
                </button>
                
	

</body>
</html>

