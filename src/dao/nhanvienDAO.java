package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.NhanVien;

public class nhanvienDAO {
	
	public ArrayList<NhanVien> getlistNhanVien() throws SQLException{
		
		Connection conn = DBconnect.getConnect();
		PreparedStatement stm = conn.prepareStatement("SELECT * FROM dbnguyenle.nhanvien;");
		ResultSet rs = stm.executeQuery();
		
		ArrayList<NhanVien> list = new ArrayList<>();
		while(rs.next()) {
			NhanVien nv = new NhanVien();
			nv.setMa_nhan_vien(rs.getString(1));
			nv.setTen_nhan_vien(rs.getString(2));
			nv.setTuoi(rs.getInt(3));
			nv.setQue_quan(rs.getString(4));
			
			list.add(nv);
		}
		
		//conn.close();
		return list;
		
	}

	public void ThemNhanVien(String manv, String ten, int tuoi, String que_quan) throws SQLException{
		Connection _conn = DBconnect.getConnect();
		String sql = "INSERT INTO dbnguyenle.nhanvien(ma_nv, tennv, tuoi, quequan) "
				+ "VALUES ('"+manv+"','"+ten+"',"+tuoi+",'"+que_quan+"');";
		PreparedStatement stm = _conn.prepareStatement(sql);
		stm.executeUpdate();
		_conn.close();
	}
	
	
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub

		nhanvienDAO da = new nhanvienDAO();
	
		//da.ThemNhanVien("nv005","Tuấn KT", 35, "Hà Nội");
		//da.ThemNhanVien();
		
		for(NhanVien d: da.getlistNhanVien()) {
			System.out.println(d.getMa_nhan_vien()+" "+d.getTen_nhan_vien()+"  "+d.getTuoi()+"  "+d.getQue_quan());
		}	
		
	}

}
