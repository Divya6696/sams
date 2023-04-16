<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.uta.sams.beans.ProgramBean,org.uta.sams.controller.ProgramController,java.util.ArrayList"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  <% String jsppath=request.getContextPath()+"/jsp/commons/";%>  
   <style type="text/css">

table {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}
   </style>
</head>

<body id='page-top'>

<div class="row wrapper">
	
		<%-- <% if(ub!=null){
		        request.getSession().setAttribute("user",ub); %>
		        <!-- Welcome Message !!!!!! -->
		
		   <%}else{
			   response.sendRedirect("login.jsp");
		   }
		%> --%>

		<jsp:include page="../commons/header.jsp" />

		<div class="row mt-5 w-100">

			<div class="col-auto mt-3 w-25 h-100" style="position: fixed">

				<jsp:include page="../commons/left_1.jsp" />

			</div>
			<main class="col mt-5 content">
			<div id="content-wrapper" class="d-flex col">
			<div
						class="d-sm-flex align-items-center justify-content-center mb-4">
							<h1> Program Details:</h1>
						

					</div>
 
 <%
    System.out.println("in template jsp");
   String contextpath=request.getContextPath()+"/"; 
   String getID = request.getParameter("program_name");
   String term=request.getParameter("term");
   ProgramController programcontroller= new ProgramController();
   ProgramBean program=null;
   System.out.println("in template jsp1111");
   ArrayList programlist = (ArrayList) session.getAttribute("programlist");
   System.out.println("in template jsp222222");
   programlist=null;
   if(programlist != null){
       for(int i=0;i<programlist.size();i++){
           program = (ProgramBean)programlist.get(i);
           if(program ==null)continue;
           System.out.println("in template jsp 3333");
           if(program!=null){
               System.out.println("in template jsp 4444");
               if(program.getProgramName().equalsIgnoreCase(getID) && program.getTerm().equalsIgnoreCase(term))break;
               System.out.println("in template jsp 5555");
             //program=null;   
           }
           
       }
   }else{
       System.out.println(">>>>>>Goiing To COntroller for Details <<<<<<");
       program=programcontroller.showDetail(getID,term);
   }
   
   if(program!=null){
            
    %>
    <table>
    	<tr>
    	<th>Name
    	</th>
    	<td><%=program.getProgramName()%>
    	</td>
    	</tr>
    	
    	<tr>
    	<th>Country
    	</th>
    	<td><%=program.getCountry()%>
    	</td>
    	</tr>
    	
    	<% if (program.getImg1()!= null || program.getImg2()!= null || program.getImg3()!= null) { %>
    		<tr>
    		<td>
	    		<img src="../search/images/<%=program.getImg1()%>" alt="blank"  width="165" height="80" />
	    		<img src="../search/images/<%=program.getImg2()%>" alt="blank"  width="165" height="80" />
	    		<img src="../search/images/<%=program.getImg3()%>" alt="blank"  width="165" height="80" />
    		</td>
    	</tr>
    	<%}%>
    	
    	<tr>
    	<th>Type
    	</th>
    	<td><%=program.getProgramType()%>
    	</td>
    	</tr>
    	
    	<tr>
    	<th>Term
    	</th>
    	<td><%=program.getTerm()%>
    	</td>
    	</tr>
    	
    	<tr>
    	<th>Languages
    	</th>
    	<td><%for(int j=0;j<program.getLanguages().length;j++){%>
    <%=program.getLanguages()[j]%>, &nbsp;
    <%}%>
    	</td>
    	</tr>
    	
    	<tr>
    	<th>Academics
    	</th>
    	<td><%for(int j=0;j<program.getSubjects().length;j++){%>
    <%=program.getSubjects()[j]%>, &nbsp;
    <%}%>
    	</td>
    	</tr>
    	
    	<tr>
    	<th>Housing
    	</th>
    	<td><%=program.getHousing()%>
    	</td>
    	</tr>
    	
    	<tr>
    	<th>Fees
    	</th>
    	<td> <%=program.getFee()%>
    	</td>
    	</tr>
    	
    	<tr>
    	<th>How to Apply
    	</th>
    	<td> <%=program.getAppDetails()%>
    	</td>
    	</tr>
    
    </table>
    
 <%--    <input type="hidden" name="programID" value="<%=program.getProgramName() %>">
    <input type="hidden" name="termID" value="<%=program.getTerm()%>">
    
<div class="main" >

<div class="main_div2">
</div>

<div class="main_div1">
<table width="100%" height="100%"><tr>
<td><img src="../search/images/<%=program.getImg1()%>" alt="blank"  width="165" height="80">
</img>
</td>
<td>
<img src="../search/images/<%=program.getImg2()%>" alt="blank" width="165" height="80">
</img>
</td>
<td><img src="../search/images/<%=program.getImg3()%>" alt="blank" width="160" height="80">
</img>
</td>
</tr></table>
</div>
<div class="main_div3">

<div class="main_div4">

  <table width="100%" border="0">
  <tr>
    <td style="font-size:32pt"><%=program.getCountry()%></td>
   
  </tr>
  <tr>
  	<td>&nbsp;</td>
  </tr>
  <tr>
    <td><%=program.getProgramName()%> </td>

  </tr>
  <tr>
    <td>Program Type: <%=program.getProgramType()%> </td>
      
  </tr>
  <tr>
        <td>Term: <%=program.getTerm()%> </td>
  </tr>
  <tr>
        <td>Language: <%for(int j=0;j<program.getLanguages().length;j++){%>
    <%=program.getLanguages()[j]%>, &nbsp;
    <%}%> </td>

  </tr>
  <tr>
       <td>&nbsp;</td>
  </tr>
</table>



</div>    
<div class="crossimage">
    <br>
    
    <table align="center" valign="bottom" width="70%" height="70%">
       <tr><td> <img src="../search/images/ppl2.jpg" width="200">
        </img>
       </td></tr>
    </table>
    
</div>

<div class="main_div5">

<table width="100%" border="0">
  <tr>
    <td style="font-size:20pt">Academics</td>
   
  </tr>
  
  <tr>
    <td> <%for(int j=0;j<program.getSubjects().length;j++){%>
    <%=program.getSubjects()[j]%>, &nbsp;
    <%}%></td>
    
  </tr>
  <tr><td height="10px"></td></tr>
  <tr>
    <td style="font-size:20pt">Housing</td>
       
  </tr>
  
  <tr>
    <td><%=program.getHousing()%></td>
    
  </tr>
  <tr><td height="10px"></td></tr>
  <tr>
    <td style="font-size:20pt">Fees</td>
       
  </tr>
  
  <tr>
    <td><%=program.getFee()%></td>

  </tr>
  <tr><td height="10px"></td></tr>
  <tr>
    <td style="font-size:20pt">Application</td>
       
  </tr>
  
  <tr>
    <td><%=program.getAppDetails()%></td>
        
  </tr>
</table>

</div>



<div class="main_div6">

<table width="100%" border="0">
  <tr>
    <td>Testimonial</td>
   
  </tr>
  <tr>
  	<td>&nbsp;</td>
    
  </tr>
  <tr>
    <td>&nbsp;</td>
	
  </tr>
 
</table>

</div>

<div class="main_div7">

<table width="100%" border="0">
  <tr>
    <td align="center" style="font-size:18pt">Useful WebSites</td>
   
  </tr>
  <tr>
  	<td>&nbsp;</td>
    
  </tr>
  <tr>
    <td>&nbsp;</td>
	
  </tr>
  <tr>
  	<td>&nbsp; </td>    
    
  </tr>
  
</table>


</div>

</div>

</div> --%>
 <%
           
       }
   else{
%>
No details Available
<%
   }


%>
</div></main></div></div>
</body>
</html>
