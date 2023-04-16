<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<meta name="viewport" http-equiv="Content-Type"
	content="width=device-width, initial-scale=1, text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="https://www.google.com/recaptcha/api.js" asyncdefer></script>
</head>
<body>
<body style="background-color: hsl(0, 0%, 96%)">

	<!-- <div style ="display:flex"> -->

	<jsp:include page="/jsp/commons/header.jsp" />


	<div class="container-fluid" style="padding: 4%">
		<div class="row">


			<h1 class="h1 display-1">
				OFFICE OF<br /> <span class="text-primary">INTERNATIONAL
					EDUCATION</span>
			</h1>
			<div class="row">
				<div class="col-sm-8">
					<p class="h5">The Office of International Education is a comprehensive unit committed to providing programs and services that transform the lives of our students, faculty, staff, and community through high impact, international education experiences.</p>
				</div>
				<div class="col-sm-4">
					<div class="global-container">
						<div class="card login-form">
							<div class="card-header h4">Register Now</div>
							<div class="card-body">
								<div class="card-text">
								
								
									<form onsubmit="return submitUserForm();"
										action="<%=response.encodeURL("registrationload.jsp")%>"
										method="post">
										<div class="form-group">
											<label for="name"><i class="form-label"></i></label> <input
												class="form-control" type="text" name="name" id="Username"
												placeholder="Your UserName" />
										</div>
										<div class="form-group">
											<label for="univid"><i class="form-label"></i></label> <input
												class="form-control" type="text" name="univid" id="univid"
												placeholder="Your University ID" />
										</div>
										<div class="form-group">
											<label for="email"><i class="form-label"></i></label> <input
												class="form-control" type="email" name="email" id="email"
												placeholder="Your Email" />
										</div>
										<div class="form-group">
											<input type="checkbox" name="agree-term" id="agree-term"
												class="form-control" /> <label for="agree-term"
												class="form-label">I agree to all statements in <a
												href="#" class="term-service">Terms of service</a>.
												Temporary Password sent to Email Address.
											</label>
										</div>
										<div class="g-recaptcha" data-sitekey="6Lfl1IIlAAAAAIl4TXXsdiCgcOMrvOvpOoF3p0iV" data-callback="verifyCaptcha"></div>
		    <div id="g-recaptcha-error"></div>
		    <br>
										
										<div class="form-group">
											<input type="submit" class="btn btn-primary" name="signup"
												id="signup" value="Register" />
											<button type="reset" class="btn btn-secondary" value="Reset" />
												

										</div>
									</form>
									
									<script src='https://www.google.com/recaptcha/api.js'></script>
		<script>
		var recaptcha_response = '';
		function submitUserForm() {
			var response = grecaptcha.getResponse();
			console.log(response.length);
		    if(response.length == 0) {
		        document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">This field is required.</span>';
		        return false;
		    }
		    else{
		    	response.encodeURL("registrationload.jsp")
		    }
		    return true;
		}
		 
		function verifyCaptcha() {
			console.log(response.length);
		    /* recaptcha_response = token; */
		    document.getElementById('g-recaptcha-error').innerHTML = '';
		}
		</script>
								</div>



								<a href="login.jsp" class="sign-up">I am already member.
									Login now. </a>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="/jsp/commons/footer.jsp" />


</body>

</html>