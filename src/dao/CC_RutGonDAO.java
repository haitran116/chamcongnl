package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.CC_RutGon;

public class CC_RutGonDAO {

	public ArrayList<CC_RutGon> GetlistChamCong_RutGon(String name, int mount) throws SQLException{
		
		ArrayList<CC_RutGon> list = new ArrayList<>();
		ArrayList<CC_RutGon> list_fn = new ArrayList<>();
		Connection conn = DBconnect.getConnect();
		String sql = "SELECT \r\n" + 
				"    cctp.idPhieuChamCong,\r\n" + 
				"    pcc.NgayGuiPhieu,\r\n" + 
				"    pcc.NguoiCham,\r\n" + 
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
				"cctp.nhan_su like '%"+name+"%'" +
				"AND MONTH(ngay_cham) = "+mount+"";
		PreparedStatement stm = conn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		
		while(rs.next()) {
			CC_RutGon rg = new CC_RutGon();
			rg.setId(rs.getInt(1));
			rg.setNgayGuiPhieu(rs.getString(2));
			rg.setNguoiCham(rs.getString(3));
			rg.setTensk(rs.getString(4));
			rg.setNgaydienrask(rs.getString(5));
			rg.setThoigiansetup(rs.getString(6));
			rg.setLoaisk(rs.getString(7));
			rg.setNgaycham(rs.getString(8));
			rg.setNhansu(rs.getString(9));
			
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
			id_KoTrung.add(rs1.getInt(1)); // lấy được id không trùng
		}
		
		for(int a: id_KoTrung) {
			for(CC_RutGon li: list) {
				if(a==li.getId()) {
					//System.out.println(li.getId());
					CC_RutGon rg1 = new CC_RutGon();
					rg1.setId(li.getId());
					rg1.setNgayGuiPhieu(li.getNgayGuiPhieu());
					rg1.setNguoiCham(li.getNguoiCham());
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
		
		Collections.sort(list_fn, new Comparator<CC_RutGon>() { // sắp xếp từ mới nhất lên đầu 

			@Override
			public int compare(CC_RutGon o1, CC_RutGon o2) {
				// TODO Auto-generated method stub
				return o2.getId()-o1.getId();
			}
			
		});
							
		return list_fn;
	}
	
	public ArrayList<CC_RutGon> GetlistCC_Admin(int mount) throws SQLException{
		ArrayList<CC_RutGon> list = new ArrayList<>();
		ArrayList<CC_RutGon> list_fn = new ArrayList<>();
		Connection conn = DBconnect.getConnect();
		String sql = "SELECT \r\n" + 
				"    cctp.idPhieuChamCong,\r\n" + 
				"    pcc.NgayGuiPhieu,\r\n" + 
				"    pcc.NguoiCham,\r\n" + 
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
				"        AND MONTH(ngay_cham) = "+mount+"";
		PreparedStatement stm = conn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		
		while(rs.next()) {
			CC_RutGon rg = new CC_RutGon();
			rg.setId(rs.getInt(1));
			rg.setNgayGuiPhieu(rs.getString(2));
			rg.setNguoiCham(rs.getString(3));
			rg.setTensk(rs.getString(4));
			rg.setNgaydienrask(rs.getString(5));
			rg.setThoigiansetup(rs.getString(6));
			rg.setLoaisk(rs.getString(7));
			rg.setNgaycham(rs.getString(8));
			rg.setNhansu(rs.getString(9));
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
					rg1.setNgayGuiPhieu(li.getNgayGuiPhieu());
					rg1.setNguoiCham(li.getNguoiCham());
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
		
		Collections.sort(list_fn, new Comparator<CC_RutGon>() { // sắp xếp từ mới nhất lên đầu 

			@Override
			public int compare(CC_RutGon o1, CC_RutGon o2) {
				// TODO Auto-generated method stub
				return o2.getId()-o1.getId();
			}
			
		});
							
		return list_fn;		
	}
	
	public static void main(String[] args) throws SQLException  {
		
		CC_RutGonDAO c = new CC_RutGonDAO();
		for(CC_RutGon li: c.GetlistCC_Admin(11)) {
			System.out.println(li.getId());
		}
	}
}
