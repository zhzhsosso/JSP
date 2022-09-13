<%@page import="com.itwillbs.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
	<h1>boardList.jsp</h1>
	
	<%
		// DB에 있는 정보 가져와서 화면에 출력
		
		// BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
	
		//저장된 전체 글의 개수
		int count = dao.getBoardCount();
		System.out.println("글 개수 : "+count+"개 ");
		
		////////////////////////////////////////////////////////////
		//페이징 처리 (1) - 한페이지에 몇개를 보여주느냐
		
		// 한 페이지에 보여줄 글의 개수
		int pageSize =3;
		
// 		http://localhost:8088/JSP/board/boardList.jsp?pageNum=2
		
		// 현 페이지가 몇페이지 인지 확인
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "2";
		}
		// 시작행 번호 계산하기 1	11	21	31	41 .....
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		
		// 끝행 번호 계산하기 10	20	30	40	50.....
		int endRow = currentPage * pageSize;
		
		/////////////////////////////////////////////////////////////
		//게시판 정보를 가져오는 메서드
// 		ArrayList boardList = dao.getBoardList();
		
		//게시판 정보를 가져오는 메서드(페이징 처리 완료)
		ArrayList boardList = dao.getBoardList(startRow, pageSize);
		
		// 게시판 정보 출력
		
	%>
	
	<h3><a href="writeForm.jsp">글쓰기</a></h3>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
			<td>ip</td>
		</tr>
		
		<%for(int i=0;i<boardList.size();i++){ 
				BoardDTO dto = (BoardDTO) boardList.get(i);
		%>
			<tr>
				<td><%=dto.getBno() %></td>
				<td>
					<a href="boardContent.jsp"><%=dto.getSubject() %></a>
				</td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getReadcount() %></td>
				<td><%=dto.getDate() %></td>
				<td><%=dto.getIp() %></td>
			</tr>
		<%} %>
	</table>
	<%
		/////////////////////////////////////////////////
		//페이징 처리 (2) - 다음페이지로 넘기는법
		
		if(count != 0){ //글이 있을 때
			//총 페이지 = 글개수(총량) / 페이지당 출력
			//=> 만약에 나머지가 있을 때 페이지 1개 추가
			
			//전체 페이지수
			int pageCount = (count/pageSize) + (count%pageSize==0? 0:1);
			
			//한 화면에 보여줄 페이지수
			int pageBlock = 3;
			
			//페이지블럭의 시작번호 1~10 =>1, 11~20=>11 21~30=>21
			int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			//페이지블럭의 끝번호
			int endPage = startPage+pageBlock-1;
			
			if(endPage > pageCount){
				endPage = pageCount;
			}
			//[이전]
			if(startPage > pageBlock){
				%>
					<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
				<%
			}
					
			
			//숫자(페이지링크) 1,2,3.....
			for(int i=startPage;i<endPage;i++){
				%>
					<a href="boardList.jsp?pageNum=<%=i%>"><%=i %></a>
				<%
			}
			
			//[다음]
			if(endPage<pageCount){
				%>
					<a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
				<%
			}
			
		}
		
		
		/////////////////////////////////////////////////
	%>
	
</body>
</html>