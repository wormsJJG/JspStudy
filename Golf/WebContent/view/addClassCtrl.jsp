<%@page import="java.awt.print.Printable"%>
<%@page import="DAO.GolfDAO"%>
<%@page import="VO.addVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	addVO vo = new addVO();
	vo.setClassDate(request.getParameter("classDate"));
	vo.setMemberCode(request.getParameter("memberCode"));
	vo.setClassArea(request.getParameter("classArea"));
	vo.setClassCode(request.getParameter("classCode"));
	vo.setPrice(Integer.parseInt(request.getParameter("price")));
	out.print(request.getParameter("classDate")+request.getParameter("memberCode")+request.getParameter("classArea")+request.getParameter("classCode")+Integer.parseInt(request.getParameter("price")));
	GolfDAO dao = new GolfDAO();
	int cnt = dao.addClass(vo);
	if(cnt>0){
		response.sendRedirect("getMemberList.jsp");
	}else{
		response.sendRedirect("getMemberList.jsp?status=false");
	} 
%>