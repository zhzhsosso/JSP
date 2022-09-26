<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Attribute.jsp</h1>
	<%
		int cnt = (Integer)request.getAttribute("cnt");
		cnt=2000;
	%>
	cnt 값(jsp) : <%=cnt %><br>
	
	cnt 값(el) : ${cnt }<br>
	cnt 값(el) : ${requestScope.cnt }<br>
	cnt 값 (jsp-session) : <%=session.getAttribute("cnt") %><br>
	cnt 값 (el-session) : ${sessionScope.cnt }<br>
	
	
	=>el 영역객체의 이름은 생략 가능
		pageScope > requestScope > sessionScope > applicationScope
		
		* 영역범위의 크기가 작은곳에서 큰곳으로 이동하면서 검색
		* 동일 이름의 속성값이 존재할경우 잘못된 데이터 참조
	<h3>
	 jsp코드(스크립틀릿) cnt =>변수,<br>
	 el 표현식 cnt => 속성(어트리뷰트)
	</h3>
</body>
</html>