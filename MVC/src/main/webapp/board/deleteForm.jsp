<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp(MVC)</h1>
	<!-- bno,pageNum  -->
	
	<form action="./BoardDeleteAction.bo?pageNum=${param.pageNum }" method="post">
		<input type="hidden" name="bno" value="${param.bno }">
		
		비밀번호 : <input type="password" name="pass"><br>
		<input type="submit" value="삭제하기">	
	</form>
	
</body>
</html>