<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "color.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col2%>">
	<h1>Test1.jsp</h1>
	
	<%=col1 %>
	
	<h2>include 액션태그 (jsp:include)</h2>
	=>각각의 페이지를 컴파일 한 후에 페이지를 추가 (JSP)
	
	<h2>include 지시어 (@ include)</h2>
	=> 코드를 병합해서 컴파일 수행
	
	<table border ="1" width = "800" height ="1000">
		<tr>
			<td colspan="2" height = "200">
<!-- 				<h1>top2</h1> -->
				<jsp:include page="top.jsp">
					<jsp:param value="itwill" name="id"/>
				</jsp:include>
			</td>
			
		</tr>
		<tr>
			<td width="200">
				<jsp:include page="left.jsp"></jsp:include>
			</td>
			
			<td>
				<h1>main</h1>
			</td>
			
		</tr>
		<tr>
			<td colspan="2" height="200">
				<jsp:include page="bottom.jsp"></jsp:include>
			</td>
			
		</tr>
	</table>
</body>
</html>