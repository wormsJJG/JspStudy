<%@page import="VO.getTeacherInfoVO"%>
<%@page import="VO.GetMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.GolfDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GolfDAO dao = new GolfDAO();
	getTeacherInfoVO vo = dao.getTeacher(request.getParameter("classCode"));
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
		<form action="updateCtrl.jsp" method="post" onsubmit="return check()">
		<table border="1" align="center">
			<tr>
				<th>수강코드</th><th><input type="text" id="classCode"
						name="classCode" value="<%=vo.getClassCode() %>"></th>
				</tr>
				<tr>
				<th>강사명</th><th><input type="text" id="teacherName"
						name="teacherName" value="<%=vo.getTeacherName() %>"></th>
				</tr>
				<tr>
				<th>강의명</th><th><input type="text" id="className"
						name="className" value="<%=vo.getClassName() %>"></th>
				</tr>
				<tr>
				<th>가격</th><th><input type="text" id="price"
						name="price" value="<%=vo.getIntPrice() %>"></th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">수정</button><button type="reset">취소</button></th>
				</tr>
		</table>
		</form>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>