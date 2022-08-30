<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String userID = "admin";
		String userPW = "1234";
	%>
	
	<h3>아이디 : <%=id %></h3>
	
	<%
		if(userID.equals(id)){
			//아이디 o
			if(userPW.equals(pw)){
				//비밀번호 o
				out.println("login");
				//로그인 성공한 id정보를 유지(세션영역에 저장)
				session.setAttribute("id", id);
				
				//sessionMain.jsp 이동
				response.sendRedirect("sessionMain.jsp");
				
			}else{
				//아이디o, 비번x
				out.println("pw error");
			}
		}else{
			//아이디x
			out.println("비회원");
		}
	%>
</body>
</html>