package login.signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import dbConnection.ProvideConnection;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String uname=null;
    private String password=null;
    private Connection con=null;
    Statement queryStatement=null;
    ResultSet result=null;
    PrintWriter out=null;
    static HttpSession session=null;
    private String query=null;
    public Login() {
        super();
        con=ProvideConnection.getCon();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    }

	/**
	 * @throws SQLException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    private static void getStudentData(ResultSet rs,HttpServletRequest request,ServletResponse response) throws SQLException
    {
    	rs.next();
    	session.setAttribute("firstname", rs.getString(1));
    	session.setAttribute("lastname", rs.getString(2));
    	session.setAttribute("email", rs.getString(3));
    	if(rs.getString(5)==null)
    	{
			try {
				request.getRequestDispatcher("registerStudent.jsp").forward(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	session.setAttribute("fathername", rs.getString(5));
    	session.setAttribute("mothername",rs.getString(6));
    	session.setAttribute("address", rs.getString(4));
    	session.setAttribute("mobileno", rs.getString(7));
    	session.setAttribute("courseShow",rs.getString(8)+"-"+rs.getString(10));
    	session.setAttribute("course", rs.getString(8));
    	session.setAttribute("branch", rs.getString(9));
    	session.setAttribute("semester", rs.getString(10));
    	session.setAttribute("dob", rs.getString(11));
    	//request.setAttribute("mobileno", rs.getString(7));
    	
    }
    protected void getTeacherData(ResultSet rs,HttpServletRequest request,HttpServletResponse response) throws SQLException
    {
    	rs.next();
    	session.setAttribute("firstname", rs.getString(1));
    	session.setAttribute("lastname", rs.getString(2));
    	session.setAttribute("email", rs.getString(3));
    	session.setAttribute("department", rs.getString(5));
    	if(rs.getString(5)==null||rs.getString(6)==null)
    	{
			try {
				request.getRequestDispatcher("registerTeacher.jsp").forward(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	session.setAttribute("address", rs.getString(4));
    	session.setAttribute("mobileno", rs.getString(6));
    	session.setAttribute("dob", rs.getString(7));    	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        out=response.getWriter();
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		uname=request.getParameter("regno");
		uname=uname.toUpperCase();
		password=request.getParameter("password");
		session=request.getSession();
		session.setAttribute("regno", uname);
		query="select *from student where regno='"+uname+"' and password='"+password+"';";
		try {
			queryStatement=con.createStatement();
			result=queryStatement.executeQuery(query);
			if(result.next())
			{
				out.println("inside1try");
				String query="select firstname,lastname ,email,address,fathername,mothername,mobileno,course,branch ,semester,dob from student where regno='"+uname+"';";
				result=queryStatement.executeQuery(query);
				try{
					getStudentData(result,request,response);
					con.close();
					queryStatement.close();
					RequestDispatcher rd=request.getRequestDispatcher("StudentProfile");
					rd.forward(request, response);
							//response.sendRedirect("StudentProfile");
				}
				catch(SQLException e)
				{
					out.println(e+"student");
					e.printStackTrace();
				}
			}
			else
			{
				query="select *from faculty where regid='"+uname+"' and password='"+password+"';";
				queryStatement=con.createStatement();
				result=queryStatement.executeQuery(query);
				if(result.next())
				{
					String query="select firstname,lastname ,email,address,department,mobileno,dob from faculty where regid='"+uname+"';";
					result=queryStatement.executeQuery(query);
					try{
						getTeacherData(result,request,response);
						con.close();
						queryStatement.close();
						RequestDispatcher rd=request.getRequestDispatcher("teacherProfile.jsp");
						rd.forward(request, response);
//								response.sendRedirect("profile.jsp");
					}
					catch(SQLException e)
					{
						out.println(e+"Teacher");
						e.printStackTrace();
					}					
				}
				else
					response.sendRedirect("login.html");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e+"error");
			response.sendRedirect("login.html");
			e.printStackTrace();
		}
		finally{
			try {
				queryStatement.close();
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

	}

}
