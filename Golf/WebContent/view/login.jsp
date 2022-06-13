<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
.register {
	padding-top: 30px;
}

.idAndPassWord {
	padding-top: 20px;
}
</style>
<script>
function check(){
	if(document.getElementById("id").value==""){
		alert("아이디를 입력하세요.");
		document.getElementById("id").focus();
		return false;
	}
	if(document.getElementById("passWord").value==""){
		alert("비밀번호를 입력하세요.");
		document.getElementById("passWord").focus();
		return false;
	}
	alert("로그인 되었습니다.");
	return true;
}
</script>
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
		<span style="color: hotpink; font-size: 2em"> <%=request.getAttribute("ErrMsg") == null ? "" : request.getAttribute("ErrMsg")%>
		</span>
		<%
			if (session.getAttribute("id") == null) {
		%>
		<h3 align="center">로그인</h3>
		<form action="loginCtrl.jsp" method="post" onsubmit="return check()">
			<table align="center" border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="passWord" name="passWord"></td>
				</tr>
				<tr>
					<th colspan="2" align="center"><button type="submit">로그인</button></th>
				</tr>
			</table>
			<div class="register" align="center">
				<button type="button" onclick="location.href='regsiterMember.jsp'">회원가입</button>
			</div>
			<div class="idAndPassWord" align="center">
				<button type="button" onclick="location.href='findId.jsp'">아이디
					찾기</button>
				<button type="button" onclick="location.href='findPassWord.jsp'">비밀번호
					찾기</button>
			</div>
		</form>
		<%
			} else {
		%>
		<script>
			alert("<%=session.getAttribute("id")%>님 반갑습니다.");
		</script>

		<%} %>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>