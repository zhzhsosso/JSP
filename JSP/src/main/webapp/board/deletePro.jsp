<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.itwillbs.board.BoardDTO"%>
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
		request.setCharacterEncoding("UTF-8");
		//전달정보 저장(pageNum,bno,pass)
		String pageNum = request.getParameter("pageNum");
		
		%>
		<jsp:useBean id="dto" class="com.itwillbs.board.BoardDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		<% 
		
		//BoardDAO 객체
		BoardDAO dao = new BoardDAO();
		//게시판 글삭제
		int result = dao.deleteBoard(dto);
		
		if(result == -1){
			%>
				<script type="text/javascript">
					alert("게시판 글 없음!");
					history.back();
				</script>
			<%
		}else if(result ==0){
			%>
				<script type="text/javascript">
					alert("비밀번호 오류");
					history.back();
				</script>
			<%
		}else{
			%>
				<script type="text/javascript">
					alert("게시판 삭제완료");
					location.href="boardList.jsp?pageNum=<%=pageNum%>";
				</script>
			
			<%
		}
		
	%>
</body>
</html>