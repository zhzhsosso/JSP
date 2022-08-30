<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP 파일2</h1>
	<!-- HTML + JAVA코드 -->
	
	<script type="text/javascript">
		//javascript 주석문
	</script>
	
	<%
		//스크립틀릿 - JAVA코드 작성
		
		// 한줄짜리 주석
		/*
			여러줄짜리 주석
			1
			2
		*/
	System.out.println("1");
	System.out.println("2");
	System.out.println("3");
	System.out.println("4");
	System.out.println("5");
	//ctrl + alt + 방향키 아래 => 코드라인 복사
	//ctrl + d => 코드라인 삭제
	
	//화면(view)에 출력 => Html 코드
	out.println("5<br>");
	out.println("5<br>");
	out.println("5<br>");
	out.println("5<br>");
	out.println("5"+"<br>");
	
	// bit : 0/1을 표현하는 공간
	// 1 byte <=> 8bit
	// 1KB <=> 1024byte
	// 1MB <=> 1024*1024byte
	
	
	// 기본형 타입 - 8 개
	// 논리형
	// boolean - 1byte
	// 문자형
	// char - 2byte
	// 정수형
	// byte - 1byte
	// short - 2byte
	// int - 4byte
	// long - 8byte
	// 실수형
	// float - 4byte
	// double - 8byte
	
	//반복문 - for
// 	for(초기식;조건식;증감식){
// 		반복할 코드;
// 	}
	
	for(int i=0;i<20;i++){
		out.println("울산"+ (i+1) +"<br>");
	}
	
	
	%>
	부산 부산 부산
	
	
	
	<%
	//JSP
	  for(int i=0;i<5;i++){
	%>
		<!-- HTML -->
		<h1>@@@</h1>
	<%
	//JSP
		}
	%>
</body>
</html>