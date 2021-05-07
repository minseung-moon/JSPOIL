package DBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			System.out.println("successed connection");
		}catch(ClassNotFoundException e){
			System.out.println("error not found driver");
		}catch(SQLException e){
			System.out.println("error connection");
		}
		
		return con;
	}
	
//	public static void main(String[] args) {
//		DBConn.getConnection();
//	}
}
