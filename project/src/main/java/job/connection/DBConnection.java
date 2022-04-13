package job.connection;

import java.sql.*;

public class DBConnection 
{

	 public static Connection initialiseDatabase() throws ClassNotFoundException, SQLException
	 {
			String  driver = "com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/dizitalpods";
			String user="root";
			String pass="root";
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,user,pass);
		
		 return con; 
	 }
	
}