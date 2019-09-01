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
  table,
  th,
  td {
    border: 2px solid black;
    border-collapse: collapse;
    margin: 0 auto;
    font-family: tahoma;
  }
  th{
  	background: green;
  }
  h1{
  	color: orange;
  	text-align: center;
  	font-family: tahoma;
  	text-decoration: underline;
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
		  String Quyen = "Nhân Viên";
		  
	%>	

	<div id="menu" style="height: 60px;">
			<a  href="TrangChu.jsp" class="myButton">Trang chủ</a>
			<a  href="ThemChamCong.jsp?u=<%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>" class="myButton">Chấm Công</a>
			<a  href="nhanvien_list.jsp" class="myButton">Nhân Viên</a>
			<a  href="chamcong.jsp" class="myButton">Thống kê Công</a>
			<a  style="float: right; " href="logout.jsp" class="tsx">Đăng xuất</a>
			<a style="float: right; margin-top: 11px;"><%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>|<%=Quyen %> | </a>
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
				"    cctp.thoi_gian_xong\r\n" + 
				"FROM\r\n" + 
				"    dbnguyenle.chamcong_theophieu cctp,\r\n" + 
				"    dbnguyenle.phieuchamcong pcc\r\n" + 
				"WHERE\r\n" + 
				"    cctp.idPhieuChamCong = pcc.idPhieuChamCong\r\n" + 
				"        AND cctp.idPhieuChamCong = "+id+"";
		PreparedStatement stm = cn.prepareStatement(sql);
		ResultSet rs = stm.executeQuery();
		PhieuChamCongDAO pccd = new PhieuChamCongDAO();
		String a="",b="",c="",d="";
		for(PhieuChamCong li: pccd.getlistPhieuChamCong()){
			if(li.get_idPhieuChamCong()==id){
				a=li.get_TenSuKien();
				b=li.get_NgayDienRaSuKien();
				c=li.get_ThoiGianSetup();
				d=li.get_LoaiSuKien();
			}
		}
		
	%>
	<h1>PHIẾU CHẤM CÔNG BỘ PHẬN KỸ THUẬT NGUYỄN LÊ</h1>
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
			while(rs.next()){ ;%>
          <tbody>
            <tr>
                <td><%=rs.getString(5) %></td>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                <td><%=rs.getString(9) %></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
          </tbody>
          
          <% } %>
	</table>
</body>
</html>
