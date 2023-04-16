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
String redirect="";
try{
/* System.out.println(session.getAttribute("user")); */
if (session.getAttribute("user") == null) {
	String user = request.getParameter("j_username");
	
	System.out.println("j_username>>>>>" + user);
	System.out.println("j_password>>>>>>" + request.getParameter("j_password"));
	
	userbean.setUsername(user);
	System.out.println("set_username>>>>>" + userbean.getUsername());
	
	userbean.setPassword(request.getParameter("j_password"));
	System.out.println("set_password>>>>>" + userbean.getPassword());
	
	UserController usercontroller = new UserController();
	
	if(usercontroller.check(userbean)){
		if(ub == null){
			System.out.println("ub null loginload");
			redirect="login.jsp";
		}
		ub=usercontroller.checkUserOld(userbean);
	} else
		ub=null;

} else {
	ub = (UserBean) session.getAttribute("user");
	System.out.println("Already logged in");
}
if (ub != null) {
	redirect="welcome.jsp";
	request.getSession().setAttribute("user", ub);
	}
else {
	redirect="changepassword.jsp";
	}
} catch(Exception E) {
	E.printStackTrace();
} finally {
	response.sendRedirect(redirect);
}
		%>
<html lang="en">
<head>
</head>
		

</body>
</html>