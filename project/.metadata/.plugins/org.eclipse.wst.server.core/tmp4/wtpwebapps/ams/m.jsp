<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="dbConnection.*" %>

<html>
<h2>Select Languages:</h2>

<form ACTION="m.jsp">
<input type="checkbox" name="id" value="Java"> Java<BR>
<input type="checkbox" name="id" value=".NET"> .NET<BR>
<input type="checkbox" name="id" value="PHP"> PHP<BR>
<input type="checkbox" name="id" value="C/C++"> C/C++<BR>
<input type="checkbox" name="id" value="PERL"> PERL <BR>
<input type="submit" value="Submit">
</form>
<%

String select[] = request.getParameterValues("id"); 
if (select != null && select.length != 0) {
out.println("You have selected: ");
for (int i = 0; i < select.length; i++) {
out.println(select[i]); 
}
}
%>
</html>