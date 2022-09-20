
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>reWritePro.jsp</h1>
	
	<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
		//전달정보 저장
		%>
			<jsp:useBean id="dto" class="com.itwillbs.board.BoardDTO"/>
			<jsp:setProperty property="*" name="dto"/>
		<%
		dto.setIp(request.getRemoteAddr());
		
		BoardDAO dao = new BoardDAO();
		
		//답글쓰기 메서드 호출
		dao.reInsertBoard(dto);
		
		//리스트 페이지로 이동
		response.sendRedirect("boardList.jsp");	
	%>
</body>
</html>