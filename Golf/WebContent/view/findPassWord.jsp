<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	String passWord = request.getParameter("passWord");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button {
	padding-top: 20px;
}

.button button {
	width: 100px;
	height: 50px;
}

#result {
	padding-top: 30px;
	font-size: 25px;
	color: blue;
}
</style>
<link rel="stylesheet" href="../intro/style.css">
<script>
	window.onload=function(){
		var msg = "<%=msg%>";
		var passWord = "<%=passWord%>";
		if(msg=="false") alert("입력하신 정보가 가입된 정보와 일치하지않습니다.");
		else if(passWord!="null") document.getElementById("result").innerHTML=passWord;
	}
	function check(){
		if(document.getElementById("id").value==""){
			alert("아이디를 입력해주세요.");
			document.getElementById("id").focus();
			return false;
		}
		if(document.getElementById("memberCode").value==""){
			alert("회원번호를 입력해주세요.");
			document.getElementById("memberCode").focus();
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
		<h3 align="center">비밀번호 찾기</h3>
		<form action="findPassWordCtrl.jsp" method="post"
			onsubmit="return check()">
			<table border="1" align="center">
				<tr>
					<th>아이디</th>
					<th><input type="text" name="id" id="id"></th>
				</tr>
				<tr>
					<th>회원번호</th>
					<th><input type="text" name="memberCode" id="memberCode"></th>
				</tr>
			</table>
			<div class="button" align="center">
				<button type="submit">비밀번호 찾기</button><br><br>
				<button type="button" onclick="location.href='findId.jsp'">아이디 찾기</button>
			</div>
			<div id="result" align="center"></div>
		</form>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>