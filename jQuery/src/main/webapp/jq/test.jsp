<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>test.jsp입니다</h1>
	<%
		System.out.println("test.jsp 실행!!!");
		System.out.println(request.getParameter("name"));
	%>
	<%=request.getParameter("name") %>
</body>
</html>