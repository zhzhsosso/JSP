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
	<h1>loginPro.jsp</h1>
	<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
		//전달정보저장(id,pw)-액션태그
		
		
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	<%	
		//로그인 처리
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		//1.드라이브 로드
		Class.forName(DRIVER);
		
		//2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		
		//3. sql 작성(select) & pstmt 객체
		String sql = "select pw from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//???
		pstmt.setString(1,mb.getId());
		
		//4. sql 실행
		ResultSet rs = pstmt.executeQuery();
		
		//5. 데이터처리
		if(rs.next()){
			//아이디에 해당하는 비밀번호가 있다 => 회원이다
			if(mb.getPw().equals(rs.getString("pw"))){
				//입력받은 비밀번호랑 디비에 저장된 비밀번호가 같음
				//=>본인(로그인 성공)
				//로그인 성공결과 저장
				session.setAttribute("id", mb.getId());
				
				// main.jsp 페이지 이동
				response.sendRedirect("main.jsp");
				
			}else{
				//입력받은 비밀번호랑 디비에 저장된 비밀번호가 다름
				//=>비밀번호 오류
				%>
				<script type="text/javascript">
					alert('비밀번호가 틀렸습니다');
					history.back();
				</script>
				<%
				//페이지 뒤로가기
			}
		}else{
			%>
			<script type="text/javascript">
				alert('비회원입니다');
				history.back();
			</script>
			<%
			//아이디에 해당하는 비밀버호가 없다 => 비회원이다
		}
	%>
</body>
</html>