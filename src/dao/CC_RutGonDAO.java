package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.CC_RutGon;

public class CC_RutGonDAO {

	public ArrayList<CC_RutGon> GetlistChamCong_RutGon(String name) throws SQLException{
		
		ArrayList<CC_RutGon> list = new ArrayList<>();
		ArrayList<CC_RutGon> list_fn = new ArrayList<>();
		Connection conn = DBconnect.getConnect();
		String sql = "SELECT \r\n" + 
				"    cctp.idPhieuChamCong,\r\n" + 
				"    pcc.TenSuKien,\r\n" + 
				"    pcc.NgayDienRaSuKien,\r\n" + 
				"    pcc.ThoiGianSetup,\r\n" + 
				"    pcc.LoaiSuKien,\r\n" + 
				"    cctp.ngay_cham,\r\n" + 
				"    cctp.nhan_su\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.chamcong_theophieu cctp,\r\n" + 
				"    dbnguyenle.phieuchamcong pcc\r\n" + 
				"WHERE\r\n" + 
				"    cctp.idPhieuChamCong = pcc.idPhieuChamCong\r\n" + 
				"and\r\n" + 
				"cctp.nhan_su like '%"+name+"%'";
		PreparedStatement stm = conn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		
		while(rs.next()) {
			CC_RutGon rg = new CC_RutGon();
			rg.setId(rs.getInt(1));
			rg.setTensk(rs.getString(2));
			rg.setNgaydienrask(rs.getString(3));
			rg.setThoigiansetup(rs.getString(4));
			rg.setLoaisk(rs.getString(5));
			rg.setNgaycham(rs.getString(6));
			rg.setNhansu(rs.getString(7));
			list.add(rg);
		}
		
		String sql1 = "SELECT DISTINCT\r\n" + 
				"    cctp.idPhieuChamCong\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.chamcong_theophieu cctp,\r\n" + 
				"    dbnguyenle.phieuchamcong pcc\r\n" + 
				"WHERE\r\n" + 
				"    cctp.idPhieuChamCong = pcc.idPhieuChamCong\r\n" + 
				"        AND cctp.nhan_su LIKE '%"+name+"%'";
		
		PreparedStatement stm1 = conn.prepareStatement(sql1);
		ResultSet rs1 = stm1.executeQuery();
		
		ArrayList<Integer> id_KoTrung = new ArrayList<>();
		while(rs1.next()) {
			id_KoTrung.add(rs1.getInt(1));
		}
		
		for(int a: id_KoTrung) {
			for(CC_RutGon li: list) {
				if(a==li.getId()) {
					//System.out.println(li.getId());
					CC_RutGon rg1 = new CC_RutGon();
					rg1.setId(li.getId());
					rg1.setTensk(li.getTensk());
					rg1.setNgaydienrask(li.getNgaydienrask());
					rg1.setThoigiansetup(li.getThoigiansetup());
					rg1.setLoaisk(li.getLoaisk());
					rg1.setNgaycham(li.getNgaycham());
					rg1.setNhansu(li.getNhansu());
					list_fn.add(rg1);
					break;
				}
			}
		}
							
		return list_fn;
	}
	
	public ArrayList<CC_RutGon> GetlistCC_Admin() throws SQLException{
		ArrayList<CC_RutGon> list = new ArrayList<>();
		ArrayList<CC_RutGon> list_fn = new ArrayList<>();
		Connection conn = DBconnect.getConnect();
		String sql = "SELECT \r\n" + 
				"    cctp.idPhieuChamCong,\r\n" + 
				"    pcc.TenSuKien,\r\n" + 
				"    pcc.NgayDienRaSuKien,\r\n" + 
				"    pcc.ThoiGianSetup,\r\n" + 
				"    pcc.LoaiSuKien,\r\n" + 
				"    cctp.ngay_cham,\r\n" + 
				"    cctp.nhan_su\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.chamcong_theophieu cctp,\r\n" + 
				"    dbnguyenle.phieuchamcong pcc\r\n" + 
				"WHERE\r\n" + 
				"    cctp.idPhieuChamCong = pcc.idPhieuChamCong";
		PreparedStatement stm = conn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		
		while(rs.next()) {
			CC_RutGon rg = new CC_RutGon();
			rg.setId(rs.getInt(1));
			rg.setTensk(rs.getString(2));
			rg.setNgaydienrask(rs.getString(3));
			rg.setThoigiansetup(rs.getString(4));
			rg.setLoaisk(rs.getString(5));
			rg.setNgaycham(rs.getString(6));
			rg.setNhansu(rs.getString(7));
			list.add(rg);
		}
		
		String sql1 = "SELECT DISTINCT\r\n" + 
				"    cctp.idPhieuChamCong\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.chamcong_theophieu cctp,\r\n" + 
				"    dbnguyenle.phieuchamcong pcc\r\n" + 
				"WHERE\r\n" + 
				"    cctp.idPhieuChamCong = pcc.idPhieuChamCong\r\n";
		
		PreparedStatement stm1 = conn.prepareStatement(sql1);
		ResultSet rs1 = stm1.executeQuery();
		
		ArrayList<Integer> id_KoTrung = new ArrayList<>();
		while(rs1.next()) {
			id_KoTrung.add(rs1.getInt(1));
		}
		
		for(int a: id_KoTrung) {
			for(CC_RutGon li: list) {
				if(a==li.getId()) {
					//System.out.println(li.getId());
					CC_RutGon rg1 = new CC_RutGon();
					rg1.setId(li.getId());
					rg1.setTensk(li.getTensk());
					rg1.setNgaydienrask(li.getNgaydienrask());
					rg1.setThoigiansetup(li.getThoigiansetup());
					rg1.setLoaisk(li.getLoaisk());
					rg1.setNgaycham(li.getNgaycham());
					rg1.setNhansu(li.getNhansu());
					list_fn.add(rg1);
					break;
				}
			}
		}
							
		return list_fn;		
	}
	
	public static void main(String[] args)  {
		
		CC_RutGonDAO c = new CC_RutGonDAO();
		try {
			//System.out.println(c.GetlistChamCong_RutGon("Hải"));
			//System.out.println(c.GetlistCC_Admin());
			for(CC_RutGon li: c.GetlistCC_Admin()) {
				System.out.println(li.getId());
			}
		} catch (SQLException e) {
			System.out.println("loi");
		}
		
	}
}
