<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page
	import="org.uta.sams.beans.UserBean,org.uta.sams.controller.UserController,java.util.ArrayList"%>
<%@ page import="java.lang.reflect.*"%>

<jsp:useBean id="userbean" scope="request"
	class="org.uta.sams.beans.UserBean" />
<jsp:setProperty name="userbean" property="*" />
<!DOCTYPE html>




<%
UserBean ub = null;
System.out.println(session.getAttribute("user"));
if (session.getAttribute("user") == null) {
	String user = request.getParameter("j_username");
	
	System.out.println("j_username>>>>>" + user);
	System.out.println("j_password>>>>>>" + request.getParameter("j_password"));
	
	userbean.setUsername(user);
	System.out.println("set_username>>>>>" + userbean.getUsername());
	
	userbean.setPassword(request.getParameter("j_password"));
	System.out.println("set_password>>>>>" + userbean.getPassword());
	
	UserController usercontroller = new UserController();
	
	if(usercontroller.check(userbean))
		ub=usercontroller.checkUser(userbean);
	else
		ub=null;

} else {
	ub = (UserBean) session.getAttribute("user");
	System.out.println("Already logged in");
}
%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">









<link rel="stylesheet" href="../commons/sams/sample.css" type="text/css"
	title="International Stylesheet">
<!-- <link rel="stylesheet"
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
	crossorigin="anonymous"></script> -->
	
	<meta charset="utf-8">
  <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    max-width: 1000px;
    max-height: 1000px;
  }
  
  .a {
  position: relative;
  width: 100%;
  height:auto;
}

.text2 {
  width: 100%;
  padding: 60px;
  font-size: 15px;
  opacity: .95;
  text-align: justify;
}

@media screen and (max-width: 500px) {

  .a,
  .text2 {
    width: 100%;
    padding: 0;
  }
}

.a1 {
  position: relative;
  width: 100%;
  min-height: 300px;
  padding: 50px;
}

.a2 {
  position: relative;
  width: 100%;
  min-height: 300px;
  padding: 50px;
}

.icon1 {
  padding: 30px;
  width: 40%;
  float: left
}

.icon {
  width: 100%;
  max-width: 220px;
  max-height: 220px;
  align-items: center;
}

.t1 {
  padding-right: 25px;
  width: 60%;
  float: left;
  text-align: justify;
}

.icon2 {
  padding-top: 30px;
  padding-left: 70px;
  float: right;
  width: 40%;
  align-content: center;
}

.t2 {
  float: left;
  width: 60%;
  text-align: justify;
}

/* .infinite-photo-grid {
  width: 100%;
  height: 100%;
  max-height: 1200px;
  background-image: url(images/infinite_loop2.jpg);
  background-size: calc(1.15 * min(100vh, 750px)) min(100vh, 750px);
  background-repeat: repeat-1.5x;
  animation: scroll 25s linear infinite;
} */

@media screen and (max-width: 500px) {

  .icon1,
  .t1 {
      width: 100%;
      padding: 10px;
      align-content: center;
  }

  .icon2,
  .t2 {
      width: 100%;
      padding: 10px;
      align-content: center;
  }
}
  
  </style>

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">



</head>

<body id="page-top">

	<!-- Page Wrapper -->

	
		<% if(ub!=null){
		        request.getSession().setAttribute("user",ub);
		        System.out.println(ub.getRole());
		        if(ub.getRole().equals("admin")){
		        	System.out.println("go to admin home");
		        	response.sendRedirect("admin_home.jsp");
		        }
		        %>
		        <!-- Welcome Message !!!!!! -->
		
		   <%}else{
			   response.sendRedirect("login.jsp");
		   }
		%>

		<jsp:include page="../commons/header.jsp" />
		<div class="container-fluid">

		<div class="row">

			

				<jsp:include page="../commons/left.jsp" />

			
			<!-- <main class="content"> -->


<div class="col-sm-8"> 

				<!-- Content Wrapper -->
				
					<!-- Page Heading -->
					<div class="container-fluid">
					<div class="row display-4">Welcome
					</div>
					<div class="row container-fluid">
					
					<div class="a1">
                <div class="icon1">
                    <img src="../search/images/caro11.jpeg" class="icon" alt="Food" />
                </div>
                <div style="color:black;" class="text1">
                    <p style="font:20">You're in a rush and need something from one of the stores on Campus? Mav Market is here! Campus businesses offer a wide range of products for you that you can grab.<br />You're moving out, and need to sell things from your apartment? Mav Market is the place for you. Upload pictures and information about the product, and everyone on the campus will be a prospective buyer.</p>
                </div>
            </div>

            <div class="a2">
                <div class="icon2">
                    <img src="../search/images/caro12.jpeg" class="icon" alt="Club" width="220" height="200" />
                </div>
                <div style="color:black;" class="text2">
                    <p style="font:20">Be a part of the activities going on on-Campus. Engage with other students with similar interests by using our Club functionality. Posts help you to find new and interesting content every day!</p>
                </div>
            </div>

            <div class="a1">
                <div class="icon1">
                    <img src="../search/images/caro13.jpeg" class="icon" alt="Food" width="220" height="200" />
                </div>
                <div style="color:black;" class="text1">
                    <p style="font:20">Many on Campus Businesses like Starbucks, Chick-fil-a, Bookstore etc have their products advertised just for you. Take advantage of the networking opportunities by using our Chat functionality. (in development)</p>
                </div>
            </div>
					
					</div>
					</div>
					</div>
				


			


<!-- </main> -->
</div>
</div>

<jsp:include page="/jsp/commons/footer.jsp"/>

</body>

</html>