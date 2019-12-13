<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>AMS</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet" href="assets/css/CDRReporteCuotas.css">
<link rel="stylesheet" href="assets/css/gradient-navbar-1.css">
<link rel="stylesheet" href="assets/css/gradient-navbar.css">
<link rel="stylesheet" href="assets/css/Header-Blue.css">
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
<link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
<link rel="stylesheet" href="assets/css/Pretty-Registration-Form.css">
<link rel="stylesheet" href="assets/css/Navbar---Apple-1.css">
<link rel="stylesheet" href="assets/css/Navbar---Apple.css">
<link rel="stylesheet" href="assets/css/Profile-Edit-Form-1.css">
<link rel="stylesheet" href="assets/css/Profile-Edit-Form.css">
<link rel="stylesheet"
	href="assets/css/Registration-Form-with-Photo-1.css">
<link rel="stylesheet"
	href="assets/css/Registration-Form-with-Photo.css">
<link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
	<div class="container profile profile-view" id="profile">
		<div class="row">
			<div class="col-md-12 alert-col relative">
				<div class="alert alert-info absolue center" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<span>Profile save with success</span>
				</div>
			</div>
		</div>
		</div>
		<form action="TeacherRegister" method="post" >
			<div class="form-row profile-row">
				<div class="col-md-4 relative">
					<div class="avatar">
						<div class="avatar-bg center"></div>
					</div>
					<input  type="file" class="form-control" name="photo">
				</div>
				<div class="col-md-8">
					<h1>Profile</h1>
					<hr>
					<div class="form-row">
						<div class="col-sm-12 col-md-6">
							<div class="form-group">
								<label>FirstName </label><input class="form-control" name="firstname" value= <%= request.getAttribute("firstname")%> disabled>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div class="form-group">
								<label>Lastname </label><input class="form-control" type="text" name="lastname" value= <%= request.getAttribute("lastname")%> disabled>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Email</label><input class="form-control" type="text"
							autocomplete="off" name="email" value= <%= request.getAttribute("email") %> disabled>
					</div>
					<div class="form-group">
						<label>Department</label><input class="form-control" type="text"
							autocomplete="off" name="department" >
					</div>
					<div class="form-group">
						<label>Registration ID</label><input class="form-control" type="text"  value= <%= request.getAttribute("regno")%>  name="regno" readonly >
					</div>
					<div class="form-group">
						<label>Address</label><input class="form-control" type="text"
							autocomplete="off" name="address" >
					</div>					
					<div class="form-group">
						<label>DOB<input class="form-control" type="date" name="dob" required></label>
					</div>
					<div class="form-group">
						<label>Gender<select class="form-control" name="gender" ><optgroup>
									<option value="Male" selected>Male</option>
									<option value="Female">Female</option>				
								</optgroup></select></label>
					</div>
					<div class="form-group">
						<label>Mobile<input class="form-control" type="tel" name="mobileno" required></label>
					</div>

					<hr>

					<div class="form-row">
						<div class="col-md-12 content-right">
							<button class="btn btn-primary form-btn" name="submit" type="submit">SAVE</button>				
							<button class="btn btn-danger form-btn" name="cancel" type="reset">CANCEL</button>
							<!--  button class="btn btn-danger form-btn" name="logout" >LOG OUT</button>-->
						</div>
					</div>
				</div>
			</div>
		</form>	
				
				
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/Navbar---Apple.js"></script>
	<script src="assets/js/Profile-Edit-Form.js"></script>
</body>

</html>