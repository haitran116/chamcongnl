<%@page import="java.util.Calendar"%>
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

	<div id="menu" >
			<a  href="TrangChu.jsp" class="myButton">Trang chủ</a>
			<a  href="ThemChamCong.jsp?u=<%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>" class="myButton">Chấm Công</a>
			<a  href="nhanvien_list.jsp" class="myButton">Nhân Viên</a>
			<a  href="" class="myButton">Thống kê Công</a>
			<a  style="float: right; " href="logout.jsp" class="tsx">Đăng xuất</a>
			<a style="float: right; margin-top: 11px;"><%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>|<%=Quyen %> | </a>
			
			<select style="float: right;margin-top: 11px;margin-right: 10px; width: 130px; font-family: tahoma; font-weight: bold;" 
			id="thang" onchange="click_thang(this.value)">
				<option>Chọn tháng</option>
		  			<% for(int i=1;i<=12;i++){ %>
	                <option value="<%=i %>" >
	                    <%=i %>
	                </option>
         			<%} %>
			</select> 
			
			<script>
				function click_thang(val) {	
				  document.getElementById("linkid").value = val;
				  document.getElementById("linkid").click();
				  //alert(val);
					}			
			</script>
			
			<form action="GetMount" method="get">
				<input type="hidden" id="linkid" name=data_thang onclick="submit()"></input>
			</form>
	</div>
	
	<table class="_table" ">
	<thead>
		<tr>
			<th>ID</th>
			<th>Ngày gửi phiếu</th>
			<th>Người Chấm</th>
		    <th>Tên sự kiện</th>
		    <th>Ngày diễn ra sự kiện</th>
		    <th>Thời gian setup</th>
		    <th>Loại sự kiện</th>
		    <th>Chấm ngày</th>
		    <th>Nhân sự</th>
		    <th></th>
		    <th></th>
		</tr>
	</thead>
	<tbody>
	<% 
		CC_RutGonDAO rgd = new CC_RutGonDAO();
		XuLyChucNang xl = new XuLyChucNang();
		
		
		Calendar c = Calendar.getInstance();
		int mount = (c.get(Calendar.MONTH)+1); // tháng mặc đinh la hiện tại
		
		if((String) request.getAttribute("_thang") != null){  // khi chọn xem tháng nào đó
			mount = Integer.parseInt((String) request.getAttribute("_thang"));
		}
		
		for(CC_RutGon li: rgd.GetlistChamCong_RutGon(name, mount)) {
		%> 
					<tr>
						<td><%=li.getId() %></td>
						<td><%=li.getNgayGuiPhieu() %></td>
						<td><%=li.getNguoiCham() %></td>
						<td><%=li.getTensk() %></td>
						<td><%=li.getNgaydienrask() %></td>
						<td><%=li.getThoigiansetup() %></td>
						<td><%=li.getLoaisk() %></td>
						<td><%=xl.DD_Date(li.getNgaycham()) %></td>
						<td style="font-weight: bold;">
							<%=li.getNhansu() %></td>
						<td>
							<a style="background: black;color: while;margin-top: 3px;margin-bottom: 3px;margin-left: 0px;margin-right: 0px;
								" href="XemChiTietCong.jsp?u=<%=li.getId() %>" class="tsx">Xem chi tiết</a>				
						</td>
						<td>
							<a style="background: red;color: while;margin-top: 3px;margin-bottom: 3px;margin-left: 0px;margin-right: 0px;
								" href="XoaChamCong.jsp?u=<%=li.getId() %>" class="tsx">Xóa</a>				
						</td>
					</tr>
	<% } %>
	</tbody>
	</table>


</body>
</html>
