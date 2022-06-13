<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.button{
		padding-top: 20px;
	}
	.button button{
		width: 100px;
		height: 50px;
	}
	#result{
		padding-top: 30px;
		font-size: 25px;
		color: blue;
	}
</style>
<link rel="stylesheet" href="../intro/style.css">
<script>
	window.onload=function(){
		var msg = "<%=msg%>";
		var id = "<%=id%>";
		if(msg=="false") alert("가입된 회원정보가 없습니다.");
		else if(id!="null") document.getElementById("result").innerHTML=id;
	}
	function check(){
		if(document.getElementById("name").value==""){
			alert("이름을 입력해주세요.");
			document.getElementById("name").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<header>
		<%@include file="../intro/header.jsp"%>
	</header>
	<nav>
		<%@include file="../intro/menu.jsp"%>
	</nav>
	<section id="container">
	<h3 align="center">아이디 찾기</h3>
	<form action="findIdCtrl.jsp" method="post" onsubmit="return check()">
	<table border="1" align="center">
		<tr><th>회원명</th><th><input type="text" name="name" id="name"></th></tr>
	</table>
	<div class="button" align="center">
		<button type="submit">아이디 찾기</button><br><br>
		<button type="button" onclick="location.href='findPassWord.jsp'">비밀번호 찾기</button>
	</div>
	<div id="result" align="center">
	</div>
	</form>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>