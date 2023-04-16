<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.uta.sams.beans.*,org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
<%@ page import = "java.lang.reflect.*" %>

<jsp:useBean id="programbean" scope="request" class="org.uta.sams.beans.ProgramBean" />
<jsp:setProperty name="programbean" property="*"/>


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
   ProgramController programcontroller=new ProgramController();
   String msg=programcontroller.updateProgram(programbean);
           
%>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>JSP Page</title>
    </head>
    
    <script>
        function yesFunction()
        {
        
        window.location.href = "../add/uploadImage_Form.jsp?prg=<%= programbean.getProgramName()%>&term=<%= programbean.getTerm()%>";
        
        
        }
        
        function noFunction()
        {
        
        window.location.href = "../../jsp/user/welcome.jsp";
        
        }
    </script>
    <body id="page-top" onload="initialize()">

<jsp:include page="/jsp/commons/header.jsp" />

		<div class="conatiner-fluid">

			<div class="row">
				<script type="text/javascript"
					src="/jsp/commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />
			
			
			<div class="col-sm-8">
			
					<!-- Page Heading -->
					<div class = "container-fluid">
 <div class="row display-4">Update Program</div>
 

    
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
    
    <table class= "table">
     
<tr><th colspan=2>Update Program</th></tr>
<tr><td colspan=2><b><%=msg%></b></td></tr> 
       <%
             if(!programbean.getStatus().equals("deactive")){
      %>
<tr><td colspan=2><b>The data send for submission</b></td></tr>           
        
        
        <tr>
                 <td>Program Name:                 </td>
                 <td><%= programbean.getProgramName() %></td>
        </tr>

        <tr>
                 <td>   Program Type :              </td>
                 <td><%= programbean.getProgramType() %></td>
        </tr>
        
        <tr>
                 <td>Term of Study :                </td>
                 <td><%= programbean.getTerm() %></td>
        </tr>
        
        <tr>
                 <td> Languages :                </td>
                 <td><% for(int i=0;i<programbean.getLanguages().length;i++){%><%= programbean.getLanguages()[i] %>&nbsp;&nbsp;<%}%></td>
        </tr>
        
        <tr>
                 <td>      Region :           </td>
                 <td><%= programbean.getRegion() %></td>
        </tr>
        <tr>
                 <td> Country :                </td>
                 <td><%= programbean.getCountry() %></td>
        </tr>

        
        <tr>
                 <td> Department :                </td>
                     <td><% for(int i=0;i<programbean.getSubjects().length;i++){%><%= programbean.getSubjects()[i] %> &nbsp;&nbsp; <%}%> 
                     </td>
        </tr>
        
        <tr>
                 <td>      Description :           </td>
                 <td><%= programbean.getDescription() %></td>
        </tr>
        
        <tr>
                 <td> Fees :                </td>
                 <td><%= programbean.getFee() %></td>
        </tr>
        <tr>
                 <td> Housing :                </td>
                 <td><%= programbean.getHousing() %></td>
        </tr>
        <tr>
                 <td> Status :                </td>
                 <td><%= programbean.getStatus() %></td>
        </tr>

<tr>
        <td colspan="2">
        <b>The Program has been Successfully Updated. Do you want to Update Images? </b>
        </td>
        </tr>
        <tr>
        <td align="center">
        <input type="button" class= "btn btn-primary" value="Yes" onclick="yesFunction();">

<input type="button" value="No" class= "btn btn-secondary" onclick="noFunction();">
</td>
        </tr>
      <%}%>
               
    </table>
    </div>
    </div>
    </div>
    </div>
    
    
    <jsp:include page="/jsp/commons/footer.jsp"/>
    
    </body>
</html>
