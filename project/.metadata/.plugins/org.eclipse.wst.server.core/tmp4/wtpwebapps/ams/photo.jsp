<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbConnection.ProvideConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%

			Statement st=null;
			Connection cn=null;
		%>
		<%

			cn=ProvideConnection.getCon();
			st=cn.createStatement();
			
		%>
		 
	<%
		try
		{

			String ImageFile="";
			String itemName="";
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);

			if (!isMultipart)
			{
			}
			else
			{
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List items = null;
				try
				{
					items = upload.parseRequest(request);
				}
				catch (FileUploadException e)
				{
					e.getMessage();
				}

				Iterator itr = items.iterator();

				while (itr.hasNext())
				{
					FileItem item = (FileItem) itr.next();

					if (item.isFormField())
					{
						String name = item.getFieldName();
						String value = item.getString();
						System.out.println("photot1");
						if(name.equals("ImageFile"))
						{
							ImageFile=value;
						}				 

					}
					else
					{
						try
						{
							itemName = item.getName();
							String path=null;
							path="/image/"+itemName;
							System.out.println(path);
							File savedFile = new File(path);
							item.write(savedFile);
						}
						catch (Exception e)
						{
						out.println("Error"+e.getMessage());
						}
					}
				}

		}
	}
	catch (Exception e){
	out.println(e.getMessage());
	}
	response.sendRedirect("photo1.jsp");
%>
<h1>Hello<h1>
</body>
</html>
