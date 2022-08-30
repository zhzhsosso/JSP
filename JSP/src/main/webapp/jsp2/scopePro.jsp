<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopePro.jsp</h1>
	<%
		//영역객체 정보 저장
		request.setAttribute("id", "BUSAN");
		pageContext.setAttribute("p", "pageValue");
		request.setAttribute("r", "requestValue");
		session.setAttribute("s", "sessionValue");
		application.setAttribute("a", "applicationValue");
	%>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<h3>아이디 : <%=id %></h3>
	
	<%
		//영역객체 정보 가져오기
		String id2 = (String)request.getAttribute("id");
	
	%>
	<h3>아이디 : <%=id2 %></h3>
	<h3> page : <%=pageContext.getAttribute("p") %></h3>
	<h3> request : <%=request.getAttribute("r") %></h3>
	<h3> session : <%=session.getAttribute("s") %></h3>
	<h3> application : <%=application.getAttribute("a") %></h3>
	
	
	
	<hr>
	<hr>
	<hr>
	
	<h2> 페이지 이동시 정보체크 </h2>
<!-- 	파라미터,어트리뷰트 -->

	<h3> html - a태그 </h3>
	<h4>사용가능 : 파라미터, session 영역, application 영역</h4>
	<a href="scopeAction.jsp?id=<%=id%>&pw=<%=pw%>">a태그 페이지 이동</a>
	
	<h3> javaScript - location.href </h3>
	<h4>사용가능 : 파라미터, session 영역, application 영역</h4>
 	<script type="text/javascript"> 
 		alert("js-페이지 이동");
		location.href='scopeAction.jsp?id=<%=id%>&pw=<%=pw%>'; 
 	</script>
	
	* JSP페이지 실행순서
	JSP(JAVA) -> HTML -> JS
	=> JSP,JS 통한 페이지이동은 한가지 방식만 사용해야함
	
	<h3> JSP-response.sendRedirect() </h3>
	<h4>사용가능 : 파라미터, session 영역, application 영역</h4>
	<%
		//System.out.println("JSP-페이지이동");
		//response.sendRedirect("scopeAction.jsp?id="+id+"&pw="+pw);
		response.sendRedirect("scopeAction.jsp?id="+id+"&pw="+pw);
		
	%>
	
	<h3>액션태그 - forward</h3>
	<h4>사용가능 : 파라미터, request 영역, session 영역, application 영역</h4>
	<!-- 
		포워딩 - 1) 전달하는 주소 변경x, 화면 변경o
				 2) request 영역값 전달 가능
				 
	 -->
<%-- 	 	<jsp:forward page = "scopeAction.jsp?pw=1234"> --%>
<%-- 		<jsp:forward page = "scopeAction.jsp"> --%>
<%-- 			<jsp:param value="99999" name="pw"/> --%>
<%-- 		</jsp:forward> --%>
</body>
</html>