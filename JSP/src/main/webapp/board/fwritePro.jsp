<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.itwillbs.board.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fwritePro.jsp</h1>
	<%
		//첨부파일이 포함된 글쓰기
		//1) 업로드
		// - upload 폴더 생성
		// 업로드할 폴더 위치 저장
		String realPath = request.getRealPath("/upload");
		System.out. println("realPath : "+realPath);
		// 업로드 파일의 크기 20MB
		int maxSize = 20*1024*1024;
		
		// 업로드 객체 MultipartRequest 생성
		MultipartRequest multi = new MultipartRequest(
				request,
				realPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		//2) 전달된 정보 처리(파라메터)
		// (게시판 제목, 글쓴이, 비밀번호, 내용, 파일명)
		// 전달정보 한번에 저장객체 BoardDTO 생성
		BoardDTO dto = new BoardDTO();
		dto.setSubject(multi.getParameter("subject"));
		dto.setName(multi.getParameter("name"));
		dto.setPass(multi.getParameter("pass"));
		dto.setContent(multi.getParameter("content"));
		dto.setFile(multi.getFilesystemName("file"));
		
		dto.setIp(request.getRemoteAddr());
		
		//BoardDAO 파일 글쓰기 동작 호출
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(dto);
		
		// 페이지 이동(list)
		response.sendRedirect("boardList.jsp");
	%>
</body>
</html>