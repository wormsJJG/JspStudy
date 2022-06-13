<%@page import="DAO.GolfDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	GolfDAO dao = new GolfDAO();
	String id = dao.findId(name);
	if(id==""){
		String msg = "false";
		response.sendRedirect("findId.jsp?msg="+msg);
	}else{
		response.sendRedirect("findId.jsp?id="+id);
	}
%>