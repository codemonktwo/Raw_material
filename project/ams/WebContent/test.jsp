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
<link rel="stylesheet"
	href="assets/css/Registration-Form-with-Photo-1.css">
<link rel="stylesheet"
	href="assets/css/Registration-Form-with-Photo.css">
<link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
	<div class="container profile profile-view" id="profile">
		<form action="test.jsp">
		<form action="test.jsp">
			<div class="form-row profile-row">
				<div class="col-md-8">
					<h1>Select Course</h1>
					<hr>

					<div class="form-row">
						<div class="col-sm-3 col-md-3">
							<br> <label>MCA</label>&emsp;<input type="checkbox"
								value="mca" name="course">
						</div>
						<div class="col-sm-4 col-md-4">
							<label>Branch<select class="form-control" name="branch"><optgroup>
										<option value="mca" selected>Not Appicable</option>
									</optgroup></select></label>
						</div>
						<div class="col-sm-2 col-md-2">
							<label>Semester<select class="form-control"
								name="semester"><optgroup>
										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</optgroup></select></label>
						</div>

						<div class="col-sm-2 col-md-2">
							<br>
							<button type="submit" name="submit">subject</button>
						</div>
					</div>
		</form>
		<div class="form-row">
			<div class="col-sm-4 col-md-6">
				<label>Subject<select class="form-control" id="subject"
					name="subject"><optgroup>
					<option>None</option>
							<%
								String course = request.getParameter("course");
								session=request.getSession();
								if (request.getParameter("submit") != null&&course.equals("mca")) {
									session.setAttribute("course",course);
									String branch = request.getParameter("branch");
									session.setAttribute("branch",branch);
									String semester = request.getParameter("semester");
									session.setAttribute("branch",semester);
									String sub=request.getParameter("subject");
									if(sub!=null)
									{
										String regid=(String)session.getAttribute("regid");
										String getStudentQuery="select regno from student where course='"+course+"' and semester='"+semester+"' and branch='"+branch+"';";
										Connection con=ProvideConnection.getCon();
										Statement st=con.createStatement();
										ResultSet rs=st.executeQuery(getStudentQuery);
										String studentRegid="date varchar(10)";
										while(rs.next())
										{
											studentRegid+=", "+rs.getString(1)+" varchar(10)";
										}
										String query="create table "+regid+course+branch+semester+sub+"("+studentRegid+")";	
									}
									else
									{
										String query="select subjectname from subjects right join(select subjectid from "+branch+" where semester='"+semester+"') as mca1 on mca1.subjectid=subjects.subjectid;";
										Connection con = ProvideConnection.getCon();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery(query);
										int i = 1;
										while (rs!=null&&rs.next()) {
											String subject = rs.getString(1);
											out.println("<option value=" +subject+">"+subject+"</option>");
										}
									}
							//		con.close();
								//	st.close();
								}
							%>
						</optgroup></select></label>
			</div>
			<div class="col-sm-2 col-md-2">
				<br>
				<button type="submit" name="submit">subject</button>
			</div>
		</div>		
	</form>
		<br>
		<hr>
			<form action="test.jsp">
			<div class="form-row">
					<div class="col-sm-2 col-md-2">	
						<br>
						<label>BTECH</label>&emsp;<input value="btech" name="course" type="checkbox">
					</div>
					<div class="col-sm-4 col-md-3">	
						<label>Branch<select class="form-control"  name="branch"><optgroup>
									<option value="btech_it" selected>Computer Science Eng</option>
									<option value="2" >Electrical Engineering</option>
									<option value="3" >Electronics and Communication Eng</option>
									<option value="4" >Civil Engineering</option>
									<option value="5" >Mechanical Engineering</option>
									<option value="btech_it" >Information Technology Eng</option>
									<option value="7" >Chamical Engineering</option>
								</optgroup></select></label>
						</div>
					<div class="col-sm-2 col-md-2">	
						<label>Semester<select class="form-control" id="semester" name="semester"><optgroup>
									<option value="1" selected>1</option>
									<option value="2" >2</option>
									<option value="3" >3</option>
									<option value="4" >4</option>
									<option value="5" >5</option>
									<option value="6" >6</option>
									<option value="7" >7</option>
									<option value="8" >8</option>
								</optgroup></select></label>
						</div>
						<div class="col-sm-2 col-md-2">
							<br>
							<button type="submit" name="submit">subject</button>
						</div>
				</div>
			<br>
		</form>
		<div class="form-row">
			<div class="col-sm-6 col-md-12">
				<label>Subject<select class="form-control" id="subject"
					name="subject"><optgroup>
							<%
							course = request.getParameter("course");	
								
								if (request.getParameter("submit") != null&&course.equals("btech")) {
									String branch = request.getParameter("branch");
									String semester = request.getParameter("semester");
									String query="select subjectname from subjects right join(select subjectid from "+branch+" where semester='"+semester+"') as mca1 on mca1.subjectid=subjects.subjectid;";
									Connection con = ProvideConnection.getCon();
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery(query);
									int i = 1;
									while (rs!=null&&rs.next()) {
										String subject = rs.getString(1);
										out.println("<option value=" +subject+">"+subject+"</option>");
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
		<form action="test.jsp">
				<div class="form-row">
					<div class="col-sm-2 col-md-2">	
						<br>
						<label>MTECH</label>&emsp;<input type="checkbox">
					</div>
					<div class="col-sm-4 col-md-3">	
						<label>Branch<select class="form-control" id="branch" name="branch"><optgroup>
									<option value="1" selected>Computer Science</option>
									<option value="2" >2</option>
									<option value="3" >3</option>
									<option value="4" >4</option>
									<option value="5" >5</option>
									<option value="6" >6</option>
									<option value="7" >7</option>
									<option value="8" >8</option>
								</optgroup></select></label>
						</div>
					<div class="col-sm-2 col-md-2">	
						<label>Semester<select class="form-control" id="semester" name="semester"><optgroup>
									<option value="1" selected>1</option>
									<option value="2" >2</option>
									<option value="3" >3</option>
									<option value="4" >4</option>
								</optgroup></select></label>
						</div>
						<div class="col-sm-2 col-md-2">
							<br>
							<button type="submit" name="submit">subject</button>
						</div>

			</div>
		</form>
		<div class="form-row">
			<div class="col-sm-6 col-md-12">
				<label>Subject<select class="form-control" id="subject"
					name="subject"><optgroup>
							<%
								course = request.getParameter("course");
								//session=request.getSession();
								//session.setAttribute("course",course);
								if (request.getParameter("submit") != null&&course.equals("mtech")) {
									String branch = request.getParameter("branch");
									String semester = request.getParameter("semester");
									String query="select subjectname from subjects right join(select subjectid from "+branch+" where semester='"+semester+"') as mca1 on mca1.subjectid=subjects.subjectid;";
									Connection con = ProvideConnection.getCon();
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery(query);
									int i = 1;
									while (rs!=null&&rs.next()) {
										String subject = rs.getString(1);
										out.println("<option value=" +subject+">"+subject+"</option>");
									}
									con.close();
									st.close();
								}
							%>
						</optgroup></select></label>
			</div>
		</div>
</body>
</html>