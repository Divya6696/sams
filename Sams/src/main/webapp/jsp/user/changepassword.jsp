<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page
	import="org.uta.sams.beans.UserBean,org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
<%@ page import="java.lang.reflect.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<title>JSP Page</title>
</head>
<body style="background-color: hsl(0, 0%, 96%)">

	<jsp:include page="/jsp/commons/header.jsp" />

	<div class="container-fluid" style="padding: 4%">
		<div class="row">


			<h1 class="h1 display-1">
				OFFICE OF<br /> <span class="text-primary">INTERNATIONAL
					EDUCATION</span>
			</h1>
			<div class="row">
				<div class="col-sm-8"><p class="h5">
            The Office of International Education is a comprehensive unit committed to providing programs and services that transform the lives of our students, faculty, staff, and community through high impact, international education experiences.
          </p></div>
				<div class="col-sm-4">
					<div class="global-container">
						<div class="card login-form">
						<div class="card-header h4">Change Password</div>
							<div class="card-body">
								<div class="card-text">
									<form action="<%=response.encodeURL("changeload.jsp")%>"
										method="post">
										<!-- 2 column grid layout with text inputs for the first and last names -->

										<div class="form-group">
											<label class="form-label" for="form3Example1">Current
												Password</label> <input type="password" id="form3Example1"
												class="form-control" name="j_currentpassword" />
										</div>

										<div class="form-group">
											<label class="form-label" for="form3Example1">New
												Password</label> <input type="password" id="form3Example2"
												class="form-control" name="j_newpassword" />
										</div>

										<div class="form-group">
											<label class="form-label" for="form3Example2">Retype
												Password</label> <input type="password" id="form3Example3"
												class="form-control" name="j_retypepassword" />
										</div>


										<button type="submit" class="btn btn-primary" value="submit">Submit</button>


										<button type="reset" class="btn btn-secondary" value="reset">Reset</button>


									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/jsp/commons/footer.jsp" />
</body>
</html>