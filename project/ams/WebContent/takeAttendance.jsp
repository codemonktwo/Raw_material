<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="dbConnection.ProvideConnection"%>


<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Attendance-AMS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
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
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo-1.css">
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <div style="padding: 22px;">
         				
					<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle mr-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						<ul class="nav navbar-nav flex-nowrap ml-auto">
							<div class="d-none d-sm-block topbar-divider"></div>
							<li role="presentation" class="nav-item dropdown no-arrow">
								<div class="nav-item dropdown no-arrow">
									<a data-toggle="dropdown" aria-expanded="false"
										class="dropdown-toggle nav-link" href="#"><span
										class="d-none d-lg-inline mr-2 text-gray-600 small"><%=session.getAttribute("firstname")%></span><img
										class="border rounded-circle img-profile"
										src="assets/img/avatars/avatar5.jpeg" /></a>
									<div role="menu"
										class="dropdown-menu shadow dropdown-menu-right animated--grow-in">
										<div class="dropdown-divider"></div>
										<a role="presentation" class="dropdown-item" href="Logout"
											method="post" value="logout"><i
											class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</nav>
            <h3 class="text-center" style="padding: 6px;">Attendance</h3>
 			<form action="takeAttendance.jsp">
 			<div class="col-sm-4 col-md-4">
				<label>Subject<select id="subject" name="subject" class="form-control" 
					><optgroup>
							<%
									session=request.getSession();
									String regid=(String)session.getAttribute("regno");
									String query="select subject,attendance_table,course,branch,semester from subject_assigned_to_faculty where regid='"+regid+"';";
									Connection con = ProvideConnection.getCon();
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery(query);
									ArrayList<String> assignSubject=new ArrayList<String>();
									int i=0;
									while(rs!=null&&rs.next())
									{
										String subject = rs.getString(1);
										String course=rs.getString(3);
										String branch=rs.getString(4);
										String semester=rs.getString(5);
										String table=rs.getString(2);
										Statement stSubject=con.createStatement();
										ResultSet sub=stSubject.executeQuery("select subjectname from subjects where subjectid='"+subject+"';");
										sub.next();
										String subjectName=sub.getString(1);
										assignSubject.add(table);
										String opt=null;
										if(course.equals("mca"))
										opt=subjectName+" "+course+" "+semester;
										else
										opt=subjectName+" "+course+" "+branch+" "+semester;
										out.println("<option value=\""+i+"\">"+opt+"</option>");
										i++;
									}
									session.setAttribute("list", assignSubject);
							%>
						</optgroup>
						</select>
						</label>
						<input type="submit" name="submit" value="Student List">
			</div>
 			</form>
 			<form action="TakeAttendance" method="post">
             <div class="table-responsive">
                <table class="table">
                    <thead class="text-center">
                        <tr class="text-center">
                            <th>Registration No &nbsp;</th>
                            <th>Student Name &nbsp;</th>
                            <th>Present/Absent &nbsp;</th>
                        </tr>
                        <%	
                        	ArrayList<String>  al=(ArrayList<String>)session.getAttribute("list");
                        	String sub=request.getParameter("subject");
                        	if(al!=null&&sub!=null)
                        	{
                        		int pos=Integer.parseInt(request.getParameter("subject"));
                        		String table=al.get(pos);
                        		//System.out.println(table);
                        		Statement s=con.createStatement();
                        		ResultSet stList=s.executeQuery("select regno ,name from "+table+";");
                        		ArrayList<String> regNoList=new ArrayList<String>();
                        		while(stList.next())
                        		{
                        			String regno=stList.getString(1);
                        			String name=stList.getString(2);
                        			regNoList.add(regno);
                        			out.println("<tr><td>"+regno+"</td><td>"+name+"</td><td><input type=\"checkbox\" name=\""+regno+"\"></td></tr>");
                        		}
                        		session.removeAttribute("list");
								session.setAttribute("table",table);
                        		session.setAttribute("list", regNoList);
                        	}
                        	al=null;
							con.close();
							st.close();
                        	%>
                    </thead>
            </table>
            </div>
        		<div class="col-sm-3 col-md-3">
					<input type="submit" name="submit" value="SAVE">
				</div>
        		
            </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Navbar---Apple.js"></script>
    <script src="assets/js/Profile-Edit-Form.js"></script>
</body>

</html>