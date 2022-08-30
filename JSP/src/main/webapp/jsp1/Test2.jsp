<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Test2.jsp</h1>
	<h2 class="test"> 객체(Object) </h2>
	=> 내 눈앞에 보이는 모든 대상
	
	객체 추상화
	
	객체 - 1)속성 : 객체의 특징을 표현하기위한 정보
				=> 변수 표현
			2) 동작 : 객체가 수행하는 모든 행동
				=> 함수(메서드) 표현
			
	<h2> 내장 객체(p.177~) </h2>
	=> JSP페이지 -> 서블릿 클래스 필요한 정보(객체)를 미리 생성
	
	<h3> javax.servlet 패키지</h3>
		request : 클라이언트의 http요청정보를 저장한 객체<br>
		response : http요청에 해당하는 응답정보를 저장한 객체 <br>
		session : 클라이언트의 세션정보를 저장한 객체 <br>
		pageContext : 페이지 실행에 필요한 컨텍스트정보를 저장한 객체<br>
		out : 응답페이지를 전송하기위한 출력스트림 객체<br>
		application : 동일한 애플리케이션의 컨텍스트 정보를 저장한 객체<br>
		config : 페이지에 필요한 서블릿 설정정보(초기화)<br>
		page : 해당 페이지의 서블릿 객체<br>
		
	
	<h3> java.lang 패키지</h3>
		exception : 예외 처리 객체 <br>
		
	<hr>
	
	<h3>request 객체</h3>
	서버 도메인명 : <%=request.getServerName() %> <br>
	URL : <%=request.getRequestURL()  %> <br>
	URI : <%=request.getRequestURI() %> <br>
	클라이언트 ip주소 : <%=request.getRemoteAddr() %> <br>
	프로젝트의 물리적 경로 : <%=request.getRealPath("/") %>
	
	<h3>response 객체</h3>
	<%
	//response.setHeader();
	//response.addCookie(cookie);
	//response.sendRedirect("http://www.naver.com");
	//response.setContentType("text/html; charset=UTF-8");
	//response.addHeader("Refresh", "3; url=Test1.jsp");
	%>
	
	<h3> session 객체 </h3>
	세션 ID 값 : <%=session.getId() %> <br>
	세션 생성시간 : <%=session.getCreationTime() %> <br>
	<%=new Date(session.getCreationTime()) %> <br>
	세션 최종접속시간 : <%=session.getLastAccessedTime() %> <br>
	세션 유지시간 : <%=session.getMaxInactiveInterval() %>s <br>
	
	<%
		session.setMaxInactiveInterval(600);
	%>
	세션 유지시간 : <%=session.getMaxInactiveInterval() %>s <br>
</body>
</html>