<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.uta.sams.beans.ProgramBean,org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
<%@ page import = "java.lang.reflect.*" %>



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
 <%session.invalidate();%>
 <% response.setHeader("Refresh", "1;url=login.jsp"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title></title>
    </head>
    <body style="background-color: hsl(0, 0%, 96%)">
    
    <jsp:include page="/jsp/commons/header.jsp"/>
   
 <div class="container-fluid" style="padding:4%">
  <div class="row" >
 
      
          <h1 class="h3 display-3">
            <span class="text-secondary">You have successfully logged off.</span>
            <br> Redirecting to Login Page..
          </h1>
  </div></div>

<jsp:include page="/jsp/commons/footer.jsp"/>
  
    </body>
</html>
