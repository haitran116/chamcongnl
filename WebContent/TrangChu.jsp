<%@page import="model.CC_RutGon"%>
<%@page import="dao.CC_RutGonDAO"%>
<%@page import="model.User_login"%>
<%@page import="dao.PhieuChamCongDAO"%>
<%@page import="dao.XuLyChucNang"%>
<%@page import="model.ChamCong"%>
<%@page import="dao.chamcongDAO"%>
<%@page import="dao.TaiKhoanDAO"%>
<%@page import="Servlet.Login"%>
<%@page import="connect.DBconnect"%>
<%@page import="java.sql.*"%>
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
<link rel="stylesheet" type="text/css" href="css/t.css">
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
	
	<table class="_table" style="margin-top: 5px; font-family: tahoma;">
	<thead>
		<tr>
			<th>ID</th>
		    <th>Tên sự kiện</th>
		    <th>Ngày diễn ra sự kiện</th>
		    <th>Thời gian setup</th>
		    <th>Loại sự kiện</th>
		    <th>Ngày chấm</th>
		    <th>Nhân sự</th>
		    <th></th>
		</tr>
	</thead>
	<tbody>
	<% 
		CC_RutGonDAO rgd = new CC_RutGonDAO();
		
		
		for(CC_RutGon li: rgd.GetlistChamCong_RutGon(name)) {
		%> 
					<tr>
						<td><%=li.getId() %></td>
						<td><%=li.getTensk() %></td>
						<td><%=li.getNgaydienrask() %></td>
						<td><%=li.getThoigiansetup() %></td>
						<td><%=li.getLoaisk() %></td>
						<td><%=li.getNgaycham() %></td>
						<td><%=li.getNhansu() %></td>
						<td>
							<a style="color: yellow;" href="XemChiTietCong.jsp?u=<%=li.getId() %>" class="tsx">Xem chi tiết</a>				
						</td>
					</tr>
	<% } %>
	</tbody>
	</table>


</body>
</html>
