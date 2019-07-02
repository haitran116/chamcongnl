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
	
	
	public static Connection getConnect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dbnguyenle","root","123456");
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
		//DBconnect db = new DBconnect();
		//System.out.println(db.getConnect());
		//db.getConnect();
		//db.selectDB("select * from data");
	}

}
