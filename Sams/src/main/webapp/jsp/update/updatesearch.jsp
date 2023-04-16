<%
String jsppath = request.getContextPath() + "/jsp/commons/";
%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="org.uta.sams.controller.ProgramController,org.uta.sams.beans.*"%><%@page contentType="text/html"%>
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
<link rel="stylesheet" href="<%=jsppath%>sams/sample.css"
	type="text/css" title="International Stylesheet">
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
     <script >
       var country= new Array();
       var region= new Array();
       var departments=new Array();
       var schools=new Array();
       var deptList=new Array();
       
       function populateCountry(){
       var  i=0;
       
    <%
        String program=request.getParameter("program");
        String term=request.getParameter("term");
        ProgramController programcontroller=new ProgramController();
        ContainerBean containerbean=programcontroller.updateProgramShowDetail(program,term);
        UtilityBean utilitybean=containerbean.getUtilitybean();
        ProgramBean programbean=containerbean.getProgrambean();
        String[][] region_country=utilitybean.getRegion_country();
        if(region_country!=null){ 
            for(int i=0;i<region_country.length;i++)
            {
                for(int j=0;j<region_country[i].length;j++){
                    if(region_country[i][j]!=null&&!region_country[i][j].equalsIgnoreCase("null")){

    %>
     if('<%=j%>'!='0'){
     country[i]='<%=region_country[i][j]%>';
     region[i]='<%=region_country[i][0]%>';
     i++;
     }
    <%
                    }
    }%>
    
     <%
            }
        }
    %>
    }
    
    function populateDepartments(){
    
        var  i=0;
       
    <%
      
        String[][] dept_school=utilitybean.getSchool_departments();
        if(dept_school!=null){ 
            for(int i=0;i<dept_school.length;i++)
            {
                for(int j=0;j<dept_school[i].length;j++){
                    if(dept_school[i][j]!=null&&!dept_school[i][j].equalsIgnoreCase("null")){

    %>
     if('<%=j%>'!='0'){
     departments[i]='<%=dept_school[i][j]%>';
     schools[i]='<%=dept_school[i][0]%>';
     i++;
     }
    <%
                    }
    }%>
    
     <%
            }
        }
    %>
    
    }
    
   /* function display(){
        
        populateCountry();
        populateDepartments();
        var temp;
        temp="Region\t Country<br>";
        for(var i=0;i<region.length;i++){
          temp+=""+region[i]+"\t"+country[i]+"<br>";
         }
         temp+="School\t department<br>";
         for(var i=0;i<schools.length;i++){
          temp+=""+schools[i]+"\t"+departments[i]+"<br>";
         }
         var ele=document.getElementById("test");
         ele.innerHTML=temp;
         ele.visible=true;
         
    }
    */
    
    function isPresent(selectbox,key){
         var i=0;
         for(i=0;i<selectbox.options.length;i++){
             if(selectbox.options[i].value==key)return true;
         }
         return false;
    }
    
    function initialize(){
        populateCountry();
        populateDepartments();
      var i=0,j=0;
      var regionSelect=document.getElementById("regionSelect");
      for(i=0;i<region.length;i++){
         if(!isPresent(regionSelect,region[i])){
             var optn=document.createElement("OPTION");
             optn.text=region[i];
             optn.value=region[i];
             regionSelect.options.add(optn);
         }
      }
      var schoolSelect=document.getElementById("schoolSelect");
        for(i=0;i<schools.length;i++){
          if(!isPresent(schoolSelect,schools[i])){
              var optn=document.createElement("OPTION");
              optn.text=schools[i];
              optn.value=schools[i];
              schoolSelect.options.add(optn);
           }
        }
     }
     
     function emptySelectBox(selectBox){
        var i=0;
        for(i=selectBox.options.length-1;i>=0;i--){
           selectBox.remove(i);
        }
     }
     
     function updateCountry(){
        var j=0,i=0;
        var name = new Array;
        var index = 0;
        var ele=document.getElementById("regionSelect");
        for(j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
             name[index++]=ele.options[j].value;
             //alert("option is selected");
             }
        }
        var countrySelect=document.getElementById("countrySelect");
        emptySelectBox(countrySelect);
        //alert("after select box"+name);
        for(index=0;index<name.length;index++){
        for(i=0;i<region.length;i++){
         if(region[i]==name[index]){
             var optn=document.createElement("OPTION");
             optn.text=country[i];
             optn.value=country[i];
             countrySelect.options.add(optn);
         }
       }
      }
        
     }
     
     function addToCountryList(){
         var ele=document.getElementById("countrySelect");
         var countryList=new Array();
         var index=0;
        for(j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
             countryList[index++]=ele.options[j].value;
             //alert("option is selected");
             }
        }
        var countrySelect=document.getElementById("countryList");
        //emptySelectBox(countrySelect);
        //alert("after select box"+name);
        for(i=0;i<deptList.length;i++){
             var optn=document.createElement("OPTION");
             optn.text=countryList[i];
             optn.value=countryList[i];
             countrySelect.options.add(optn);
         
      }
     }
     
      function deleteFromCountryList(){
         var i=0;
         var selectBox=document.getElementById("countryList");
        for(i=selectBox.options.length-1;i>=0;i--){
           if(selectBox.options[i].selected)selectBox.remove(i);
        }
     }
     
     function updateDepartment(){
             var j=0,i=0;
        var name=new Array();
        var index=0;
        var ele=document.getElementById("schoolSelect");
        for(j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
             name[index++]=ele.options[j].value;
             //alert("option is selected");
             }
        }
        var deptSelect=document.getElementById("departmentSelect");
        emptySelectBox(deptSelect);
        //alert("after select box"+name);
        for(index=0;index<name.length;index++){
        for(i=0;i<schools.length;i++){
         if(schools[i]==name[index]){
             var optn=document.createElement("OPTION");
             optn.text=departments[i];
             optn.value=departments[i];
             deptSelect.options.add(optn);
         }
      }
      }
     }
     
      function addToDepartmentList(){
         var ele=document.getElementById("departmentSelect");
         var deptList=new Array();
         var index=0;
        for(j=0;j<ele.options.length;j++){
        //alert(ele.options[j].selected+" "+ele.options[j].text+" "+ele.options[j].value);
         if(ele.options[j].selected){
             deptList[index++]=ele.options[j].value;
             //alert("option is selected");
             }
        }
        var deptSelect=document.getElementById("departmentList");
        //emptySelectBox(departmentSelect);
        //alert("after select box"+name);
        for(i=0;i<deptList.length;i++){
             var optn=document.createElement("OPTION");
             optn.text=deptList[i];
             optn.value=deptList[i];
             deptSelect.options.add(optn);
         
      }
     }
     
     function deleteFromDeptList(){
         var i=0;
         var selectBox=document.getElementById("departmentList");
        for(i=selectBox.options.length-1;i>=0;i--){
           if(selectBox.options[i].selected)selectBox.remove(i);
        }
     }
    </script >

       
        <style type="text/css">
<!--
.searchtable {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-align: left;
	text-indent: 5px;
	border-bottom-width: thin;
	border-bottom-style: solid;
	border-bottom-color: #666666;
	width: 100%;
}
.textall {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-align: left;
}
.regionSelect {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	width: 125px;
	height: 80px;
	text-align: left;
        overflow: auto;
}
-->
        </style>
</head>
    <body id="page-top" onload="initialize()">

    <jsp:include page="/jsp/commons/header.jsp" />


<div class="conatiner-fluid">

			<div class="row">
				<script type="text/javascript"
					src="<%=jsppath%>../commons/sams/fsmenu.js"></script>

				<jsp:include page="/jsp/commons/left.jsp" />
			
			<div class="col-sm-8">
			
					<!-- Page Heading -->
					<div class = "container-fluid">
 <div class="row display-4">Search Program to Update</div>
 <form action="<%=request.getContextPath()%>/jsp/update/Program_list.jsp" method="post"> 
 
	<div class="form-row">
	
					<!--Region  -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">Region</label>
						<select class="form-control" id="regionSelect" name="region" onchange="updateCountry()" multiple size="8"><option>---Regions-----</option></select>
					</div>





					<!-- Country -->

					<div class="col m-3">
						<label class="form-label" for="inputState">Country</label> 
						 <select class="form-control" id="countrySelect" name="country" multiple size="8"></select>
					</div>
				</div>
				
				
				
				
				
				<div class="form-row">
	
					<!--School  -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">School</label>
						<select  class="form-control" id="schoolSelect" name="school"onchange="updateDepartment()" multiple size="8"><option>---Schools-----</option></select>
					</div>





					<!-- Department -->

					<div class="col m-3">
						<label class="form-label" for="inputState">Department</label> 
						 <select  class="form-control" id="departmentSelect" name="subjects" multiple size="8"></select>
					</div>
				</div>
				
				
				
				<div class="form-row">
	
					<!--Program Type  -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">Program Type</label>
		<select class="regionSelect form-control" name="programType" multiple >
                    <option>Affiliated</option>
                    <option>Reciprocal Exchange</option>
                    <option>Faculty-led</option>
                </select>
					</div>





					<!-- Term of Study -->

					<div class="col m-3">
						<label class="form-label" for="inputState">Term of Study</label> 
						 <select class="regionSelect form-control" name="term" multiple>
                    <option value="summer">Summer/Short term</option>
                    <option value="semester/year">Semester</option>
                    <option value="academic">Academic Year</option>
                </select>
					</div>
				</div>
				
				
				
				
				
				<div class="form-row">
	
					<!--Languages  -->

					<div class="col m-3">
						<label class="form-label" for="form3Example1">Languages</label>
		<select name="languages" size="4" multiple="multiple" class="form-control">
                     <%
              String[] lang = utilitybean.getLanguages();
              for(int i=0;i<lang.length;i++){
      %>
                    <option><%=lang[i]%></option>
                   <%}%>

                    </select>
					</div>



				</div>
				
			
            
                        
               
               
            
                <button type="submit" class="btn btn-primary btn-block mb-4 w-auto" value="search" onclick="validateForm();">
                  Search
                </button>
               
                
                 <button type="reset" class="btn btn-primary btn-block mb-4 w-auto" value="reset">
                  Reset
                </button>

    </form>
    </div></div></div></div>
    
  
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


    <jsp:include page="/jsp/commons/footer.jsp"/>
    </body>
</html>
