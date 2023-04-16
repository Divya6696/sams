<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="org.uta.sams.controller.ProgramController,org.uta.sams.beans.*"%>
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
    </head>
    
    
    <script>
        var nm;
        function change(){
        var ele = document.uploadForm.position;
        for(var j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
         
            nm=ele.options[j].value;
            document.uploadForm.pos.value=nm;
             }
        
        }
        
        
        }
        function change2(){
       
uploadForm.Upload.value='Uploading...';
document.uploadForm.action='uploadImage.jsp?prg=<%=request.getParameter("prg")%>&term=<%=request.getParameter("term")%>&position='+document.uploadForm.pos.value;
 document.uploadForm.submit();
  
        }
    </script>
    <body id = "page-top">

          <jsp:include page="/jsp/commons/header.jsp"/>
    

<div class= "container-fluid">
<div class= "row">
 <script type="text/javascript" src="/jsp/commons/sams/fsmenu.js"></script>
              <jsp:include page="/jsp/commons/left.jsp"/>
            
 <div class = "col-sm-8">
 <div class = "container-fluid">
 <div class="row display-4">Upload Images
					</div>
    
   <table>
       
   <form name="uploadForm" action="change2();" enctype="multipart/form-data" method="post">    
    
       <%
       String programName = request.getParameter("prg");
       String term1 = request.getParameter("term");
       
       
       %>
       <tr>
            <td><label class="form-label">Program Name</label></td>
            <%
            if(request.getParameter("prg") != null)
            {%>
                <td><input type=text name="prg" class="form-control" value="<%=request.getParameter("prg")%>"></td>
           <% }
            else
           {%>
            
            <td><input class="form-control" type=text name="prg"></td>
            <%
            }
            %>
            
            
            
       </tr>
       
       <tr>
            <td><label class="form-label">Term of Study</label></td>
<%            
            if(request.getParameter("term") != null)
{%>
                <td><input type=text class="form-control" name="term" value="<%=request.getParameter("term")%>"></td>
           <% }
            else
            {
            %>
            <td><input class="form-control" type=text name="term"></td>
            <%
            }
            %>
       </tr>
       
       <tr>
       <td colspan="2"><label class="form-label"><b>Images already present for this program name and term:</b></label></td>
      </tr>
      <tr>
            <td>
            <%
               ProgramBean pb = new ProgramBean();
            ProgramController pc = new ProgramController();
            pb= pc.showDetail(programName,term1);
            %>    
              Image1: <%=pb.getImg1()%><br>
              Image2: <%=pb.getImg2()%><br>
              Image3: <%=pb.getImg3()%>
               
            
     
            </td>
      
      </tr>
      <tr>
       <td colspan="2"><label class="form-label"><b>Upload Image:</b></label></td>
      </tr>
      
      <tr>
            <td><label class="form-label">Select the image position: </label></td>
            <td><select class="form-control" name="position" onchange="change();">
                <option value="null">Select One</option> 
                <option value="img1">Image 1</option>
                <option value="img2">Image 2</option>
                <option value="img3">Image 3</option>
</select></td>
       </tr>
       
       
       <tr>
         <td valign="top"><label class="form-label">Select file: </label></td>
      <td >
       
       

                
    <input class="form-control" type="hidden" name="pos" value=""/>
    <input class="form-control" type="file" name="file"/>
    <input class="btn btn-primary" TYPE=Button name='Upload' Value='Upload' onClick="change2();">
     
    </form>
 </td>
       </tr>
   </table>


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
   
        
   </div></div></div></div>
    
    <jsp:include page="/jsp/commons/footer.jsp"/>
    
    </body>
</html>
