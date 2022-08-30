
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.itwillbs.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>member/insertPro.jsp</h1>
	<%
	//한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// MemeberBean 객체 생성
		// 전달되는 회원정보를 저장(액션태그)
	%>
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<jsp:setProperty property="*" name="mb"/>
		
<%-- 		<jsp:getProperty property="id" name="mb"/> --%>
		<%=mb.toString() %><br>
		<%=mb %><br>
		
	<%	
		//mb객체에 회원정보(시간정보) 추가
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
	%>
		<%=mb.toString() %><br>
		<%=mb %><br>
		
	<%
		
		//1. 드라이버 로드
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		
		//2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("디비 연결 성공!");
		System.out.println("con : "+con);
		
		//3. sql 작성 & pstmt
		String sql = "insert into itwill_member(id,pw,name,gender,age,email,regdate) values (?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//???
		
		pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPw());
		pstmt.setString(3, mb.getName());
		pstmt.setString(4, mb.getGender());
		pstmt.setInt(5, mb.getAge());
		pstmt.setString(6, mb.getEmail());
		pstmt.setTimestamp(7, mb.getRegdate());
		
		//4. sql 구문실행
		pstmt.executeUpdate();
		System.out.println("회원가입 성공!");
	
	%>
	
	<script type="text/javascript">
		alert('회원가입 성공!');
		location.href="loginForm.jsp";
	</script>
</body>
</html>