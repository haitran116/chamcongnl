<%@page import="dao.XuLyChucNang"%>
<%@page import="dao.PhieuChamCongDAO"%>
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

<style>

table{
	width: 80%;
	background: yellow;
	margin: 0px auto;
	font-family: tomaho;
}

table, th, td {
  border: 2px solid black;
  border-collapse: collapse;
}

th{
	background: highlight; 
}


th, td {
  padding: 15px;
}
</style>

</head>
<body>

		<jsp:include page="menu.jsp"></jsp:include>

</body>
<%
	chamcongDAO ccd = new chamcongDAO();
	PhieuChamCongDAO pccd = new PhieuChamCongDAO();
	
	
	XuLyChucNang xlc = new XuLyChucNang();
	//out.print(xlc.ChuoiGiaTri(request.getParameter("adapter_data_chamcong")));
	String ip = request.getParameter("adapter_data_chamcong");

	if(request.getParameter("adapter_data_chamcong")!=null){
		
		for(String li: xlc.ChuoiGiaTri(ip)){
			String[] arr = li.split("\\|");
			
			ccd.ThemChamCong(xlc.id_phieu_cc(), 
					arr[0], 
					arr[1], 
					arr[2], 
					arr[3], 
					arr[4]);
		}
		
		pccd.ThemPhieuChamCong(xlc.id_phieu_cc(), 
					request.getParameter("txtTenSuKien"), 
					request.getParameter("txtLoaiSuKien"), 
					request.getParameter("txtNgayDRSK"), 
					request.getParameter("txtTimeSetup"));
		
	}
	
%>



<form action="ChamCongTimTen.jsp">
	Tên: <input type="text" name="txt_Tim_Ten" ><br>
		<input type="submit" value="Tìm tên">
</form>

	
<body>


<table id="_table">
  <tr>
    <th>id</th>
    <th>id phiếu</th> 
    <th>Ngày Chấm</th>
    <th>Nhân sự</th>
    <th>Công Việc</th>
    <th>Thời gian st</th>
    <th>Thời gian end</th>
  </tr>

    <% for(ChamCong li: ccd.getlistChamCong()){ %>
    	<tr>
			<td><%=li.getId_cham_cong() %></td>
	
			<td><%=li.getId_Phieu_Cham_Cong() %></td>
	
			<td><%=li.getNgay_cham() %></td>
	
			<td><%=li.getNhan_su() %></td>
	
			<td><%=li.getCong_viec() %></td>
	
			<td><%=li.getThoi_gian_batdau() %></td>
	
			<td><%=li.getThoi_gian_xong() %>
			<a href="SuaChamCong.jsp?u=<%=li.getId_cham_cong() %>" class="btn btn-success">Sửa</a>								
			<a href="XoaChamCong.jsp?u=<%=li.getId_cham_cong() %>"  class="btn btn-danger">Xóa</a>	</td>

		</tr>													
	<% } %>

</table>

	
	
</body>
</html>