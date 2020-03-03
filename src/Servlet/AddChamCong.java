package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhieuChamCongDAO;
import dao.XuLyChucNang;
import dao.chamcongDAO;
import model.User_login;

/**
 * Servlet implementation class AddChamCong
 */
@WebServlet("/AddChamCong")
public class AddChamCong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddChamCong() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//String namelogin = request.getParameter("adapter_data_username");
		String data = request.getParameter("adapter_data_chamcong");
		//response.getWriter().print(data);
		
		chamcongDAO ccd = new chamcongDAO();
		PhieuChamCongDAO pccd = new PhieuChamCongDAO();			
		XuLyChucNang xlc = new XuLyChucNang();
		
		if(data!=null){
			for(String li: xlc.ChuoiGiaTri(data)){
				String[] arr = li.split("\\|");
				
				try {
					if(arr.length == 7) {
						ccd.ThemChamCong(xlc.id_phieu_cc(), 
								arr[0], 
								arr[1], 
								arr[2], 
								arr[3], 
								arr[4],
								Integer.parseInt(arr[5]),
								Integer.parseInt(arr[6]),
								" ");
					}
					else {
						ccd.ThemChamCong(xlc.id_phieu_cc(), 
								arr[0], 
								arr[1], 
								arr[2], 
								arr[3], 
								arr[4],
								Integer.parseInt(arr[5]),
								Integer.parseInt(arr[6]),
								arr[7]);
					}
				} catch (SQLException e) {
				}
			}
			
			try {
				Calendar c = Calendar.getInstance();
				String date = Integer.toString(c.get(Calendar.DAY_OF_MONTH)) + "/" 
						+ Integer.toString(c.get(Calendar.MONTH)+1) + "/"
						+ Integer.toString(c.get(Calendar.YEAR));
				
				pccd.ThemPhieuChamCong(xlc.id_phieu_cc(), 
							request.getParameter("txtTenSuKien"), 
							request.getParameter("txtLoaiSuKien"), 
							request.getParameter("txtNgayDRSK"), 
							request.getParameter("txtTimeSetup"),
							request.getParameter("NguoiChamcong"),
							date);
			} catch (SQLException e) {
			}
		}
		
		//User_login ul = new User_login();
		//ul.setUsername(namelogin);
		//request.setAttribute("user_login", ul);
		RequestDispatcher rd = request.getRequestDispatcher("/TrangChu.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
