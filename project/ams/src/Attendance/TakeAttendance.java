package Attendance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbConnection.ProvideConnection;

/**
 * Servlet implementation class TakeAttendance
 */
@WebServlet("/TakeAttendance")
public class TakeAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=ProvideConnection.getCon();
	HttpSession session=null;
    PreparedStatement pt=null;
    ResultSet rs=null;
    public TakeAttendance() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
		session=request.getSession();
		ArrayList<String> list=(ArrayList<String> )session.getAttribute("list");
		System.out.println("2 "+1+" ");
		String table=(String)session.getAttribute("table");
		String dateQuery="select curdate()+1-1";
		
		String date=null;
		try {
			pt=con.prepareStatement(dateQuery);
			rs=pt.executeQuery();
			rs.next();
			date=rs.getString(1);
			date=date+"D";
			String addColumn="alter table "+table+" add column "+date+" varchar(12);";
			pt=con.prepareStatement(addColumn);
			pt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(date+" "+1+" "+e);
			e.printStackTrace();
		}
		String query="";
		for(String regno : list)
		{
			try {
				if(request.getParameter(regno)!=null)
				query="update "+table+" set "+date+"='1' , present=present+1 , Total=Total+1 where regno='"+regno+"';";
				else 
				query="update "+table+" set "+date+"='0' , present=present+0 , Total=Total+1 where regno='"+regno+"';";
				PrintWriter out=response.getWriter();
				out.println(regno);
				pt=con.prepareStatement(query);
				pt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(2+" "+e);
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		try {
			con.close();
			pt.close();
			
			response.sendRedirect("teacherProfile.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
