<%@page import="dao.XuLyChucNang"%>
<%@page import="dao.TaiKhoanDAO"%>
<%@page import="model.PhieuChamCong"%>
<%@page import="dao.PhieuChamCongDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="connect.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Xem chi tiết công</title>
<style>
	body{
	
	}

  h1{
  	color: orange;
  	text-align: center;
  	font-family: tahoma;
  }
  h3{
  	font-family: tahoma;
  }
  b{
  	color: blue;
  	margin-left: 10px;
  	font-family: tahoma;
  }
</style>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
<link rel="stylesheet" type="text/css" href="css/button.css">
</head>
<body>

	<%
		  TaiKhoanDAO tkd = new TaiKhoanDAO();
	
		  //String user = ((User_login) request.getAttribute("user_login")).getUsername();
		  //String pass = ((User_login) request.getAttribute("user_login")).getPassword();
		  String user = (String)session.getAttribute("_user");
		  
		  String name = tkd.LayTenLogin(user);
		  String Quyen = "Người chấm công";
		  
	%>	

	<div id="menu" style="height: 60px;">
			<a  href="Admin_index.jsp" class="myButton">Trang chủ</a>
			<a  style="float: right; " href="logout.jsp" class="tsx">Đăng xuất</a>
			<a style="float: right; margin-top: 11px;"><%=name %> |<%=Quyen %> | </a>
	</div>

	<%
		int id = Integer.parseInt(request.getParameter("u"));
		Connection cn = DBconnect.getConnect();
		String sql = "SELECT \r\n" + 
				"    pcc.TenSuKien,\r\n" + 
				"    pcc.NgayDienRaSuKien,\r\n" + 
				"    pcc.ThoiGianSetup,\r\n" + 
				"    pcc.LoaiSuKien,\r\n" + 
				"    cctp.ngay_cham,\r\n" + 
				"    cctp.nhan_su,\r\n" + 
				"    cctp.cong_viec,\r\n" + 
				"    cctp.thoi_gian_batdau,\r\n" + 
				"    cctp.thoi_gian_xong,\r\n" + 
				"    cctp.lamdem2124,\r\n" + 
				"    cctp.lamdem06,\r\n" + 
				"    cctp.ghichu\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.chamcong_theophieu cctp,\r\n" + 
				"    dbnguyenle.phieuchamcong pcc\r\n" + 
				"WHERE\r\n" + 
				"    cctp.idPhieuChamCong = pcc.idPhieuChamCong\r\n" + 
				"        AND cctp.idPhieuChamCong = '"+id+"'";
		PreparedStatement stm = cn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		PhieuChamCongDAO pccd = new PhieuChamCongDAO();
		String a="",b="",c="",d="", e="";
		for(PhieuChamCong li: pccd.getlistPhieuChamCong()){
			if(li.get_idPhieuChamCong()==id){
				a=li.get_TenSuKien();
				b=li.get_NgayDienRaSuKien();
				c=li.get_ThoiGianSetup();
				d=li.get_LoaiSuKien();
				e=li.get_NguoiChamCong();
			}
		}
		
	%>
	<h1>PHIẾU CHẤM CÔNG BỘ PHẬN KỸ THUẬT NGUYỄN LÊ</h1>
	<h3 style="float: right;">Người chấm công:<b><%=e.toUpperCase() %></b> </h3>
	<h3>Tên sự kiện:<b><%=a.toUpperCase() %></b> </h3>
	<h3>Ngày diễn ra sự kiện:<b><%=b.toUpperCase() %></b> </h3>
	<h3>Thời gian setup:<b><%=c.toUpperCase() %></b> </h3>
	<h3>Loại sự kiện:<b><%=d.toUpperCase() %></b> </h3>

	<table class="_table" >
            <thead>
              <tr>
                <th>Ngày</th>
                <th>Tên nhân sự thực hiện</th>
                <th>Công việc thực hiện</th>
                <th>Thời gian từ</th>
                <th>Thời gian đến</th>
                <th>21h-24h</th>
                <th>0h-6h</th>
                <th>Ghi chú</th>
              </tr>
            </thead>
			<%
			XuLyChucNang xl = new XuLyChucNang();
			while(rs.next()){ ;%>
          <tbody>
            <tr style="font-weight: bold;">
                <td><%=xl.DD_Date(rs.getString(5)) %></td>
                <td><%=rs.getString(6) %></td>
                <td style="white-space: pre; text-align: left;"><%=rs.getString(7) %></td>
                <td><%=rs.getString(8).substring(0,5) %></td>
                <td><%=rs.getString(9).substring(0,5) %></td>
                <td><%=xl.text_lamdem(rs.getString(10)) %></td>
                <td><%=xl.text_lamdem(rs.getString(11)) %></td>
                <td><%=rs.getString(12) %></td>
            </tr>
          </tbody>
          
          <% } %>
	</table>
</body>
</html>
