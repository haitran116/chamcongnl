<%@page import="model.ChamCong"%>
<%@page import="dao.chamcongDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.nhanvienDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"

    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thống kê Công Xá</title>
</head>
<body>

	<center>
		<h1><jsp:include page="header.jsp"></jsp:include></h1>
		<h2><jsp:include page="menu.jsp"></jsp:include></h2>		
	</center>

</body>
<%
	chamcongDAO ccd = new chamcongDAO();
%>

<form action="chamcong.jsp">
	<h1>ID: <input type="text" name="txt_Tim_Ten" ><br>
		<input type="submit" value="Tìm tên"></h1>
</form>
	
<title>Table V02</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								ID
							</div>
							<div class="cell">
								Ngày Chấm
							</div>
							<div class="cell">
								Nhân sự
							</div>
							<div class="cell">
								Công Việc
							</div>
							<div class="cell">
								Thời gian bắt đầu
							</div>
							<div class="cell">
								Thời gian xong
							</div>
							<div class="cell">
								
							</div>
							<div class="cell">
								
							</div>
						</div>
						
						<% for(ChamCong li: ccd.nguoi_tra(request.getParameter("txt_Tim_Ten"))){ %>
						
							<div class="row">
								<div class="cell" data-title="Full Name">
									<%=li.getId_cham_cong() %>
								</div>
								<div class="cell" data-title="Age">
									<%=li.getNgay_cham() %>
								</div>
								<div class="cell" data-title="Job Title">
									<%=li.getNhan_su() %>
								</div>
								<div class="cell" data-title="Location">
									<%=li.getCong_viec() %>
								</div>
								<div class="cell" data-title="Location">
									<%=li.getThoi_gian_batdau() %>
								</div>
								<div class="cell" data-title="Location">
									<%=li.getThoi_gian_xong() %>
								</div>
								<div class="cell" data-title="Location">
									<a href="SuaChamCong.jsp?u=<%=li.getId_cham_cong() %>" class="btn btn-success">Sửa</a>								
								</div>
								<div class="cell" data-title="Location">
									<a href="XoaChamCong.jsp?u=<%=li.getId_cham_cong() %>"  class="btn btn-danger">Xóa</a>
								</div>
							</div>
						
						<% } %>

								

					</div>
			</div>
		</div>
	</div>


	

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	
	
</body>
</html>