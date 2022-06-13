<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul>
	<% if(session.getAttribute("id")!=null){%>
	<li><a href="../view/addClass.jsp">수강등록</a></li>
	<%}else{ %>
	<li><a onclick="login()">수강등록</a></li>
	<%} %>	
	<li><a href="../view/getMemberList.jsp">회원조회</a></li>
	<li><a href="../view/getTeacherInfoList.jsp">강사조회</a></li>
	<li><a href="../view/getTeacherSumFee.jsp">강사별매출조회</a></li>
	<li><a href="../intro/index.jsp">홈으로</a></li>
	<% if(session.getAttribute("id")==null){%>
	<li id="adminLogin"><a href="../view/login.jsp">로그인</a></li>
	<%}else{ %>
	<li id="adminLogin"><a href="../view/logOut.jsp">로그아웃</a></li>
	<%} %>
	<script>
		function login(){
			var answer = confirm("로그인이 필요한 메뉴입니다. 로그인 하시겠습니까?");
			if(answer){
				location.href="../view/login.jsp";	
			}
		}
	</script>
</ul>