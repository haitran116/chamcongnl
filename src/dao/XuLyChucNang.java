package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

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

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		XuLyChucNang xl = new XuLyChucNang();
		//xl.ChuoiGiaTri("2019-4-2|Hải, Hải, Hải|kho setup tại ks sheraton|15:00|19:00[2019-4-10|Hùng, Hùng, Hùng|setup tại ks pan|15:00|19:00[");
		try {
			System.out.println(xl.id_phieu_cc());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
