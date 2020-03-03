package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.ChamCong;

public class chamcongDAO {
	
	public ArrayList<ChamCong> getlistChamCong() throws SQLException{
		
		Connection conn = DBconnect.getConnect();
		PreparedStatement stm = conn.prepareStatement("SELECT * FROM dbnguyenle.chamcong_theophieu");
		ResultSet rs = stm.executeQuery();
		
		ArrayList<ChamCong> list = new ArrayList<>();
		while(rs.next()) {
			ChamCong cc = new ChamCong();
			cc.setId_cham_cong(rs.getInt(1));
			cc.setId_Phieu_Cham_Cong(Integer.parseInt(rs.getString(2)));
			cc.setNgay_cham(rs.getDate(3).toString());
			cc.setNhan_su(rs.getString(4));
			cc.setCong_viec(rs.getString(5));
			cc.setThoi_gian_batdau(rs.getTime(6).toString());
			cc.setThoi_gian_xong(rs.getTime(7).toString());
			cc.setLam_dem_2124(rs.getInt(8));
			cc.setLam_dem_06(rs.getInt(9));
			cc.setGhi_chu(rs.getTime(10).toString());
			list.add(cc);
		}
		
		return list;
		
	}

	
	public ArrayList<ChamCong> nguoi_tra(String ten) throws SQLException { // tra theo tên người 

		ArrayList<ChamCong> listKQ = new ArrayList<>();
		
		for(ChamCong xx: getlistChamCong()) {
			if(xx.getNhan_su().toLowerCase().matches(".*"+ten.toLowerCase()+".*")) {
				listKQ.add(xx);
			}
		}
		
		return listKQ;
	}

	public void ThemChamCong(int idphieu, String date, String nhansu, String congviec, String timeBD, String timeEnd, int lamdem2124, int lamdem06, String ghichu) throws SQLException {
		Connection con = DBconnect.getConnect();
		String sql = "INSERT INTO dbnguyenle.chamcong_theophieu (idPhieuChamCong, ngay_cham, nhan_su, cong_viec, thoi_gian_batdau, thoi_gian_xong, lamdem2124, lamdem06, ghichu) "
				+ "VALUES ("+idphieu+",'"+date+"','"+nhansu+"', '"+congviec+"', '"+timeBD+"', '"+timeEnd+"', '"+lamdem2124+"', '"+lamdem06+"', '"+ghichu+"')";
		PreparedStatement stm = con.prepareStatement(sql);
		stm.executeUpdate();
		con.close();
	}
	
	public void SuaChamCong(int idSua, int id, String date, String nhansu, String congviec, String timeBD, String timeEnd) throws SQLException {
		Connection con = DBconnect.getConnect();

		String sql = "UPDATE dbnguyenle.chamcong_theophieu "
				+ "SET `idPhieuChamCong` = '"+id+"', `ngay_cham` = '"+date+"', `nhan_su` = '"+nhansu+"', `cong_viec` = '"+congviec+"', `thoi_gian_batdau` = '"+timeBD+"', `thoi_gian_xong` = '"+timeEnd+"' "
				+ "WHERE (`idPhieuChamCong` = '"+idSua+"');";
		
		PreparedStatement stm = con.prepareStatement(sql);
		stm.executeUpdate();
		con.close();
	}
	
	public void XoaChamXong(int id) throws SQLException {
		Connection conn = DBconnect.getConnect();
		String sql = "DELETE FROM dbnguyenle.chamcong_theophieu WHERE idPhieuChamCong = '"+id+"'";
		String sql1 = "DELETE FROM dbnguyenle.phieuchamcong WHERE idPhieuChamCong = '"+id+"'";
		PreparedStatement stm = conn.prepareStatement(sql);
		PreparedStatement stm1 = conn.prepareStatement(sql1);
		stm.executeUpdate();
		stm1.executeUpdate();
		conn.close();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//chamcongDAO cc = new chamcongDAO();
		//cc.SuaChamCong(8, 99, "2019-4-4", "Toàn", "XXXX", "16:00", "21:00");

		
	}

}
