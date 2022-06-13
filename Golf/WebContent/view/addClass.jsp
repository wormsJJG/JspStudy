<%@page import="VO.selectedVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.GolfDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	GolfDAO dao = new GolfDAO();
	ArrayList<selectedVO> memberList = dao.getSelectMemberList();
	ArrayList<selectedVO> classList = dao.getSelectClassList();
	String id = session.getAttribute("id").toString();
	String memberCode = dao.getMemberCode(id);
	selectedVO vo1 = dao.getMemberSelect(memberCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<link rel="stylesheet" href="../intro/style.css">
<script>
	function changeMember() {
		document.getElementById("memberCode").value = document
				.getElementById("memberName").value;
		document.getElementById("classCode").value = "";
		document.getElementById("price").value = "";
	}
	function changeClass() {
		var price;
		var classCode = document.getElementById("classCode").value;
		switch (classCode) {
		case "100":
			price = 100000;
			break;
		case "200":
			price = 200000;
			break;
		case "300":
			price = 300000;
			break;
		case "400":
			price = 400000;
			break;
		default:
			price = 0;
		}
		if (price != 0) {
			var memberCode = document.getElementById("memberName").value;
			if (memberCode >= 20000) {
				price = price * 0.5;
			}
		}
		document.getElementById("price").value = price;
	}
	function check(){
		if(document.getElementById("classDate").value==""){
			alert("수강월을 입력하세요.");
			document.getElementById("classDate").focus();
			return false;
		}
		if(document.getElementById("memberName").value==""){
			alert("회원명을 선택하세요.");
			document.getElementById("memberName").focus();
			return false;
		}
		if(document.getElementById("classArea").value==""){
			alert("강의장소를 입력하세요.");
			document.getElementById("classArea").focus();
			return false;
		}
		if(document.getElementById("classCode").value==""){
			alert("강의를 입력하세요.");
			document.getElementById("classCode").focus();
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
		<h3 align="center">수강신청</h3>
		<form action="addClassCtrl.jsp" method="post"
			onsubmit="return check()">
			<table border="1" align="center" width="450px">
				<tr>
					<th>수강월</th>
					<th align="left"><input type="text" id="classDate"
						name="classDate">ex)202203</th>
				<tr>
					<th>회원명</th>
					<th align="left"><select id="memberName" name="memberName"
						onchange="changeMember()">
							<% if(session.getAttribute("grade").equals("A")){%>
							<option value="">회원명</option>
							<%for(selectedVO vo:memberList){ %>
							<option value="<%= vo.getOne()%>">[<%= vo.getOne()%>] <%= vo.getTwo()%></option>
							<%} %>
							<%}else{ %>
								<option value="<%= vo1.getOne()%>">[<%= vo1.getOne()%>] <%= vo1.getTwo()%></option>
							<%} %>
					</select></th>
				</tr>
				<tr>
					<th>회원코드</th>
					<% if(session.getAttribute("grade").equals("A")){%>
					<th align="left"><input type="text" id="memberCode"
						name="memberCode"></th>
					<%}else{ %>
					<th align="left"><input type="text" id="memberCode"
						name="memberCode" value="<%=vo1.getOne()%>"></th>
					<%} %>
				</tr>
				<tr>
					<th>강의장소</th>
					<th align="left"><input type="text" id="classArea"
						name="classArea"></th>
				</tr>
				<tr>
					<th>강의 선택</th>
					<th align="left"><select id="classCode" name="classCode"
						onchange="changeClass()">
							<option value="">강의 선택</option>
							<%for(selectedVO vo:classList){ %>
							<option value="<%= vo.getOne()%>">[<%= vo.getOne()%>] <%= vo.getTwo()%></option>
							<%} %>
					</select></th>
				</tr>
				<tr>
					<th>수강료</th>
					<th align="left"><input type="text" id="price" name="price">원</th>
				</tr>
				<tr>
					<th colspan="2"><button type="submit">수강신청</button>
						<button type="reset" onclick="alert('수강 정보를 다시 입력합니다.')">다시쓰기</button></th>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<%@include file="../intro/footer.jsp"%>
	</footer>
</body>
</html>