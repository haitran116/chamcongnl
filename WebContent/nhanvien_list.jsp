<%@page import="dao.TaiKhoanDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.nhanvienDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"

    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách nhân viên</title>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
<link rel="stylesheet" type="text/css" href="css/button.css">
</head>
<body>

	<%
		TaiKhoanDAO tkd = new TaiKhoanDAO();
		String _username = request.getParameter("u");
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
			<a  href="" class="myButton">Thống kê Công</a>
			<a  style="float: right;" href="logout.jsp" class="tsx">Đăng xuất</a>
			<a style="float: right; margin-top: 11px;"><%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>|<%=Quyen %> | </a>
	</div>



<%
	nhanvienDAO nv = new nhanvienDAO();
	if(request.getParameter("txtTen")!=null){
		nv.ThemNhanVien(request.getParameter("txtMaNV"), request.getParameter("txtTen"), 
				Integer.parseInt(request.getParameter("txtTuoi")), 
				request.getParameter("txtQueQuan"));
		//out.println("Đã thêm mới 1 nhân viên");
	}
%>	

	<table class="_table">
		<thead>
			<tr>
				<th>Mã Nhân viên</th>
			    <th>Tên Nhân Viên</th>
			    <th>Tuổi</th>
			    <th>Quê Quán</th>
			    <th></th>
			</tr>
		</thead>
		<tbody>
		<% for(NhanVien lnv: nv.getlistNhanVien()){ %>
			<tr>
				<td><%=lnv.getMa_nhan_vien() %></td>
				<td><%=lnv.getTen_nhan_vien() %></td>
				<td><%=lnv.getTuoi() %></td>
				<td><%=lnv.getQue_quan() %></td>
				<td>
					<a href="ThemNhanVien.jsp"  class="tsx">Thêm nhân viên</a>
					<a href="" class="tsx">Sửa</a>
					<a href=""  class="tsx">Xóa</a>
				</td>
		</tr>
		<%} %>
		</tbody>
	</table>
	
</body>
</html>