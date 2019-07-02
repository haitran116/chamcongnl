<%@page import="model.NhanVien"%>
<%@page import="dao.nhanvienDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"

    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Danh sách nhân viên</title>
</head>
<body>

		<center>
			<h1><jsp:include page="header.jsp"></jsp:include></h1>
			<h2><jsp:include page="menu.jsp"></jsp:include></h2>								
		</center>



<%
	nhanvienDAO nv = new nhanvienDAO();
	if(request.getParameter("txtTen")!=null){
		nv.ThemNhanVien(request.getParameter("txtMaNV"), request.getParameter("txtTen"), 
				Integer.parseInt(request.getParameter("txtTuoi")), 
				request.getParameter("txtQueQuan"));
		//out.println("Đã thêm mới 1 nhân viên");
	}
%>	

<span style="background-color: white; color: #404040; font-family: Arimo, Tahoma, Arial; font-size: 17px;">&nbsp;</span>
<a  href="ThemNhanVien.jsp" id="single-theme-download" style="background: rgb(26, 107, 178); border: none; box-sizing: inherit; color: white; display: inline-block; font-family: &quot;Hammersmith One&quot;, Tahoma, Arial; font-size: 1.125rem; margin: 0px 0.3em 10px 0px; padding: 0.4em 1.6em; text-decoration-line: none; text-transform: uppercase; transition: all 0.3s ease;
">thêm nhân viên</a>

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
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								Mã Nhân viên
							</div>
							<div class="cell">
								Tên Nhân Viên
							</div>
							<div class="cell">
								Tuổi
							</div>
							<div class="cell">
								Quê Quán
							</div>
						
						</div>
						<% for(NhanVien lnv: nv.getlistNhanVien()){ %>
							
						<div class="row">
							<div class="cell" data-title="Full Name">
								<%=lnv.getMa_nhan_vien() %>
							</div>
							<div class="cell" data-title="Full Name">
								<%=lnv.getTen_nhan_vien() %>
							</div>
							<div class="cell" data-title="Age">
								<%=lnv.getTuoi() %>
							</div>
							<div class="cell" data-title="Job Title">
								<%=lnv.getQue_quan() %>
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