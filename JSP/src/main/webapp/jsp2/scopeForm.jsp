<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeform.jsp</h1>
	
	<h2>영역(scope) : 내장객체 중에서 데이터를 공유하는 객체의 범위</h2>
	<h2> 속성(attribute) : 영역에서 공유되는 데이터</h2>
	
	<h3> 영역 </h3>
	page < request < session < application <br>
	
	<h3> 영역 객체 </h3>
	pageContext < request < session < application <br>
	
	
	*page-pageContext : 해당페이지가 클라이언트에 서비스를 제공할 때만 사용
	*request-request : 클라이언트의 요청이 처리되는 상황에만 사용
	*session-session : 세션이 유지되는 동안에만 사용(브라우저당 1개의 영역)
	*application-application : 웹 애플리케이션이 실행되는 동안 사용
	
	<hr>
	
	<form action="scopePro.jsp" method="get">
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="text" name="pw"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>