<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.uta.sams.beans.*,org.uta.sams.controller.UserController,java.util.ArrayList"%>
<%@ page import = "java.lang.reflect.*" %>


<jsp:useBean id="Userbean" scope="request" class="org.uta.sams.beans.UserBean" />
<jsp:setProperty name="Userbean" property="*"/>


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
UserController UserController = new UserController();
Userbean.setRole("student");

String msg = UserController.addUser(Userbean);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>JSP Page</title>
		<style type="text/css">
<!--
.formtable {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	font-weight: bold;
}
.width1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: normal;
	width: 180px;
}
.errorcode {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #FF0000;
}
.style1 {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; font-weight: bold; }
.normalStyle {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; }
-->
</style>
    </head>
    <script>
    function okFunction()
    {
    
    window.location.href = "../../jsp/user/welcome.jsp";
    
    }
    </script>
    <body id="page-top">
    
    
     <!-- Page Wrapper -->

	


		<jsp:include page="/jsp/commons/header.jsp" />

		<div class="container-fluid">

			<div class="row">
				<script type="text/javascript"
					src="/jsp/commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />

			

			<!-- <main class="content"> -->
				<div class="col-sm-8">
					<!-- Page Heading -->
					<div class="container-fluid">
					<div class="row display-4">Add User
					</div>
				<!-- <div class="row"> -->
    
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
    <table border="0" width="100%">
        
        
	  
	 
	     
       
        <tr>
                 <td width="50%" valign="top" class="formtable">Name:                 </td>
                   <td class="normalStyle"><%= Userbean.getUsername() %> </td> 
        </tr>

        <tr>
                 <td width="50%" valign="top" class="formtable">UTA Email :              </td>
                  <td class="normalStyle"><%= Userbean.getEmail() %></td>
        </tr>
        
        <tr>
                 <td width="50%" valign="top" class="formtable"> Role :           </td>
            	 <td class="normalStyle"><%= Userbean.getRole()  %></td>
        </tr>
        
        
        <tr>
                 <td width="50%" valign="top" class="formtable"> Password :           </td>
            	 <td class="normalStyle"><%= Userbean.getPassword()  %></td>
        </tr>
       
        
   
        <tr>
        <td align="center">
        <input type="button" class="btn btn-primary" value="Ok" onclick="okFunction();">
</td>
	  </tr>
    </table>  
        
   </div></div></div></div>
    
    <jsp:include page="/jsp/commons/footer.jsp"/>
    
    </body>
</html>
