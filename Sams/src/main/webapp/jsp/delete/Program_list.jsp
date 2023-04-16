


<%
String jsppath = request.getContextPath() + "/jsp/commons/";
%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page
	import="org.uta.sams.beans.*,org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
<jsp:useBean id="searchbean" scope="request"
	class="org.uta.sams.beans.SearchBean" />
<jsp:setProperty name="searchbean" property="*" />



<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>


<link rel="stylesheet" href="<%=jsppath%>sams/sample.css"
	type="text/css" title="International Stylesheet">
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Program List</title>
<style type="text/css">
</style>
</head>



<body id= "page-top">

	

    <jsp:include page="/jsp/commons/header.jsp" />





		<div class="conatiner-fluid">

			<div class="row">
				<script type="text/javascript"
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />



		




	


			
			
			<div class="col-sm-8">
			
					<!-- Page Heading -->
					<div class = "container-fluid">
 <div class="row display-4">Program List</div>
    
			<table class="table">

				<thead>


					<tr>
						<th>Program Name</th>
						<th width="15%">Term</th>
						<th width="15%">Type</th>
						<th width="15%">Region</th>
						<th width="15%">Country</th>
						<th width="25%">Departments</th>
					</tr>
				</thead>


				<%
				String contextpath = request.getContextPath() + "/";
				String txtaction = "";
				ProgramController programcontroller = new ProgramController();
				ArrayList programlist = programcontroller.searchPrograms(searchbean);
				if (programlist != null) {
					request.getSession().setAttribute("programlist", programlist);
					for (int i = 0; i < programlist.size(); i++) {
						if (programlist.get(i) == null)
					continue;
						ProgramBean program = (ProgramBean) programlist.get(i);
				%>


				<tr valign="top">

<tr><td><a href="<%=contextpath%>jsp/delete/deleteProgram_detail.jsp?program_name=<%=program.getProgramName()%>&term=<%=program.getTerm()%>"><%=program.getProgramName()%></a></td>

					
					<td width="15%"><%=program.getTerm()%></td>
					<td width="15%"><%=program.getProgramType()%></td>
					<td width="15%"><%=program.getRegion()%></td>
					<td width="15%"><%=program.getCountry()%></td>
					<td width="25%">
						<%
						for (int j = 0; j < program.getSubjects().length; j++) {
						%> <%=program.getSubjects()[j]%>,
						<%}%>
					</td>
				</tr>


				<%
				}
				}

				else {
				%>

			</table>
			<div>Some Exception occurred. No data is presently available to
				present</div>

			<%
			}
			%> 
			</div></div>
	
		</div>
	</div>
	


</body>
</html>

