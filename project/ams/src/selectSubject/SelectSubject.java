package selectSubject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbConnection.ProvideConnection;

/**
 * Servlet implementation class SelectSubject
 */
@WebServlet("/SelectSubject")
public class SelectSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=ProvideConnection.getCon();
	public SelectSubject() {
        super();
    }
    protected void assignSubjectToFaculty(String course,String branch,String semester,String regid,String subject,HttpServletRequest request,HttpServletResponse response)
    {
		String attendance_table_name=null;
		String subjectId=null;
		String createAttendanceTableQuery=null;
		Statement st=null;
		RequestDispatcher rd=null;
		try {
			//--------------------------------------------------------------------------------------------
			st=con.createStatement();
			//query for fetching subject id from subjects table
			ResultSet rs=st.executeQuery("select subjectid from subjects where subjectname='"+subject+"';");
			while(rs.next())
				subjectId=rs.getString(1);
			//---------------------------------------------------------------------------
			String updateQuery="update "+course+branch+" set faculty_id='"+regid+"' where faculty_id is null and subjectId='"+subjectId+"';";
			st=con.createStatement();
			int row=st.executeUpdate(updateQuery);               //update update course wise table with teacher id (table name for mca is mca and btech is btech_id etc)
			if(row==0)
			{
				try {
					request.getRequestDispatcher("alreadyAssigned.jsp").forward(request, response);
					//response.sendRedirect("");
				} catch (ServletException |IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try{
		//-----------------------------------------------------------------------------------------------------------------------------
			attendance_table_name=course+branch+regid+subjectId; // create  attendance table with name branch+teacher_regid+subject id
			String insertQuery="insert into subject_assigned_to_faculty values('"+regid+"','"+subjectId+"','"+attendance_table_name+"','"+course+"','"+branch+"','"+semester+"');";
			st=con.createStatement();
			int c=st.executeUpdate(insertQuery);
				if(c==0)
					{
						try {
							request.getRequestDispatcher("alreadyAssigned.jsp").forward(request, response);
							//response.sendRedirect("");
						} catch (ServletException |IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
			}
			catch(SQLException e)
			{
				System.out.println(e);
				e.printStackTrace();
			}
				//----------------------------------------------------------------------------------------------------------------
			try{	
				createAttendanceTableQuery="create table "+attendance_table_name+" (regno varchar(10) primary key,name varchar(40) ,Total integer,Present integer);";
				st.executeUpdate(createAttendanceTableQuery);
			}
			catch(SQLException e)
			{
				System.out.println(e);
				e.printStackTrace();
		}
			try{
				System.out.println(branch+" "+semester);
				String studentListQuery="select regno ,firstname,lastname from student where course='"+course+"' and branch='"+branch+"' and semester='"+semester+"';";
				st=con.createStatement();
				ResultSet rs=st.executeQuery(studentListQuery);
				//System.out.println(rs.getString(1)+" "+rs.getString(2));
				while(rs.next())
				{
					String regno=rs.getString(1);
					String name=rs.getString(2)+" "+rs.getString(3);
					String insertInAttendance="insert into "+attendance_table_name+" values('"+regno+"','"+name+"','0','0');";
					st=con.createStatement();
					st.executeUpdate(insertInAttendance);
				}
				st.close();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
    	try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String course=(String)session.getAttribute("course");
		String branch=(String)session.getAttribute("branch");
		String semester=(String)session.getAttribute("semester");
		String regid=(String)session.getAttribute("regno");
		if(regid==null)
			response.sendError(1);
		String subject =null;
		subject=request.getParameter("subject");
		session.setAttribute("subject", subject);

		//out.println(course+" "+branch+" "+semester+" "+subject+" "+regid);

		//		out.println(course+" "+branch+" "+semester+" "+subject);
		assignSubjectToFaculty(course,branch,semester,regid,subject,request,response);
    	try {
			request.getRequestDispatcher("subjectSelectedSuccess.jsp").forward(request, response);
		} catch (ServletException |IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }

}
