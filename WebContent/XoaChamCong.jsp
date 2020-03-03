<%@page import="dao.XuLyChucNang"%>
<%@page import="dao.TaiKhoanDAO"%>
<%@page import="model.User_login"%>
<%@page import="dao.chamcongDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<%
	chamcongDAO ccd = new chamcongDAO();
	TaiKhoanDAO tkd = new TaiKhoanDAO();
	XuLyChucNang xl = new XuLyChucNang();
	
	String user = (String)session.getAttribute("_user");

	String name = tkd.LayTenLogin(user);
	
	int id = Integer.parseInt(request.getParameter("u"));
	
	if(name.equals(xl.KiemTraQuyenEdit(id))){		
		ccd.XoaChamXong(id);
		response.sendRedirect("TrangChu.jsp");
	}
	else{
		response.sendRedirect("TrangChu.jsp");
		%>
		<script >
			alert("Bạn không có quyền xóa !");
		</script>
		<% 
		
	}
%>



</body>
</html>