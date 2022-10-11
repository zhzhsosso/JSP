<%@page import="com.itwillbs.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardList.jsp</h1>
	<!-- 전달된 정보 확인 -->
	
<%-- 	<%=request.getAttribute("boardListAll") %> --%>
<%-- 	${requestScope.boardListAll } --%>

	<h3><a href="./BoardWrite.bo">글쓰기 (얘드라글좀써라)</a></h3>
	<h3><a href="./BoardFileWrite.bo">파일업로드 글쓰기 (얘드라글좀써라)</a></h3>
	
	
	<h3>전체 글 개수 : ${requestScope.totalCnt } 개</h3>
	
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>조회수</td>
			<td>작성일</td>
			<td>ip</td>
		</tr>
		<c:forEach var ="dto" items="${boardListAll }">
			<tr>
				<td>${dto.bno }</td>
				<td>
					<c:if test="${dto.re_lev > 0}">
						<img src="./img/level.gif" width="${dto.re_lev * 10 }">
						<img src="./img/re.gif">
					</c:if>
					<a href="./BoardContent.bo?bno=${dto.bno }&pageNum=${pageNum}">
						${dto.subject }
						<c:if test="${dto.file != null }">
							<img src="./img/save.png" width="15" height="15">
						</c:if>
					</a>
				</td>
				<td>${dto.name }</td>
				<td>${dto.readcount }</td>
				<td>${dto.date }</td>
				<td>${dto.ip }</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:if test="${totalCnt !=0 }">
		<!-- 이전 -->
		<c:if test="${startPage > pageBlock }">
			<a href="./BoardList.bo?pageNum=${startPage-pageBlock }">[이전]</a>
		</c:if>
		
		<!-- 숫자 페이지번호 -->
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<a href="./BoardList.bo?pageNum=${i }">${i }</a>
		</c:forEach>
		
		<!-- 다음 -->
		<c:if test="${endPage < pageCount }">
			<a href="./BoardList.bo?pageNum=${startPage+pageBlock }">[다음]</a>
		</c:if>
	</c:if>
	
</body>
</html>