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
	int id = Integer.parseInt(request.getParameter("u"));
	if(id>0){
		ccd.XoaChamXong(id);
		response.sendRedirect("TrangChu.jsp");
	}
%>
</body>
</html>