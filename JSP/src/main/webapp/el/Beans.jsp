<%@page import="com.itwillbs.test.Phone0"%>
<%@page import="com.itwillbs.test.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Beans.jsp</h1>
	
	[jsp]
	<%
		//request 영역 저장
		Person p = (Person)request.getAttribute("person");
	%>
	이름 : <%=p.getName() %>
	나이 :<%=p.getAge() %>
	<%
		Phone0 iPhone =p.getP();
	%>
	휴대폰 모델명 : <%=p.getP().getModel() %>
	휴대폰 모델명 : <%=iPhone.getModel() %>
	전화번호 :<%=p.getP().getTel() %>
	전화번호 :<%=iPhone.getTel() %>
	
	[el]
	${requestScope.person.name }
	${requestScope.person.age }
	${requestScope.person.p.tel }
</body>
</html>