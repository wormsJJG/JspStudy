<%@page import="VO.GetMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.GolfDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GolfDAO dao = new GolfDAO();
	ArrayList<GetMemberVO> list = dao.getMemberList();
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
		<h3 align="center">회원정보 조회</h3>
		<table border="1" align="center">
			<tr>
				<th>수강월</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>회원코드</th>
				<th>회원명</th>
				<th>강의장소</th>
				<th>수강료</th>
			</tr>
			<%for(GetMemberVO vo:list){ %>
			<tr>
				<th><%=vo.getClassDate() %></th>
				<th><%=vo.getClassName() %></th>
				<th><%=vo.getTeacherName()%></th>
				<th><%=vo.getMemberCode() %></th>
				<th><%=vo.getMemberName() %></th>
				<th><%=vo.getClassArea() %></th>
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
