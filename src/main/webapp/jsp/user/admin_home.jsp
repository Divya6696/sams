<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page
	import="org.uta.sams.beans.*,org.uta.sams.controller.*,java.util.ArrayList"%>
<%@ page import="java.lang.reflect.*"%>

<jsp:useBean id="userbean" scope="request"
	class="org.uta.sams.beans.UserBean" />
<jsp:setProperty name="userbean" property="*" />
<!DOCTYPE html>


<%
String contextpath = request.getContextPath() + "/";
UserBean user = (UserBean) request.getSession().getAttribute("user");
UserController uc = new UserController();
ProgramController pc = new ProgramController();
ProgramBean pb = new ProgramBean();
UserBean ub = new UserBean();
%>
<html lang="en">

<head>
<title>Admin Home | OIE</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">









<link rel="stylesheet" href="../commons/sams/sample.css" type="text/css"
	title="International Stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<meta name="viewport" http-equiv="Content-Type"
	content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<style type="text/css">
.add-icon {
	float: right;
}
</style>


</head>

<body id="page-top">

	<!-- Page Wrapper -->

	<%
	if (user == null) {
		response.sendRedirect("login.jsp");
	} else if (!user.getRole().equals("admin")) {
		response.sendRedirect("welcome.jsp");
	}
	%>


	<jsp:include page="../commons/header.jsp" />

	<div class="container-fluid">

		<div class="row">


			<jsp:include page="../commons/left.jsp" />






			<!-- Content Wrapper -->
			<div class="col-sm-8">
				<!-- Page Heading -->

				<!-- /.container-fluid -->

				<div class="container-fluid">
					<div class="row display-4">Admin Dashboard</div>
					<div class="row">
						<div class="col">
							<div class="h3">
								Programs <a href="../add/addProgram_Form.jsp" class="add-icon"><i
									class='far fa-plus-square' style='font-size: 36px'></i></a>
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th></th>
										<th>Program Name</th>
										<th>Country</th>
										<th>Type</th>
									</tr>
								</thead>
								<tbody>
									<%
									ArrayList programList = pc.getPrograms();
									if (programList != null) {
										for (int i = 0; i < programList.size(); i++) {
											if (programList.get(i) == null)
										continue;
											pb = (ProgramBean) programList.get(i);
									%>
									<tr>
										<td><%=i + 1%></td>
										<td><a
											href="<%=contextpath%>jsp/search/template.jsp?program_name=<%=pb.getProgramName()%>&term=<%=pb.getTerm()%>"><%=pb.getProgramName()%></a></td>
										<td><%=pb.getCountry()%></td>
										<td><%=pb.getProgramType()%></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>
						<div class="col">
							<div class="h3">
								Students <a href="../add/addUser_Form.jsp" class="add-icon"><i
									class='far fa-plus-square' style='font-size: 36px'></i></a>
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
									<th></th>
										<th>User Name</th>
										<th>Email</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									ArrayList studentList = uc.getStudents();
									if (studentList != null) {
										for (int i = 0; i < studentList.size(); i++) {
											if (studentList.get(i) == null)
										continue;
											ub = (UserBean) studentList.get(i);
									%>
									<tr>
										<td><%=i + 1%></td>
										<td><%=ub.getUsername()%>
										<td><%=ub.getEmail()%></td>
										<td><ul class="nav">
												<li class="nav-item"><a class="nav-link" href="<%=contextpath%>jsp/update/updateUser_Form.jsp?username=<%=ub.getUsername() %>">Edit</a>
												</li>
												<li class="nav-item"><a class="nav-link" href="<%=contextpath%>jsp/delete/deleteUser_Form.jsp?username=<%=ub.getUsername() %>">Delete</a>
												</li>
											</ul></td>
									</tr>
									<%
									}
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>

</html>