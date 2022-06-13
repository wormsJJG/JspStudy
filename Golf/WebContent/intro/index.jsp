<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프장 회원 관리 프로그램</title>
<link rel="stylesheet" href="../intro/style.css">
</head>
<body>
<header>
	<%@include file="../intro/header.jsp" %>
</header>
<nav>
	<%@include file="../intro/menu.jsp" %>
</nav>
<% if(session.getAttribute("id")!=null){%>
<script>
alert("<%=session.getAttribute("id") %>님 반갑습니다.");
</script>

<%} %>
<section id="container">
	<h3 align="center">골프장 회원관리 프로그램</h3>
	<pre>
   이 프로그램은 골프장 회원들은 관리하기 위한 프로그램입니다.
   프로그램 작성순서
  1.
  2.
  3.
  4.
  5.
  6.
  
	</pre>
</section>
<footer>
	<%@include file="../intro/footer.jsp" %>
</footer>
</body>
</html>