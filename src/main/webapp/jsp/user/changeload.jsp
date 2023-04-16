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
if (session.getAttribute("user") == null) {

	request.getParameter("j_currentpassword");
	request.getParameter("j_newpassword");
	request.getParameter("j_retypepassword");

	if ((request.getParameter("j_retypepassword")).equals(request.getParameter("j_newpassword"))) {
		UserController usercontroller = new UserController();
		ub = usercontroller.change(request.getParameter("j_currentpassword"));
		ub = usercontroller.changepass(ub, request.getParameter("j_newpassword"));
		ub = usercontroller.checkUser(ub);
		System.out.println(ub.getUsername());
	} else {
		ub = null;
	}
} else {
	ub = (UserBean) session.getAttribute("user");
}
if (ub != null) {
	response.sendRedirect("welcome.jsp");
	request.getSession().setAttribute("user", ub);
} else {
	response.sendRedirect("changepassword.jsp");
}
%>
<html lang="en">
<head>
</head>
<body>
</body>
</html>