package register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbConnection.ProvideConnection;
@WebServlet("/TeacherRegister")
public class TeacherRegister extends HttpServlet {
    private Connection con=null;
    private Statement updateStatement=null;
    private String updateQuery=null;
    String fatherName=null;
    String department=null;
    String mobileNo=null;
    String address=null;
    String gender=null;
    String course=null;
    String sem=null;
    String dob=null;
    String regid=null;
    PrintWriter out=null;
    HttpSession session=null;
	private static final long serialVersionUID = 1L;
    public TeacherRegister() {
        super();
        con=ProvideConnection.getCon();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	out=response.getWriter();
		session=request.getSession();
		department=request.getParameter("department");
		mobileNo=request.getParameter("mobileno");
		address=request.getParameter("address");
		gender=request.getParameter("gender");
		regid=request.getParameter("regno");
		dob=request.getParameter("dob");
		//PrintWriter out=response.getWriter();			
		updateQuery="update faculty set MobileNo='"+mobileNo+"',Department='"+department+"',DOB='"+dob+"',Gender='"+gender+"',Address='"+address+"' where Regid='"+regid+"';";
		//execute query
		int c=0;
		try {
			updateStatement=con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println("create");
			e.printStackTrace();
		}
		try {
			c=updateStatement.executeUpdate(updateQuery);
			con.close();
			updateStatement.close();
		} catch (SQLException e) {
			out.println("exe"+e);
			e.printStackTrace();
		}
		finally{
			try {
				updateStatement.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(c>0)
		{
			response.sendRedirect("login.html");
			out.println("update_Successfully");
		}
		//	response.sendRedirect("profile.html");
	}

}


