<%@page import="java.util.Calendar"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.nhanvienDAO"%>
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
<title>Quản Lý Chấm Công</title>
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
			
			<select style="float: right;margin-top: 11px;margin-right: 10px; width: 130px; font-family: tahoma; font-weight: bold;"
			 id="chonten" onchange="click_ten(this.value)">
			<option>Chọn tháng</option>
			  <% for(int i=1;i<=12;i++){ %>
	                <option value="<%=i %>">
	                    <%=i %>
	                </option>
	         <%} %>
			</select> 
		
			<script>
				function click_ten(val) {	
				  document.getElementById("linkid").value = val;
				  document.getElementById("linkid").click();
				  //alert(val);
				}			
			</script>
	</div>	
	
	<form action="GetMount" method="post">
		<input type="hidden" id="linkid" name=data_thang onclick="submit()"></input>
	</form>
	
	 
	<table class="_table" style="margin-top: 5px; font-family: tahoma;">
	<thead>
		<tr>
			<th>id</th>
			<th>Ngày gửi phiếu</th>
			<th>Người chấm</th>
		    <th>Tên sự kiện</th>
		    <th>Ngày diễn ra sk</th>
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
		XuLyChucNang xl = new XuLyChucNang();
		
		Calendar c = Calendar.getInstance();
		int mount = (c.get(Calendar.MONTH)+1); // tháng mặc đinh la hiện tại
		
		if((String) request.getAttribute("_thang") != null){  // khi chọn xem tháng nào đó
			mount = Integer.parseInt((String) request.getAttribute("_thang"));
		}
		
		int stt=0;
		
		for(CC_RutGon li: rgd.GetlistCC_Admin(mount)) {
		%> 
					<tr>
						<td><%=stt++ %></td>
						<td><%=li.getNgayGuiPhieu() %></td>
						<td><%=li.getNguoiCham() %></td>
						<td><%=li.getTensk() %></td>
						<td><%=li.getNgaydienrask() %></td>
						<td><%=li.getThoigiansetup() %></td>
						<td><%=li.getLoaisk() %></td>
						<td><%=xl.DD_Date(li.getNgaycham()) %></td>
						<td style="font-weight: bold;"><%=li.getNhansu() %></td>
						<td>
							<a style="background: black;color: while;margin-top: 3px;margin-bottom: 3px;margin-left: 0px;margin-right: 0px;
								" href="Admin_xem.jsp?u=<%=li.getId() %>" class="tsx">Xem chi tiết</a>				
						</td>
					</tr>
	<% } %>
	</tbody>
	</table>


</body>
</html>
