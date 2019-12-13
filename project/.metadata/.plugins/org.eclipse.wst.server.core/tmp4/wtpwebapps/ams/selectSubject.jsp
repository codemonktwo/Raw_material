<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbConnection.ProvideConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>AMS</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
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
<script type="text/javascript" src="assets/js/selectSubject.js"></script>
<link rel="stylesheet"
	href="assets/css/Registration-Form-with-Photo-1.css">
<link rel="stylesheet"
	href="assets/css/Registration-Form-with-Photo.css">
<link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
	<div class="container profile profile-view" id="profile">
			<div class="form-row profile-row">
				<div class="col-md-8">
					<h1>Select Course</h1>
			<hr>
		<form action="selectSubject.jsp">
			<div class="form-row">
			<div class="col-sm-2 col-md-2">
			<label>Course<select id="course"  onchange="fillOption()" name="course" class="form-control">
			    <optgroup>
				    <option value="" selected>SELECT</option>
					<option value="mca">MCA</option>
				    <option value="btech">BTECH</option>
				    <option value="mtech">MTECH</option>
				</optgroup>
			</select></label>
			</div>
			<div class="col-sm-2 col-md-2">
			<label>Semester<select id="semester" name="semester" class="form-control">
				</select></label>
			</div>
				<div class="col-sm-3 col-md-3">
				<label>Branch<select id="branch" name="branch" class="form-control">
					</select></label>
				</div>

			</div>
				<div class="col-sm-3 col-md-3">
					<input type="submit" name="submit" value="subject">
				</div>
		</form>
		</div>
		</div>
		<form action="SelectSubject" method="post">
		<div class="form-row">
			<div class="col-sm-6 col-md-12">
				<label>Subject<select id="subject" name="subject" class="form-control" 
					><optgroup>
							<%
								String course = request.getParameter("course");
								out.println(course);
								if (request.getParameter("submit") != null) {
									String branch = request.getParameter("branch");
									String semester = request.getParameter("semester");
									//System.out.println(course+semester+branch);
									session=request.getSession();
									session.setAttribute("course", course);
									session.setAttribute("branch", branch);
									session.setAttribute("semester", semester);
									String sub=request.getParameter("subject");
									String query="select subjectname from subjects right join(select subjectid from "+course+branch+" where semester='"+semester+"') as mca1 on mca1.subjectid=subjects.subjectid;";
									Connection con = ProvideConnection.getCon();
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery(query);
									int i = 1;
									while (rs!=null&&rs.next()) {
										String subject = rs.getString(1);
										out.println("<option value='"+subject+"'>"+subject+"</option>");
									}
									con.close();
									st.close();
								}
							%>
						</optgroup></select></label>
			</div>
		</div>
		<br>
		<hr>
		<div class="col-sm-3 col-md-3">
		<input type="submit" name="submit" value="Save">
		</div>
	</form>
	</div>
	
</body>
</html>