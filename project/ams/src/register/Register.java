package register;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dbConnection.ProvideConnection;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Connection con=null;
    private Statement updateStatement=null;
    private String updateQuery=null;
    String fatherName=null;
    String motherName=null;
    String mobileNo=null;
    String address=null;
    String gender=null;
    String course=null;
    String branch=null;
    String sem=null;
    String dob=null;
    String regno=null;
    PrintWriter out=null;
    public Register() {
        super();
        con=ProvideConnection.getCon();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out=response.getWriter();
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		if(request.getParameter("submit")!=null)
		{
			fatherName=request.getParameter("fatherName");
			motherName=request.getParameter("motherName");
			mobileNo=request.getParameter("mobileno");
			address=request.getParameter("address");
			gender=request.getParameter("gender");
			course=request.getParameter("course");
			branch=request.getParameter("branch");
			sem=request.getParameter("semester");
			regno=request.getParameter("regno");
			dob=request.getParameter("dob");
			//PrintWriter out=response.getWriter();			
			updateQuery="update student set MobileNo='"+mobileNo+"',FatherName='"+fatherName+"',MotherName='"+motherName+"',DOB='"+dob+"',Gender='"+gender+"',Course='"+course+"',Semester='"+sem+"',Address='"+address+"',branch='"+branch+"' where RegNo='"+regno+"';";
			//execute query
			int c=0;
			try {
				updateStatement=con.createStatement();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				c=updateStatement.executeUpdate(updateQuery);
				con.close();
				updateStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(c>0)
			{
				response.sendRedirect("login.html");
				out.println("update_Successfully");
			}
			//	response.sendRedirect("profile.html");
		}
		else if(request.getParameter("cancel")!=null)
		{
			response.sendRedirect("login.jsp");
		}
	}
}
