<% String jsppath=request.getContextPath()+"/jsp/commons/";%>
<%-- <link rel="stylesheet" href="<%=jsppath%>sams/fsmenu.css" type="text/css" title="International Stylesheet"> --%>
<meta charset="utf-8">
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a href="https://www.uta.edu/student-affairs/oie" target="_blank" class="navbar-brand">OIE Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a href="https://www.uta.edu/about" target="_blank" class="nav-link">About OIE</a>
      </li>
      <li class="nav-item">
        <a href="https://www.uta.edu/student-affairs/oie/about-oie/contact-us" target="_blank"class="nav-link">Contact Us</a>
      </li>
      <li class="nav-item">
        <a href="https://www.uta.edu/" target="_blank" class="nav-link">UTA Home</a>
      </li>
      <li class="nav-item">
        <a href="https://www.uta.edu/student-affairs/orientation/register" target="_blank" class="nav-link">New Students</a>
      </li>
      <li class="nav-item">
        <a href="https://www.uta.edu/student-success/university-studies/prospective" target="_blank" class="nav-link">Prospective Students</a>
      </li>
      <li class="nav-item">
        <a href="https://www.uta.edu/alumni" target="_blank" class="nav-link">Alumni</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="https://www.uta.edu/directory"  target="_blank" >Find People</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://www.outlook.com/mavs.uta.edu" target="_blank">Check E-mail</a>
      </li>
      <li class="nav-item">
        <form name="uta-search" method="get" action="https://www.uta.edu/search" target="_blank" class="form-inline">
                        <div id="secondary">
                        <input name="domains" value="uta.edu" type="hidden">
                        <input name="sitesearch" value="uta.edu" type="hidden">
                        <input name="q" id="q" value="Search UTA" class="form-control mr-sm-2" onFocus="if(this.value=='Search UTA')value=''" onBlur="if(this.value=='')value='Search UTA';" type="text" size="20">
                        <input name="Submit" value="Go!" type="submit" class="btn btn-light">
                        </div>
                    </form>
      </li>
    </ul>
  </div>  
</nav>







<!-- <nav class="header">
                <div class="header-container">
                    <a href="#">
                    </a>
                    <a data-toggle="toggle-header" data-target="#header-items" href="#"
                    >
                    </a>
                </div>
              
                <div id="header-items" class="header-menu">
                    <a href="https://www.uta.edu/student-affairs/oie" target="_blank" class="header-menu-item">OIE Home</a>
                    <a href="https://www.uta.edu/about" target="_blank" class="header-menu-item">About OIE</a>
                    <a href="https://www.uta.edu/student-affairs/oie/about-oie/contact-us" target="_blank"class="header-menu-item">Contact Us</a>
                    <a href="https://www.uta.edu/" target="_blank" class="header-menu-item">UTA Home</a>
                    <a href="https://www.uta.edu/student-affairs/orientation/register" target="_blank" class="primary-default-button">New Students</a>
                    <a href="https://www.uta.edu/student-success/university-studies/prospective" target="_blank" class="header-menu-item">Prospective Students</a>
                    <a href="https://www.uta.edu/alumni" target="_blank" class="header-menu-item">Alumni</a>
                    <a class="header-menu-item" href="https://www.uta.edu/directory"  target="_blank" >Find People</a>
                    <a class="header-menu-item" href="http://www.outlook.com/mavs.uta.edu" target="_blank">Check E-mail</a>
                    <form name="uta-search" method="get" action="https://www.uta.edu/search" target="_blank" >
                        <div id="secondary" align="center">
                        <input name="domains" value="uta.edu" type="hidden">
                        <input name="sitesearch" value="uta.edu" type="hidden">
                        <input name="q" id="q" value="Search UTA" onFocus="if(this.value=='Search UTA')value=''" onBlur="if(this.value=='')value='Search UTA';" type="text" size="20">
                        <input name="Submit" value="Go!" type="submit">
                        </div>
                    </form>
                </div>
            </nav> -->