<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/main.jsp</h1>
	<h2>메인페이지</h2>
	<%
		//로그인을 해야만 정보를 확인가능 페이지
		// 로그인 하지않았다면 사용자는 페이지를 사용할 수 없다
		String id = (String)session.getAttribute("id");
	
		if(id == null){
			//로그인 페이지로 이동
			response.sendRedirect("loginForm.jsp");
		}
		//로그인 했다면 ㅇㅇ님 환영합니다
	%>
		<h3> <%=id %>님 환영합니다.</h3>
		
		<input type="button" value="로그아웃" onclick='location.href="logOut.jsp";'>
		
		<a href="javascript:location.href='logout.jsp'">로그아웃2</a>
		
		<hr><hr>
		
		<a href="memberInfo.jsp">회원정보 조회</a>
		<h4><a href="memberUpdate.jsp">회원정보 수정</a></h4>
		<h4><a href="memberDelete.jsp">회원정보 삭제</a></h4>
		<hr><hr>
		
		
	
</body>
</html>