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
	if(Integer.parseInt(request.getParameter("u"))>0){
		ccd.XoaChamXong(Integer.parseInt(request.getParameter("u")));
		response.sendRedirect("chamcong.jsp");
	}
%>
</body>
</html>