package jdbc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	private static final String DB_DRIVER = "org.postgresql.Driver";
	private static final String DB_URL = "jdbc:postgresql://localhost:5432/many_to_many";
	private static final String DB_USER = "postgres";
	private static final String DB_PASSWORD = "root";
	
	public static Connection getConnection() {
		try {
			Class.forName(DB_DRIVER);
		}catch(ClassNotFoundException e) {
			System.out.println("Class not found "+e.getMessage());
		}
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		}catch(SQLException e) {
			System.out.println("Connection Error "+e.getMessage());
		}
		
		if(connection != null) {
			System.out.println("Connection is up and running !");
		}else {
			System.out.println("Connection is null ");
		}
		return connection;
	}
}
