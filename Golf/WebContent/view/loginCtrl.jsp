<%@page import="VO.loginVO"%>
<%@page import="DAO.sessionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passWord = request.getParameter("passWord");
	
	loginVO vo = new loginVO();
	vo.setId(id);
	vo.setPassWord(passWord);
	sessionDAO dao = new sessionDAO();
	loginVO returnVO = dao.login(vo);
	if(returnVO.getId()!= null){
		session.setAttribute("id", id);
		session.setAttribute("grade", returnVO.getGrade());
		response.sendRedirect("../intro/index.jsp");
	}else{
		request.setAttribute("ErrMsg", "아이디와 비밀번호를 확인해주세요.");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>