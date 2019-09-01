package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TaiKhoanDAO;
import model.User_login;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(); // tạo 1 user + pass xuyên suốt phiên login
		String _user = request.getParameter("uname");
		String _pass = request.getParameter("psw");
		
		TaiKhoanDAO tkd = new TaiKhoanDAO();
		
		try {
			if(tkd.KiemTraDangNhap(_user, _pass)==1)
			{
				//User_login ul = new User_login(_user, _pass);  // truyền một đối tượng user pass
				//request.setAttribute("user_login", ul);
				
				session.setAttribute("_user", _user);
				
				if(tkd.XemQuyen(_user, _pass)==0) {
					RequestDispatcher rd = request.getRequestDispatcher("/TrangChu.jsp");
					rd.forward(request, response);
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("/Admin_index.jsp");
					rd.forward(request, response);
				}
			}
			else {
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
