<%@page import="VO.getTeacherInfoVO"%>
<%@page import="VO.GetMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.GolfDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GolfDAO dao = new GolfDAO();
	ArrayList<getTeacherInfoVO> list = dao.getTeacherInfoList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프장 회원 관리 프로그램</title>
<link rel="stylesheet" href="../intro/style.css">
</head>
<body>
	<header>
		<%@include file="../intro/header.jsp"%>
	</header>
	<nav>
		<%@include file="../intro/menu.jsp"%>
	</nav>
	<section id="container">
		<h3 align="center">강사정보 조회</h3>
		<table border="1" align="center">
			<tr>
				<th>수강코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>가격</th>

			</tr>
			<%for(getTeacherInfoVO vo:list){ %>
			<tr>
				<th><a href="updateTeacher.jsp?classCode=<%=vo.getClassCode() %>"><%=vo.getClassCode() %></a></th>
				<th><%=vo.getTeacherName() %></th>
				<th><%=vo.getClassName() %></th>
				<th>\<%=vo.getPrice() %></th>
			</tr>
			<%} %>
		</table>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>