package login.signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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
 * Servlet implementation class StudentProfile
 */
@WebServlet("/StudentProfile")
public class StudentProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public StudentProfile() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Connection con=ProvideConnection.getCon();
		String course=(String)session.getAttribute("course");
		String branch=(String)session.getAttribute("branch");
		String semester=(String)session.getAttribute("semester");
		String regno=(String)session.getAttribute("regno");
		System.out.println(branch+semester+regno);
		Statement st=null;
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e+"1");
			e.printStackTrace();
		}
		String attQuery="select subject,attendance_table from subject_assigned_to_faculty where course='"+course+"' and branch='"+branch+"' and semester='"+semester+"';";
		ResultSet rs=null;
		try {
			rs = st.executeQuery(attQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("resultsetNull");
			System.out.println(e+"2");

			e.printStackTrace();
		}
		try{
			int c=0;
			while(rs!=null&&rs.next())
			{
				String subjectId=(String)rs.getString(1);
				String table=(String)rs.getString(2);
				String subQuery="select subjectname from subjects where subjectid='"+subjectId+"';";
				Statement st1=con.createStatement();
				ResultSet sub=st1.executeQuery(subQuery);
				sub.next();
				String att="select *from "+table+" where regno='"+regno+"';";
				Statement st2=con.createStatement();
				ResultSet attList=st2.executeQuery(att);
				float count=0;
				attList.next();
				ResultSetMetaData rsmd=attList.getMetaData();
				int n=rsmd.getColumnCount();
				for(int i=3;i<=n;i++)
				{
					String status=(String)attList.getString(i);
					if(status.equals("1"))
						count++;
				}
				float per=(count*100)/(float)(n-2);
				c++;
				session.setAttribute("sub"+Integer.toString(c), sub.getString(1));
				session.setAttribute("subper"+Integer.toString(c), Float.toString(per));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			System.out.println(e+"3");

		}
		response.sendRedirect("profile.jsp");

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Connection con=ProvideConnection.getCon();
		String course=(String)session.getAttribute("course");
		String branch=(String)session.getAttribute("branch");
		String semester=(String)session.getAttribute("semester");
		String regno=(String)session.getAttribute("regno");
		System.out.println(branch+semester+regno);
		Statement st=null;
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e+"1");
			e.printStackTrace();
		}
		String attQuery="select subject,attendance_table from subject_assigned_to_faculty where course='"+course+"' and branch='"+branch+"' and semester='"+semester+"';";
		ResultSet rs=null;
		try {
			rs = st.executeQuery(attQuery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e+"2");

			e.printStackTrace();
		}
		try{
			int c=0;
			//System.out.println("resultsetNull");
			while(rs!=null&&rs.next())
			{
				String subjectId=(String)rs.getString(1);
				String table=(String)rs.getString(2);
				String subQuery="select subjectname from subjects where subjectid='"+subjectId+"';";
				Statement st1=con.createStatement();
				ResultSet sub=st1.executeQuery(subQuery);
				sub.next();
				table=table.toLowerCase();
				String att="select *from "+table+" where regno='"+regno+"';";
				Statement st2=con.createStatement();
				ResultSet attList=st2.executeQuery(att);
				float count=0;
				attList.next();
				ResultSetMetaData rsmd=attList.getMetaData();
				int n=rsmd.getColumnCount();
				for(int i=3;i<=n;i++)
				{
					String status=(String)attList.getString(i);
					if(status.equals("1"))
						count++;
				}
				float per=(count*100)/(float)(n-2);
				c++;
				session.setAttribute("sub"+Integer.toString(c), sub.getString(1));
				session.setAttribute("subper"+Integer.toString(c), Float.toString(per));
				//System.out.println("hii"+per);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			System.out.println(e+"3");

		}
		try {
			con.close();
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("profile.jsp");
		

	}

}
