package connect;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DBconnect {
	
	//static Connection con = null;
	static PreparedStatement stm = null;
	static ResultSet rs = null;
	
    private static String DB_URL = "jdbc:mysql://localhost:3306/dbnguyenle";
    private static String USER_NAME = "root";
    private static String PASSWORD = "123456";
    
    private static String DB_URL1 = "http://sql43.hostinger.vn/phpmyadmin/index.php?db=u450627063_nl&token=af46b9272a4369e046cfbbb867c07570";
    private static String USER_NAME1 = "u450627063_root";
    private static String PASSWORD1 = "7tAiSu3EQ3Qs";

	
	public static Connection getConnect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection(DB_URL,USER_NAME,PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return con;		
	}
	
	
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		DBconnect db = new DBconnect();
		System.out.println(db.getConnect());
		//db.getConnect();
		//db.selectDB("select * from data");
	}

}
