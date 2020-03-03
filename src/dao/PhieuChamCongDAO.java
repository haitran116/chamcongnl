package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.PhieuChamCong;

public class PhieuChamCongDAO {
	
	public ArrayList<PhieuChamCong> getlistPhieuChamCong() throws SQLException{
		
		Connection conn = DBconnect.getConnect();
		PreparedStatement stm = conn.prepareStatement("SELECT * FROM dbnguyenle.phieuchamcong;");
		ResultSet rs = stm.executeQuery();
		
		ArrayList<PhieuChamCong> list = new ArrayList<>();
		while(rs.next()) {
			PhieuChamCong pcc = new PhieuChamCong();
			pcc.set_idPhieuChamCong(rs.getInt(1));
			pcc.set_TenSuKien(rs.getString(2));
			pcc.set_LoaiSuKien(rs.getString(3));
			pcc.set_NgayDienRaSuKien(rs.getString(4));
			pcc.set_ThoiGianSetup(rs.getString(5));
			pcc.set_NguoiChamCong(rs.getString(6));
			pcc.set_NgayGuiPhieu(rs.getString(7));
			list.add(pcc);
		}
		
		return list;
		
	}
	
	public void ThemPhieuChamCong(int id, String tensukien, String loaisk, String ngaydienrask, String timesetup, String NguoiCham, String NgayGuiPhieu) throws SQLException {
		Connection con = DBconnect.getConnect();
		String sql = "INSERT INTO dbnguyenle.phieuchamcong VALUES ("+id+",'"+tensukien+"','"+loaisk+"', '"+ngaydienrask+"', '"+timesetup+"', '"+NguoiCham+"', '"+NgayGuiPhieu+"')";
		PreparedStatement stm = con.prepareStatement(sql);
		stm.executeUpdate();
		con.close();
	}
			

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		PhieuChamCongDAO t = new PhieuChamCongDAO();
		//t.ThemPhieuChamCong(3, "delta", "ATAS", "tối 9/6", "chiều 7/6");
		for(PhieuChamCong a: t.getlistPhieuChamCong())
			System.out.println(a.get_NguoiChamCong());

	}

}
