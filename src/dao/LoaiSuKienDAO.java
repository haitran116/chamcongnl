package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.LoaiSuKien;
import model.NhanVien;

public class LoaiSuKienDAO {
	
	public ArrayList<LoaiSuKien> GetListLoaiSuKen() throws SQLException{
		Connection conn = DBconnect.getConnect();
		PreparedStatement stm = conn.prepareStatement("SELECT * FROM dbnguyenle.loaisukien;");
		ResultSet rs = stm.executeQuery();
		
		ArrayList<LoaiSuKien> list = new ArrayList<>();
		while(rs.next()) {
			LoaiSuKien lsk = new LoaiSuKien();
			lsk.setIdLoaiSK(rs.getInt(1));
			lsk.setLoaiSK(rs.getString(2));
			list.add(lsk);
		}
		
		//conn.close();
		return list;
	}

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		LoaiSuKienDAO lsk = new LoaiSuKienDAO();
		for(LoaiSuKien a: lsk.GetListLoaiSuKen()) {
			System.out.println(a.getIdLoaiSK()+"--"+a.getLoaiSK());
		}
	}

}
