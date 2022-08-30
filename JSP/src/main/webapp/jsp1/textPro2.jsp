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
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String gender = request.getParameter("gender");
		
		String[] hobbys = request.getParameterValues("hobby");
		
		//배열이 null인지 아닌지 체크
		//null반복문 실행 x
		if(hobbys != null){
			for(int i=0;i<hobbys.length;i++){
//	 			System.out.println(hobbys[i]);
				out.println("<h3>취미" + (i+1) +" :" +hobbys[i]+ " </h3>");
			}
		
		for(int i=0;i<hobbys.length;i++){
			%>
			<h3>취미<%=i+1 %> : <%=hobbys[i]%></h3>
			<% 
		}
	}
	%>
	
	이름 : <%=name %><br>
	비밀번호 :<%=pass %><br>
	성별 :<%=gender %><br>
<%-- 	취미 :<%=hobbys[0] %> --%>
	<%
		String num = request.getParameter("num");
	%>
	<h3>강의장</h3>
	
</body>
</html>