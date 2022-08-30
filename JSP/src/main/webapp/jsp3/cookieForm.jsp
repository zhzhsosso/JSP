<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieForm.jsp</h1>
	
	<%
		//쿠키 값에 따라서 출력되는 메세지 변경
		//한국어 - "안녕하세요! 쿠키연습!"
		// 영어 - "Hello~ Cooki Test~"
		
		//쿠키값 저장
		String lan = "";
	
		//1. 쿠키가 있는지 체크
		Cookie[] cookie = request.getCookies();
		
		if(cookie != null){
			//2. 쿠키들 중에서 내가 원하는 정보있는지 체크
			for(int i=0;i<cookie.length;i++){
				if(cookie[i].getName().equals("lang")){
					//3. 쿠키 값에 따른 메세지 출력
					System.out.println(cookie[i].getValue());
					
					lan = cookie[i].getValue();
					
					if(cookie[i].getValue().equals("kor")){
						//쿠키값이 한국어일때
						out.println("안녕하세요! 쿠키연습!<br>");
					}else{
						//쿠키값이 영어일때
						out.println("Hello~ Cooki Test~");
					}
					
				}
			}
			
		}
		
	%>
	
	<h3>쿠키정보 선택(언어설정)</h3>
	<form action="cookiePro.jsp" method="post">
		<input type ="radio" name="language" value="kor" 
		<%if(lan.equals("kor")){ %>
			checked
		<%} %>
		>한국어
		
		<input type ="radio" name="language" value="eng"
		<%if(lan.equals("eng")){ %>
			checked
		<%} %>
		>영어
		<br>
		<input type="submit" value="언어설정">	
	</form>
</body>
</html>