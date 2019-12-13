<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AMS</title>
</head>
<body>
	<%
		session.removeAttribute("subject");
		session.removeAttribute("semester");
		session.removeAttribute("course");
	%> 
	<form action="teacherProfile.jsp" method="post">
	<h2 style="color:blue;"> Selected subject is already assigned to another faculty </h2>
	<input type="submit" name="submit" value="Back To Profile">
	</form>
	

</body>
</html>