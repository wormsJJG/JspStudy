<%@page import="java.util.ArrayList"%>
<%@page import="DAO.GolfDAO"%>
<%@page import="VO.getTeacherSumFeeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GolfDAO dao = new GolfDAO();
	ArrayList<getTeacherSumFeeVO> list = dao.getTeacherSumFee();
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
		<h3 align="center">강사별매출조회</h3>
		<table border="1" align="center">
			<tr>
				<th>수강코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>총매출</th>

			</tr>
			<%for(getTeacherSumFeeVO vo:list){ %>
			<tr>
				<th><%=vo.getClassCode() %></th>
				<th><%=vo.getTeacherName() %></th>
				<th><%=vo.getClassName() %></th>
				<th>\<%=vo.getSumPrice() %></th>
			</tr>
			<%} %>
		</table>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>