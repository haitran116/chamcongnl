<%@page import="model.NhanVien"%>
<%@page import="dao.nhanvienDAO"%>
<%@page import="dao.chamcongDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thực Hiện Chấm Công</title>
</head>
<body>

<form action="">
	ID: <input type="text" name="_idchamcong" value="<%=request.getParameter("u") %>" ><br>
	Ngày chấm: <input type="text" name="_txtDate" ><br><br>

	
	Nhân Sự: <input type="text" name="_txtNhanSu" id="themnhansu" >
	
	<%
		nhanvienDAO nvd = new nhanvienDAO();
	%>
	
	<script type="text/javascript">
		var x="";						//khai báo biến nhân sự
	</script>
	
	<select id="ChonTen">			
	<%
		for(NhanVien lnv: nvd.getlistNhanVien()){
	%>
		<option value="<%=lnv.getTen_nhan_vien() %>"><%=lnv.getTen_nhan_vien() %></option>
		
	<%} %>
	</select>
	
	<button type="button" onclick="myFunction()">Thêm</button><br><br>
	
	
	<script>
	function myFunction() {
	  x = x + ", " + document.getElementById("ChonTen").value;		//thực hiện thêm nhận sự
	  document.getElementById("themnhansu").value = x;

	}
	</script>
	
	Công Việc: <input type="text" name="_txtCongViec" ><br><br>
	Thời gian từ: <input type="text" name="_txtTimeBD" ><br><br>
	Thời gian xong: <input type="text" name="_txtTimeEnd" ><br><br>
	
	
	<button type="submit" class="btn btn-warning">UPDATE</button> 
</form>

<%
	chamcongDAO ccd = new chamcongDAO();
	
	if(request.getParameter("_txtDate")!=null){
		int a = Integer.parseInt(request.getParameter("_idchamcong"));
		ccd.SuaChamCong(a, a, 
				request.getParameter("_txtDate"), request.getParameter("_txtNhanSu").substring(1), 
				request.getParameter("_txtCongViec"), request.getParameter("_txtTimeBD"), request.getParameter("_txtTimeEnd"));
		
		response.sendRedirect("chamcong.jsp");
	}
	
%>

</body>
</html>