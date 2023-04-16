<%
String jsppath = request.getContextPath() + "/jsp/commons/";
%>
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
ProgramController programController = new ProgramController();

if(request.getParameter("otherRegion2").equals("true"))
{
programbean.setRegion(request.getParameter("otherRegion"));
}


if(request.getParameter("otherLanguages2").equals("true"))
{
   // String[] languages = programbean.getLanguages();
    int i = programbean.getLanguages().length + 1;
    String[] languages = new String[i];
      for(i=0;i<programbean.getLanguages().length;i++){
           
        languages[i]=programbean.getLanguages()[i];
        }
    languages[i]=request.getParameter("otherLanguages");
    programbean.setLanguages(languages);
}


if(request.getParameter("otherCountry2").equals("true"))
{
programbean.setCountry(request.getParameter("otherCountry"));
}


if(request.getParameter("otherSchools2").equals("true"))
{
   
     int i = programbean.getSubjects().length + 1;
    String[] school = new String[i];
      for(i=0;i<programbean.getSubjects().length;i++){
           
        school[i]=programbean.getSubjects()[i];
        }
    school[i]=request.getParameter("otherSchools");
    programbean.setSubjects(school);
    
    
}
    
String msg = programController.addProgram(programbean);

%>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>Add Program</title>
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
        function yesFunction()
        {
        
        window.location.href = "uploadImage_Form.jsp?prg=<%= programbean.getProgramName()%>&term=<%= programbean.getTerm()%>";
        
        
        }
        
        function noFunction()
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
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />

			

			<!-- <main class="content"> -->
				<div class="col-sm-8">
					<!-- Page Heading -->
					<div class="container-fluid">
					<div class="row display-4">Add Program
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
    
    <table class="table">
        
       
	         
       
        <tr>
                 <td width="50%" valign="top" class="formtable">Program Name:                 </td>
                 <td class="normalStyle"><%= programbean.getProgramName() %></td>
        </tr>

        <tr>
                 <td width="50%" valign="top" class="formtable">   Program Type :              </td>
                 <td class="normalStyle"><%= programbean.getProgramType() %></td>
        </tr>
        
        <tr>
                 <td width="50%" valign="top" class="formtable">Term of Study :                </td>
                 <td class="normalStyle"><%= programbean.getTerm() %></td>
        </tr>
        
        <tr>
                 <td width="50%" valign="top" class="formtable"> Languages :                </td>
          <td class="normalStyle"><% for(int i=0;i<programbean.getLanguages().length;i++){%><%= programbean.getLanguages()[i] %>&nbsp;&nbsp;<%}%></td>
        </tr>
        
        <tr>
                 <td width="50%" valign="top" class="formtable">      Region :           </td>
                 <td class="normalStyle"><%= programbean.getRegion() %></td>
        </tr>
        <tr>
                 <td width="50%" valign="top" class="formtable"> Country :                </td>
                 <td class="normalStyle"><%= programbean.getCountry() %></td>
        </tr>

    <%--    <tr>
                 <td>   School :              </td>
                 <td><%= programbean.getSchool() %></td>
        </tr> --%>
        
        <tr>
                 <td width="50%" valign="top" class="formtable"> Department :                </td>
                     <td class="normalStyle"><% for(int i=0;i<programbean.getSubjects().length;i++){%><%= programbean.getSubjects()[i] %> &nbsp;&nbsp; <%}%> 
          </td>
        </tr>
        
        <tr>
                 <td width="50%" valign="top" class="formtable">      Description :           </td>
                 <td class="normalStyle"><%= programbean.getDescription() %></td>
        </tr>
        
        <tr>
                 <td width="50%" valign="top" class="formtable"> Fees :                </td>
                 <td class="normalStyle"><%= programbean.getFee() %></td>
        </tr>
        <tr>
                 <td width="50%" valign="top" class="formtable"> Housing :                </td>
                 <td class="normalStyle"><%= programbean.getHousing() %></td>
        </tr>
       
        <tr>
        <td colspan="2">
        <b class="style1">The Program has been Successfully Added. Do you want to add Images </b>        </td>
        </tr>
        <tr>
        <td align="center">
        <input type="button" value="Yes" class="btn btn-primary" onclick="yesFunction();">
</td>
<td align="center">
<input type="button" class="btn btn-secondary" value="No" onclick="noFunction();">
</td>
        </tr>
         <tr class="formtable">
	     <td colspan="2">&nbsp;</td>
	  </tr>
    </table> 
    </div>
    </div>
    <!-- </div> 
    </main> -->
    </div>
    </div>
    
    
        
   
        
   
  

    
    </body>
</html>
