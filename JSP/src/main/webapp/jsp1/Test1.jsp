<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Test1.jsp</h1>
	<!-- ctrl + shift + f : 코드정렬 -->
	<!-- tab 오른쪽 이동, shift + tab 왼쪽으로 이동 -->

	<h2>JSP 구성요소</h2>
	<h3>JSP 지시어 (directive) p150 ~</h3>
	<%-- <%@ page,include,taglib %> --%>
	
	<h3> JSP 선언문 (declaration) p160~ </h3>
	<%-- <%! 멤버 변수 선언, 메서드 선언 %> --%>
	
	<%!
		// 멤버 변수 선언(전역변수)
		int age = 100;
		// out.println(age); 선언가능, 호출 사용불가능
	
	%>
	
	<h3> JSP 스크림틀릿(Scriptlet) </h3>
	<%-- <% 지역 변수 선언 %> --%>
	<%
		//지역 변수 선언
		String name;
		out.println(age);
	%>
	
	<h3> JSP 표현식 (expression) </h3>
	<!-- jsp 코드로 작성된 데이터를 화면에 출력 -->
	<%-- <%=값 %> --%>
	<%=age %>
	
	<!-- 스크립틀릿에 지역변수로 내 전화번호를 저장, 표현식을 사용해서 출력 -->
	
	<%
		String num = "01012345678";
	%>
	
	<h4> 전화번호 : <%=num %></h4>
	
</body>
</html>