<%@page import="VO.loginVO"%>
<%@page import="DAO.GolfDAO"%>
<%@page import="VO.registerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String passWord = request.getParameter("passWord");
String member_code = request.getParameter("memberCode");
String member_name = request.getParameter("memberName");
String indate = request.getParameter("indate");
String address = request.getParameter("address");
String grade = request.getParameter("grade");

registerVO vo = new registerVO();
loginVO loginvo = new loginVO();
loginvo.setId(id);
loginvo.setPassWord(passWord);
loginvo.setMemberCode(member_code);
loginvo.setGrade("U");

vo.setMember_code(member_code);
vo.setMember_name(member_name);
vo.setIndate(indate);
vo.setAddress(address);
vo.setGrade(grade);

GolfDAO dao = new GolfDAO();
int cnt = dao.registerMember(vo);
int cnt2 = dao.addLogin(loginvo);
if(cnt+cnt2>1) response.sendRedirect("getMemberList.jsp");
else response.sendRedirect("regsiterMember.jsp");
%>
