<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
	%>
	<h1>scopeAction.jsp</h1>
	<h2>파라미터</h2>
	
	아이디 : <%=request.getParameter("id") %><br>
	비밀번호 : <%=request.getParameter("pw") %><br>
	
	<hr>
	<h2>어트리뷰트</h2>
		<h3> page : <%=pageContext.getAttribute("p") %></h3>
		<h3> request : <%=request.getAttribute("r") %></h3>
		<h3> session : <%=session.getAttribute("s") %></h3>
		<h3> application : <%=application.getAttribute("a") %></h3>
		
		
</body>
</html>