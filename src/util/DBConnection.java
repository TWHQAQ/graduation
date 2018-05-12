package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static String username="root";
	private static String password="3140705236";
	private static String url="jdbc:mysql://localhost:3306/graduation_project?useSSL=false";
	public static Connection conn=null;
	private static String driver = "com.mysql.jdbc.Driver";
	
	public DBConnection(){
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,username,password);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException s){
			s.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		return conn;
	}
	
	public static void main(String[] args) {
		Connection conn=new DBConnection().getConnection();
		if(conn==null){
			System.out.println("Database connect default");
		}else{
			System.out.println("Database has connected");
		}
	}

}
