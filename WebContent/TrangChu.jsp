<%@page import="model.User_login"%>
<%@page import="dao.PhieuChamCongDAO"%>
<%@page import="dao.XuLyChucNang"%>
<%@page import="model.ChamCong"%>
<%@page import="dao.chamcongDAO"%>
<%@page import="dao.TaiKhoanDAO"%>
<%@page import="Servlet.Login"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trang Chủ</title>
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
		  String Quyen = "";
		  if(tkd.XemQuyen(request.getParameter("uname"), request.getParameter("psw"))==1)
				Quyen = "Admin";
			else
				Quyen = "Nhân Viên";
		  
	%>	

	<div id="menu">
			<a  href="TrangChu.jsp" class="myButton">Trang chủ</a>
			<a  href="ThemChamCong.jsp?u=<%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>" class="myButton">Chấm Công</a>
			<a  href="nhanvien_list.jsp" class="myButton">Nhân Viên</a>
			<a  href="chamcong.jsp" class="myButton">Thống kê Công</a>
			<a  style="float: right; " href="logout.jsp" class="tsx">Đăng xuất</a>
			<a style="float: right; margin-top: 11px;"><%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>|<%=Quyen %> | </a>
	</div>

	<table class="_table">
	<thead>
		<tr>
			<th>id</th>
		    <th>id phiếu</th>
		    <th>Ngày Chấm</th>
		    <th>Nhân sự</th>
		    <th>Công Việc</th>
		    <th>Thời gian st</th>
		    <th>Thời gian end</th>
		    <th></th>
		</tr>
	</thead>
	<tbody>
	<% 
		chamcongDAO ccd = new chamcongDAO();
		for(ChamCong li: ccd.nguoi_tra(name)){ %>
		<tr>
			<td><%=li.getId_cham_cong() %></td>
			<td><%=li.getId_Phieu_Cham_Cong() %></td>
			<td><%=li.getNgay_cham() %></td>
			<td><%=li.getNhan_su() %></td>
			<td><%=li.getCong_viec() %></td>
			<td><%=li.getThoi_gian_batdau() %></td>
			<td><%=li.getThoi_gian_xong() %></td>
			<td>
				<a style="color: yellow;" href="SuaChamCong.jsp?u=<%=li.getId_cham_cong() %>" class="tsx">Sửa</a>
				<a style="color: red;" href="XoaChamCong.jsp?u=<%=li.getId_cham_cong() %>"  class="tsx">Xóa</a>
			</td>
	</tr>
	<%} %>
	</tbody>
	</table>


</body>
</html>
