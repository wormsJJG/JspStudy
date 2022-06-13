<%@page import="DAO.GolfDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String memberCode = request.getParameter("memberCode");
	GolfDAO dao = new GolfDAO();
	String passWord = dao.findPassWord(id, memberCode);
	if(passWord==""){
		String msg = "false";
		response.sendRedirect("findPassWord.jsp?msg="+msg);
	}else{
		response.sendRedirect("findPassWord.jsp?passWord="+passWord);
	}
%>