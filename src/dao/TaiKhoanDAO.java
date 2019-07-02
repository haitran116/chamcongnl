package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.TaiKhoan;

public class TaiKhoanDAO {
	
	public ArrayList<TaiKhoan> GetListTaiKhoan() throws SQLException{
		
		Connection conn = DBconnect.getConnect();
		PreparedStatement stm = conn.prepareStatement("SELECT * FROM dbnguyenle.taikhoan;");
		ResultSet rs = stm.executeQuery();
		
		ArrayList<TaiKhoan> list = new ArrayList<>();
		while(rs.next()) {
			TaiKhoan tk = new TaiKhoan();
			tk.setMaNV(rs.getString(1));
			tk.setUser(rs.getString(2));
			tk.setPass(rs.getString(3));
			tk.setQuyen(rs.getString(4));
			list.add(tk);
		}
		
		//conn.close();
		return list;
		
	}
	
	public int KiemTraDangNhap(String user, String pass) throws SQLException {
		Connection conn = DBconnect.getConnect();
		String sql = "SELECT COUNT(*) FROM dbnguyenle.taikhoan "
				+ "WHERE User = N'"+user+"' "
				+ "AND Pass = N'"+pass+"'";
		PreparedStatement stm = conn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		while(rs.next()) {
			if(rs.getInt(1)==1) 
				return 1;
		}
		return 0;
	}
	
	public int XemQuyen(String user, String pass) throws SQLException {
		Connection conn = DBconnect.getConnect();
		String sql = "SELECT tk.Quyen FROM dbnguyenle.taikhoan tk WHERE User = N'"+user+"' AND Pass = N'"+pass+"'";
		PreparedStatement stm = conn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		while(rs.next()) {
			if(rs.getString(1).toLowerCase().trim().equals("1")) {
				return 1;
			}
		}
		return 0;
	}
	
	public String LayTenLogin(String ip) throws SQLException {
		Connection conn = DBconnect.getConnect();
		String maNV = "";
		
		String sql = "SELECT \r\n" + 
				"    dbnguyenle.taikhoan.ma_nv\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.taikhoan\r\n" + 
				"WHERE\r\n" + 
				"    User = N'"+ip+"'";
		PreparedStatement stm = conn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		while(rs.next()) {
			if(rs.getString(1)!=null) {
				maNV = rs.getString(1);
			}
		}
		
		String sql1 = "SELECT \r\n" + 
				"    nv.tennv\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.nhanvien nv\r\n" + 
				"WHERE\r\n" + 
				"    ma_nv = N'"+maNV+"'";
		PreparedStatement stm1 = conn.prepareStatement(sql1);
		ResultSet rs1 = stm1.executeQuery();
		while(rs1.next()) {
			if(rs1.getString(1)!=null) {
				return rs1.getString(1);
			}
		}
		return null;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TaiKhoanDAO tk = new TaiKhoanDAO();
		
		try {
			//System.out.println(tk.KiemTraDangNhap("hunghop", "123456"));
			//System.out.print(tk.XemQuyen("haitm", "123456"));
			System.out.println(tk.LayTenLogin("haitm"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
