<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>core_out.jsp</h1>
	
	out.print() / JSP 표현식 [%= %] => 대신하는 출력형태
	JSTL 코드는 HTML 영역에 작성한다. <br>
	
	<c:out value="안녕하세요 itwill입니다"></c:out>
	<c:out value="안녕하세요 itwill입니다"/>
	<hr>
	c:out + EL 표현식 사용 => 연산 수행가능
	10*10 = 출력<br>
	JSTL : <c:out value="10*10"/><br>
	JSTL : <c:out value="${10*10 }"/><br>
	JSTL : <c:out value="<%=10*10 %>"/><br>
	JSP : <%=10*10 %><br>
	
	<hr>
	*null값을 출력할때 공백으로 출력(el표현식)
	c:out - default 값을 사용하면 null 때의 기본값을 사용가능
	<c:out value="${member.name }" default="기본값 입니다"/><br>
<%-- 	<%=member.name %> --%>

	escapeXml : <,> 특수기호를 처리할때 사용 (default - false)<br>
	<c:out value="${10 < 20}" escapeXml="true"/> <br>	
	<c:out value="${10 lt 20}" escapeXml="false"/> <br>	
	
	<hr>
	<abc>는 abc태그 입니다. <br>
	
	&lt;abc>는 abc태그 입니다. <br>
	
	<c:out value="<abc>는 abc태그 입니다."/><br>
	
</body>
</html>