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
	<h1>deletePro.jsp</h1>
	<%
		//1. 회원정보가 필요(deleteForm.jsp 전달, 한글처리)
		request.setCharacterEncoding("UTF-8");
	
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		
		//2. 디비에서삭제
		
		//3. 드라이브 로드
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		System.out.println("드라이브 로드");
		
		//4. 디비 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("디비 연결 성공!");
		
		//5. sql 작성(select) & pstmt 객체
		String sql = "select jumin from itwill_member where name = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//???
		pstmt.setString(1, name);
		
		//6. sql 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 7. 데이터가 있을경우에만 회원 삭제
		if(rs.next()){
			//회원
			if(jumin.equals(rs.getString("jumin"))){
				//회원-주민번호 동일 => 삭제
				//3. sql & pstmt
				sql = "delete from itwill_member where jumin=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, jumin);
				
				//4. sql 실행
				pstmt.executeUpdate();
				out.println("탈퇴완료");
			}
		}else{
			//비회원
			out.println("비회원");
		}
		// 8. sql 작성(delete) & pstmt 객체
		// 9. sql 실행
	
	
	%>
</body>
</html>