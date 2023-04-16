<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="org.uta.sams.beans.*,org.uta.sams.controller.ProgramController,java.util.ArrayList,java.io.*"%>
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
 
         <%
 
    response.setContentType("text/html");
    response.setHeader("Cache-control","no-cache");
 String img_path="";
 String img_path1="";
 String fileName=null;
 ProgramController programcontroller = new ProgramController();
    String err = "";
 
    String lastFileName = "";
    String path = request.getContextPath();
    String contentType = request.getContentType();
    String boundary = "";
    final int BOUNDARY_WORD_SIZE = "boundary=".length();
    if(contentType == null || !contentType.startsWith("multipart/form-data")) {
      err = "Ilegal ENCTYPE : must be multipart/form-data\n";
      err += "ENCTYPE set = " + contentType;
    }else{
      boundary = contentType.substring(contentType.indexOf("boundary=") + BOUNDARY_WORD_SIZE);
      boundary = "--" + boundary;
      try {
        javax.servlet.ServletInputStream sis = request.getInputStream();
        byte[] b = new byte[1024];
        int x=0;
        int state=0;
        String name=null,contentType2=null;
        java.io.FileOutputStream buffer = null;
        while((x=sis.readLine(b,0,1024))>-1) {
          String s = new String(b,0,x);
          if(s.startsWith(boundary)) {
            state = 0;
            //out.println("name="+name+"<br>");
            //out.println(fileName+"<br>");
 
            name = null;
            contentType2 = null;
            fileName = null;
 
 
          }else if(s.startsWith("Content-Disposition") && state==0) {
            state = 1;
            if(s.indexOf("filename=") == -1)
              name = s.substring(s.indexOf("name=") + "name=".length(),s.length()-2);
            else {
              name = s.substring(s.indexOf("name=") + "name=".length(),s.lastIndexOf(";"));
              fileName = s.substring(s.indexOf("filename=") + "filename=".length(),s.length()-2);
              if(fileName.equals("\"\"")) {
                fileName = null;
              }else {
                String userAgent = request.getHeader("User-Agent");
                String userSeparator="/";  // default
                if (userAgent.indexOf("Windows")!=-1)
                  userSeparator="\\";
                if (userAgent.indexOf("Linux")!=-1)
                  userSeparator="/";
                fileName = fileName.substring(fileName.lastIndexOf(userSeparator)+1,fileName.length()-1);
                if(fileName.startsWith( "\""))
                  fileName = fileName.substring( 1);
              }
            }
            name = name.substring(1,name.length()-1);
            if (name.equals("file")) {
              if (buffer!=null)
                buffer.close();
              lastFileName = fileName;
               img_path = session.getServletContext().getRealPath("/jsp/search/images");
                img_path1=img_path+"/"+fileName;
              File fl = new File(img_path+"/"+fileName);
              buffer = new java.io.FileOutputStream(fl);
            }
          }else if(s.startsWith("Content-Type") && state==1) {
            state = 2;
            contentType2 = s.substring(s.indexOf(":")+2,s.length()-2);
          }else if(s.equals("\r\n") && state != 3) {
            state = 3;
          }else {
            if (name.equals("file")){
              buffer.write(b,0,x);
              System.out.println("Writing to file");
            }
          }
        }
        sis.close();
        /* buffer.close(); */
      }catch(java.io.IOException e) {
        err = e.toString();
      }
    }
    boolean ok = err.equals("");
    if(!ok) {
      out.println(err);
    }
    %>

   <%
   
    
  System.out.println(">>>>>>>>>>>>>>>>>>>>>>>"+img_path1);
          // String fp = request.getParameter("filepath");
          programcontroller.uploadProgram(img_path1);
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
 <div class="row" align="center">
 
<h3>Program Uploaded</h3></div>

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