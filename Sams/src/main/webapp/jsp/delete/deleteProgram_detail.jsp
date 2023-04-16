<%
String jsppath = request.getContextPath() + "/jsp/commons/";
%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.uta.sams.beans.*,org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
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
.normalstyle {font-family: Arial, Helvetica, sans-serif; font-size: 14px; color: #333333; }
-->

</style>
<script type="text/javascript">
    function checkForm()
    {
      if (clicked === "delete"){
         confirm("Are you sure you want to Delete the Program?\n This will Permanently delete the program.")
      }
      else {
         confirm("Are you sure you want to Cancel Deletion of the Program?")
      }
    
    }
</script>
    </head>
    <body id="page-top">

<jsp:include page="/jsp/commons/header.jsp" />

		<div class="conatiner-fluid">

			<div class="row">
				<script type="text/javascript"
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />
			
			
			<div class="col-sm-8">
			
					<!-- Page Heading -->
					<div class = "container-fluid">
 <div class="row display-4">Delete Program Detail:</div>

    
   <form action="deleteProgram_success.jsp" method="post" onsubmit="return checkForm()">
    <%
   String contextpath=request.getContextPath()+"/"; 
   String getID = request.getParameter("program_name");
   String term=request.getParameter("term");
   ProgramController programcontroller= new ProgramController();
   ProgramBean program=programcontroller.showDetail(getID,term);
   if(program!=null){
            
    %>
    <input type="hidden" name="programID" value="<%=program.getProgramName() %>">
    <input type="hidden" name="termID" value="<%=program.getTerm()%>">
    
<table class="table">

        <tr><td class="formtable" align="left" valign="top"> Program Name:</td><td class="normalstyle"><%=program.getProgramName()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Program Type:</td><td class="normalstyle"><%=program.getProgramType()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Academic Subject:</td><td class="normalstyle"><%for(int i=0;i<program.getSubjects().length;i++){%><%=program.getSubjects()[i]%>, <%}%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Term of Study:</td><td class="normalstyle"><%=program.getTerm()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Language: </td><td class="normalstyle"><%for(int i=0;i<program.getLanguages().length;i++){%><%=program.getLanguages()[i]%>, <%}%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Region:</td><td class="normalstyle"><%=program.getRegion()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Country:</td><td class="normalstyle"><%=program.getCountry()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Description:</td><td class="normalstyle"><%=program.getDescription()%></td></tr>
        <tr><td class="formtable" align="left" valign="top"> Fee:</td><td class="normalstyle"><%=program.getFee()%></td></tr>
        
        <tr><td class="formtable" align="left" valign="top"> Housing:</td><td class="normalstyle"><%=program.getHousing()%></td></tr>
        
    </table>
<table class="table">
        
	    
          <tr><td align="right"><input type="submit" class= "btn btn-primary" name="delete" onclick="clicked='delete'" value="Delete"></td>
          <td><input type="submit" name="delete" class= "btn btn-secondary" onclick="clicked='cancel'" value="Cancel"></td></tr>        
       
    </table>
    <%
           
       }
   else{
%>
    <tr><td colspan="4">Some Exception Occurred. No data is presently 
available to present</td></tr>
<%
   }


%>
   

</form>
</div></div>
</div>
</div>

    
  
    </body>
</html>
