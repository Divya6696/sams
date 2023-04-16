<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.uta.sams.beans.UserBean,org.uta.sams.controller.UserController,java.util.ArrayList"%>
<%@ page import = "java.lang.reflect.*" %>

<jsp:useBean id="userbean" scope="request" class="org.uta.sams.beans.UserBean" />
<jsp:setProperty name="userbean" property="*"/>


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
          
%>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>JSP Page</title>
        <style>
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
-->
</style>
<script type="text/javascript">
    function checkForm()
    {
        confirm("You are Uploading a file and this will effect the programs\nDo you want to Upload it Still??")
     
    }
</script>
  
    </head>
     <body id="page-top">

<jsp:include page="/jsp/commons/header.jsp" />

		<div class="conatiner-fluid">

			<div class="row">
				<script type="text/javascript"
					src="/jsp/commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />
			
			
			<div class="col-sm-8">
			
					<!-- Page Heading -->
					<div class = "container-fluid">
 <div class="row display-4">Upload Program:</div>
 <table class="table">
<tr>
<td style="padding-left:5px"">
<form action="<%=request.getContextPath()%>/jsp/upload/uploadAction.jsp" enctype="multipart/form-data" method="post">    

    <table width="100%">
         <caption align="top" class="style1">
	  
    <tr><td align="center" colspan="2" class="style1">
      Upload Program Form
      </td></tr>
      
    </caption>
    
    <tr>
        <tr><td align="center">
       <input type="file" name="file" class="form-control">
        <input type="submit" class="btn btn-primary" value="Upload">

        </td></tr>
    </table>
    <br><br><br>
</form>
    
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
    
      </td></tr>
</table>

</div></div></div></div>
    
    <jsp:include page="/jsp/commons/footer.jsp"/>
    
    </body>
</html>
