package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.mysql.jdbc.Connection;

import connect.DBconnect;
import model.PhieuChamCong;

public class XuLyChucNang {
	

	public ArrayList<String> ChuoiGiaTri(String ip) {
		
		ArrayList<String> list = new ArrayList<String>();
		
		String[] array = ip.split("\\[");
		
		for(String l: array) {
			list.add(l);
		}
		
		return list;
	}
	
	public int id_phieu_cc() throws SQLException {
		
		PhieuChamCongDAO pccd = new PhieuChamCongDAO();
		
		ArrayList<PhieuChamCong> listcc = pccd.getlistPhieuChamCong();
		
		Collections.sort(listcc, new Comparator<PhieuChamCong>() {

			@Override
			public int compare(PhieuChamCong o1, PhieuChamCong o2) {
				// TODO Auto-generated method stub
				return o2.get_idPhieuChamCong()-o1.get_idPhieuChamCong();	// sắp xếp từ lớn đến nhỏ
			}

		});
		
		int i=0;
		
		for(PhieuChamCong li: listcc) {
			i = li.get_idPhieuChamCong();	// lấy giá trị đầu tiên tức là max
			break;
		}
		
		return i+1;
	}
	
	public String DD_Date(String ip) {	 // định dạng lại dd/mm/yyyy
		String result = "";
		String[] cut = ip.split("-");
		
		result = cut[2] + "/" + cut[1] + "/" + cut[0];
		
		return result;
		
	}
	
	public String text_lamdem(String ip) {
		if(ip.equals("1")){
			return "có";
		}
		else {
			return " ";
		}		
	}
	
	public String KiemTraQuyenEdit(int id) throws SQLException {
		Connection con = DBconnect.getConnect();
		String sql = "SELECT \r\n" + 
				"    NguoiCham\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.phieuchamcong\r\n" + 
				"WHERE\r\n" + 
				"	idPhieuChamCong = "+id+"";
		PreparedStatement stm = con.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		String _name = "";
		while(rs.next()) {
			_name = rs.getString(1);
			break;
		}
		
		return _name;
	}

	public String KiemTraGio(String ip) {	
		if(ip.equals(""))
			return "-";
		else 
			return ip.substring(0,5);
	}

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		XuLyChucNang xl = new XuLyChucNang();
		//xl.ChuoiGiaTri("2019-4-2|Hải, Hải, Hải|kho setup tại ks sheraton|15:00|19:00[2019-4-10|Hùng, Hùng, Hùng|setup tại ks pan|15:00|19:00[");
		//System.out.println(xl.DD_Date("2019-6-16"));
		System.out.println(xl.KiemTraQuyenEdit(31));
	}

}
