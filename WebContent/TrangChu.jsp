<%@page import="model.ChamCong"%>
<%@page import="dao.chamcongDAO"%>
<%@page import="dao.TaiKhoanDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trang Chủ</title>

<style type="text/css">

#menu {
	background: green;
	width: 100%;
	height: auto;
	margin: 0px auto;
	
}



table._table {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
  margin: 0px auto;
}
table._table td, table._table th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table._table tbody td {
  font-size: 14px;
}
table._table thead {
  background: #1C6EA4;
  border-bottom: 2px solid #444444;
}
table._table thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFDF3;
  text-align: center;
  border-left: 2px solid #D0E4F5;
}
table._table thead th:first-child {
  border-left: none;
}

table._table tfoot td {
  font-size: 14px;
}
table._table tfoot .links {
  text-align: right;
}
table._table tfoot .links a{
  display: inline-block;
  background: #1C6EA4;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
}

.tsx {
	-moz-box-shadow: 0px 1px 0px 0px #f0f7fa;
	-webkit-box-shadow: 0px 1px 0px 0px #f0f7fa;
	box-shadow: 0px 1px 0px 0px #f0f7fa;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #33bdef), color-stop(1, #019ad2));
	background:-moz-linear-gradient(top, #33bdef 5%, #019ad2 100%);
	background:-webkit-linear-gradient(top, #33bdef 5%, #019ad2 100%);
	background:-o-linear-gradient(top, #33bdef 5%, #019ad2 100%);
	background:-ms-linear-gradient(top, #33bdef 5%, #019ad2 100%);
	background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#33bdef', endColorstr='#019ad2',GradientType=0);
	background-color:#33bdef;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #057fd0;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 14px;
	text-decoration:none;
	text-shadow:0px -1px 0px #5b6178;
}
.tsx:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #019ad2), color-stop(1, #33bdef));
	background:-moz-linear-gradient(top, #019ad2 5%, #33bdef 100%);
	background:-webkit-linear-gradient(top, #019ad2 5%, #33bdef 100%);
	background:-o-linear-gradient(top, #019ad2 5%, #33bdef 100%);
	background:-ms-linear-gradient(top, #019ad2 5%, #33bdef 100%);
	background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#019ad2', endColorstr='#33bdef',GradientType=0);
	background-color:#019ad2;
}
.tsx:active {
	position:relative;
	top:1px;
}

</style>

</head>
<body>

	<% 		
		TaiKhoanDAO tkd = new TaiKhoanDAO();
		chamcongDAO ccd = new chamcongDAO();
		String user = "";
		if(tkd.KiemTraDangNhap(request.getParameter("uname"), request.getParameter("psw"))==1){
			user = tkd.LayTenLogin(request.getParameter("uname"));
		}
		else{
			response.sendRedirect("index.jsp");
		}
	%>

	<div id="menu">
			<jsp:include page="menu.jsp"></jsp:include>
			<a style="float: right;"><%=user %></a>
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
	<% for(ChamCong li: ccd.nguoi_tra(user)){ %>
		<tr>
			<td><%=li.getId_cham_cong() %></td>
			<td><%=li.getId_Phieu_Cham_Cong() %></td>
			<td><%=li.getNgay_cham() %></td>
			<td><%=li.getNhan_su() %></td>
			<td><%=li.getCong_viec() %></td>
			<td><%=li.getThoi_gian_batdau() %></td>
			<td><%=li.getThoi_gian_xong() %></td>
			<td>
				<a href="SuaChamCong.jsp?u=<%=li.getId_cham_cong() %>" class="tsx">Sửa</a>								
				<a href="XoaChamCong.jsp?u=<%=li.getId_cham_cong() %>"  class="tsx">Xóa</a>
			</td>
	</tr>
	<% } %>
	</tbody>
	</table>


</body>
</html>