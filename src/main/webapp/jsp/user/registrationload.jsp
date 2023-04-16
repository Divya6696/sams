<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page
	import="org.uta.sams.beans.UserBean,org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
<%@ page
	import="org.uta.sams.beans.UserBean,org.uta.sams.controller.UserController,java.util.ArrayList, org.uta.sams.email.*"%>
<%@ page import="java.lang.reflect.*"%> 

<jsp:useBean id="userbean" scope="request"
	class="org.uta.sams.beans.UserBean" />
<jsp:setProperty name="userbean" property="*" />

<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
UserBean ub = null;
if (session.getAttribute("user") == null) {
	String user = request.getParameter("name");
	
	System.out.println("name->" + user);
	System.out.println("email->" + request.getParameter("email"));
	System.out.println("univid->" + request.getParameter("univid"));
	
	userbean.setUsername(request.getParameter("name"));
	System.out.println("set_username>>>>>" + userbean.getUsername());
	
	userbean.setEmail(request.getParameter("email"));
	System.out.println("emaik>>>>>" + userbean.getEmail());
	
	userbean.setId(request.getParameter("univid"));
	System.out.println("univ id>>>>>" + userbean.getId());
	
    String password = RandomPasswordGenerator.genpass();
	
	userbean.setPassword(password);
	System.out.println("set_password>>>>>" + userbean.getPassword());
	

	UserController usercontroller = new UserController();
	ub = usercontroller.set(userbean);
	response.sendRedirect("login.jsp");
	} 
else {
	ub = (UserBean) session.getAttribute("user");
	System.out.println("Already logged in");
}
%>
<html>
<head>
<title></title>
</head>
<body>
</body>
</html>
