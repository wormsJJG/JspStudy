<%@page import="VO.selectedVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.GolfDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GolfDAO dao = new GolfDAO();
	ArrayList<String> list = dao.getID();
	ArrayList<Integer> noList = dao.getNoList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<style>
	#checkSize{
		display: inline;
	}
	#confirmCheck{
		display: inline;
	}
</style>
<link rel="stylesheet" href="../intro/style.css">
<script>
	window.onload=function(){
		var today = new Date();
		var newday = today.toISOString().substring(0,10);
		today = newday.replace(/-/g,"");
		document.getElementById("inDate").value = today;
		document.getElementById("id").value="";
		document.getElementById("passWord").value="";
		document.getElementById("memberName").value="";
		document.getElementById("address").value="";
	}
	function cls(){
		document.getElementById("unique_check").checked=false;
		document.getElementById("img").setAttribute("src","");
		document.getElementById("id").value="";
		document.getElementById("id").focus();
	}
	function checkSize(){
		if(document.getElementById("passWord").value.length < 5){
			document.getElementById("checkSize").innerHTML = "비밀번호 짧음";
		}else{
			document.getElementById("checkSize").innerHTML = "조건 일치";
		}
	}
	function unique(){
		var id = document.getElementById("id").value;
		var flag = false;
		<%for(String s : list){%>
			if(id=="<%= s%>") flag=true;
		<%}%>
		if(flag){
			alert("이미 존재하는 아이디입니다.");
			document.getElementById("id").value="";
			document.getElementById("id").focus();
			return false;
		}else{
			document.getElementById("unique_check").checked=true;
			document.getElementById("img").setAttribute("src","../view/check.gif");
			alert("사용 가능한 아이디입니다.");
		}
	}
	function confirmCheck(){
		if(document.getElementById("passWord").value==document.getElementById("confirm").value){
			document.getElementById("confirmCheck").innerHTML = "일치";
		}else{
			document.getElementById("confirmCheck").innerHTML = "불일치";
		}
	}
	function autoNo(n){
		var max=0;
		if(n == 1){
			<%for(int no: noList){%>
			if(max<<%=no%> && <%=no%><20000){
				max=<%=no%>;	
			}
		<%}%>
		}else{
			<%for(int no: noList){%>
			if(max<<%=no%>){
				max=<%=no%>;
			}
		<%}%>		
	}
		document.getElementById("memberCode").value=max+1;
	}
	function check(){
		if(document.getElementById("id").value==""){
			alert("아이디를 입력해주세요.");
			document.getElementById("id").focus();
			return false;
		}
		
		if(document.getElementById("passWord").value==""){
			alert("비밀번호를 입력해주세요.");
			document.getElementById("passWord").focus();
			return false;
		}
		if(document.getElementById("memberName").value==""){
			alert("회원명을 입력해주세요.");
			document.getElementById("memberName").focus();
			return false;
		}
		if(document.getElementById("address").value==""){
			alert("주소를 입력해주세요.");
			document.getElementById("address").focus();
			return false;
		}
		var gradeList = document.querySelectorAll("[type=radio]");
		var flag=0;
		for(var i=0;i<gradeList.length;i++){
			if(gradeList[i].checked==true){
				flag=1;
			}
		}
		if(flag==0){
			alert("등급을 선택해주세요.");
			return false;
		}
		alert("수강등록이 완료되었습니다.");
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
		<h3 align="center">회원가입</h3>
		<form action="registerCtrl.jsp" method="post"
			onsubmit="return check()">
			<table border="1" align="center" width="450px">
				<tr>
				<th>아이디</th>
					<th align="left"><input type="text" id="id"
						name="id" value=""  size="10" onclick="cls()">
						<button type="button" onclick="unique()">중복 확인</button>
						<input type="radio" id="unique_check"><img id="img">
						</th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<th align="left"><input type="password" id="passWord"
						name="passWord" value=""  size="15" onkeyup="checkSize()"><div id="checkSize"></div></th>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<th align="left"><input type="password" id="confirm"
						name="confirm" value=""  size="15" onkeyup="confirmCheck()"><div id="confirmCheck"></div></th>
				</tr>
				<tr>
					<th>등급</th>
					<th align="left"><label onclick="autoNo(1)"><input type="radio" name="grade" id="grade" value="일반">일반</label>
					<label onclick="autoNo(2)"><input type="radio" name="grade" id="grade" value="VIP">VIP</label></th>
				</tr>
				<tr>
					<th>회원번호</th>
					<th align="left"><input type="text" id="memberCode"
						name="memberCode" value=""  size="10" readonly></th>
				<tr>
					<th>회원명</th>
					<th align="left"><input type="text" id="memberName" name="memberName" size="10"></th>
				</tr>
				<tr>
					<th>가입일</th>
					<th align="left"><input type="text" id="inDate" name="inDate" size="10" readonly></th>
				</tr>
				<tr>
					<th>주소</th>
					<th align="left"><input type="text" id="address" name="address" size="10" maxlength="10"><small>예) 성남시 분당구</small></th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">회원가입</button>
						<button type="reset">취소</button></th>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>