package register;

import java.io.IOException;
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

/**
 * Servlet implementation class UpdateProfileStudent
 */
@WebServlet("/UpdateProfileStudent")
public class UpdateProfileStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateProfileStudent() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=ProvideConnection.getCon();
		String regno=request.getParameter("regno");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobileno");
		String address=request.getParameter("address");
		String semester=request.getParameter("semester");
		HttpSession session=null;
		Statement st=null;
		try {
			   st=con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String updateQuery="update student set MobileNo='"+mobile+"',email='"+email+"',Address='"+address+"' where RegNo='"+regno+"';";
		try {
			st.executeUpdate(updateQuery);
			session=request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("address",address);
			session.setAttribute("mobileno", mobile);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("profile.jsp");
	}

}
