<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertBean.jsp</h1>
	<%
		//insertForm.jsp 정보를 전달받아서 db에 저장
		//1. 전달정보 저장
		//1-1. jsp
// 		String name = request.getParameter("name");
// 		String gender = request.getParameter("gender");
// 		int age = Integer.parseInt(request.getParameter("age"));
// 		String jumin = request.getParameter("jumin");	
		
// 		//1-2. 자바빈 객체
// 		JavaBean2 jb2 = new JavaBean2();
// 		jb2.setName(request.getParameter("name"));
// 		jb2.setGender(request.getParameter("gender"));
// 		jb2.setAge(Integer.parseInt(request.getParameter("age")));
// 		jb2.setJumin(request.getParameter("jumin"));
		
		//1-3. 자바빈객체 - 액션태그(html코드작성, jsp코드작성) > 쉽게 데이터포장
	%>
		<jsp:useBean id="jb2" class="com.itwillbs.javabean.JavaBean2"/>
		<jsp:setProperty property="*" name="jb2"/>
		
	<%
		///////////////////////////////////////////////////
		
		//2. db에 정보 저장
		
		//1. 드라이버 로드
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		//2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("디비 연결 성공!");
		System.out.println("con : "+con);
		
		//3. sql 작성 & pstmt
		String sql = "insert into itwill_member(name,gender,age,jumin) values (?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, jb2.getName());
		pstmt.setString(2, jb2.getGender());
		pstmt.setInt(3, jb2.getAge());
		pstmt.setString(4, jb2.getJumin());
		
		
		//4. sql 실행
		
		
	%>
	
</body>
</html>