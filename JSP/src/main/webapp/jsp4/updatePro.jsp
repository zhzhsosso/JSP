<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>updatePro.jsp</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		int id = Integer.parseInt(request.getParameter("id"));
	
	%>
	
	수정할 이름 : <%=name %>, 수정할 나이 : <%=age %>
	
	<%
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		//1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이브 로드 성공!");
		
		//2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("디비 연결 성공!");
		System.out.println("con : "+con);
		
		//3. sql 작성
		//sql - 1번 유저가 존재하는지 아닌지 판단 (회원인지)
		String sql = "select * from itwill_member where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		/// ???
		pstmt.setInt(1, id);
		
		//4. sql 실행
		ResultSet rs = pstmt.executeQuery();
		
		//5. 데이터 처리
			//회원일때만 실행
			//sql - update(12번 유저의 이름, 나이 수정)
		if(rs.next()){
			//회원
			//sql - update(1번 유저의 이름,나이 수정)
			//3.sql 생성 & pstmt 다시 생성
			sql = "update itwill_member set name=?,age=? where id=?";
			pstmt = con.prepareStatement(sql);
			
			//???
			pstmt.setString(1,name);
			pstmt.setInt(2,age);
			pstmt.setInt(3,id);
			
			//4.sql 실행
			pstmt.executeUpdate();
		}else{
			//비회원
			out.println("비회원");
		}
		
		
		
	
	
	%>
</body>
</html>