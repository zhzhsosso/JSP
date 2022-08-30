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
	<h1>select.jsp</h1>
	
	<h2>DB에 저장되어 있는 정보 조회</h2>
	
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
		
		//3.sql 작성 & pstmt
// 		String sql = "insert into itwill_member (name,gender,age,jumin) values(?,?,?,?)";
// 		String sql = "select * from itwill_member where gender = ?";
		String sql = "select * from itwill_member order by ";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//???
// 		pstmt.setString(2,"M");
		
		//4.sql 실행
		// * 실행구문은 sql 구문이 실행시 테이블에 영향을 주는지 판단
		//pstmt.executeUpdate() : insert구문, update구문
		//pstmt.executeQuery() : select구문
		ResultSet rs = pstmt.executeQuery();
		System.out.println("SQL구문 실행 완료!");
		
		//5.데이터처리
		//=>정보를 가져다가 출력
		
		
		//rs.next() : 레코드셋의 커서를 움직여서 데이터가 있는지 없는지 체크
		while(rs.next()){
			//데이터 있을 때
			
			//데이터 저장(DB->변수)
			//rs.getXXX(INT컬럼인덱스) : 검색속도가 빠르다 테이블 설계중요 데이터 정확도 떨어짐
			//rs.getXXX(STRING) : 데이터 정확도 높음 컬럼명을 외워야한다
			
			//인덱스 정보 저장
			int idx = rs.getInt(1);
			String name = rs.getString("name");
			String gender = rs.getString("gender");
			int age = rs.getInt("age");
			String jumin = rs.getString("jumin");
			
			%>
			IDX : <%=idx %><br>
			name : <%=name %><br>
			gender : <%=gender %><br>
			age : <%=age %><br>
			jumin : <%=jumin %><br>
			<hr>
			<% 
		}
		
		%>
</body>
</html>