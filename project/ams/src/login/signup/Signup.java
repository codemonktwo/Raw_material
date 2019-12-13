package login.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbConnection.ProvideConnection;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private Connection con=null;
	private static final long serialVersionUID = 1L;
    private String insertQuery=null;
    Statement entryStatement=null;

    String fname="";
    String lname="";
    String regno="";
    String email="";
    String password="";
    String rPassword="";
    String isPerson="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        con=ProvideConnection.getCon();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		fname=request.getParameter("fname");
        fname=fname.toUpperCase();
        lname=request.getParameter("lname");
        lname=lname.toUpperCase();
        regno=request.getParameter("registrationNumber");
        regno=regno.toUpperCase();
        email=request.getParameter("email");
        password=request.getParameter("password");
        rPassword=request.getParameter("rPassword");
        isPerson=request.getParameter("isPerson");
        // for clear cache
        //response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        try {
			//insert in to database
			if(isPerson.equals("Student"))
			{
		        insertQuery="insert into student(regno,FirstName,LastName ,email,password) values('"+regno+"','"+fname+"','"+lname+"','"+email+"','"+password+"');";
				entryStatement=con.createStatement();

				int count=entryStatement.executeUpdate(insertQuery);
				if(count>0)
				{
					request.setAttribute("fname", fname);
					request.setAttribute("lname", lname);
					request.setAttribute("email", email);
					request.setAttribute("regno", regno);
					RequestDispatcher rd=request.getRequestDispatcher("registerStudent.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else
				response.sendRedirect("alreadyRegister.jsp");
				entryStatement.close();
				con.close();
			}
			else
			{
				entryStatement=con.createStatement();
		        insertQuery="insert into Faculty(regid,FirstName,LastName ,email,password) values('"+regno+"','"+fname+"','"+lname+"','"+email+"','"+password+"');";
				//HttpSession session=request.getSession();
		        int count=entryStatement.executeUpdate(insertQuery);
				if(count>0)
				{
					request.setAttribute("firstname", fname);
					request.setAttribute("lastname", lname);
					request.setAttribute("email", email);
					request.setAttribute("regno", regno);
					try {
						request.getRequestDispatcher("registerTeacher.jsp").forward(request, response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else
				response.sendRedirect("alreadyRegister.jsp");
				entryStatement.close();
				con.close();

			}
	     } catch (SQLException|IOException e) {
				// TODO Auto-generated catch block
			try {
				
				response.sendRedirect("Signup.jsp");
			} catch (IOException e1) {
					 //TODO Auto-generated catch block
					e1.printStackTrace();
			}
		}
}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {

	}
}
