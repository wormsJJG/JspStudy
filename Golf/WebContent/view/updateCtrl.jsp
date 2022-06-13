<%@page import="DAO.GolfDAO"%>
<%@page import="VO.getTeacherInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	getTeacherInfoVO vo = new getTeacherInfoVO();
	GolfDAO dao = new GolfDAO();
	vo.setClassCode(request.getParameter("classCode"));
	vo.setClassName(request.getParameter("className"));
	vo.setTeacherName(request.getParameter("teacherName"));
	vo.setIntPrice(Integer.parseInt(request.getParameter("price")));
	int cnt = dao.updateTeacherInfo(vo);
	if(cnt>0){
		response.sendRedirect("getTeacherInfoList.jsp");
	}else{
		response.sendRedirect("getTeacherInfoList.jsp?status=false");
	} 
%>