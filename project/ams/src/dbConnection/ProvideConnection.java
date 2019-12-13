package dbConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ProvideConnection {
	private static String url="jdbc:mysql://localhost:3306/ams?characterEncoding=latin1&useConfigs=maxPerformance";
	private static String uname="root";
	private static String password="Monu@123";
	public static Connection getCon()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		Connection con=null;
		try {
			con = DriverManager.getConnection(url,uname,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
