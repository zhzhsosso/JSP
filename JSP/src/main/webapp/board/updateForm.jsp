<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.itwillbs.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//수정하기 버튼
	function check(){
		alert("체크함수 실행!");
		//비밀번호 입력 x > 비밀번호를 입력하세요 출력
		// 페이지 이동 금지
		var pass = document.fr.pass.value;
		
		if(pass == ""){
			alert("비밀번호를 입력하세요!");
			document.fr.pass.focus();

			return false;
		}
	}
</script>
</head>
<body>
	<h1>updateForm.jsp</h1>
	<%
		//기존의 글정보가 화면에 출력
		//글정보(bno), 페이지정보(pageNum)
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		
		//dao 객체생성
		BoardDAO dao = new BoardDAO();
		
		//글정보 가져오는 메서드 호출
		dao.getBoard(bno);
		BoardDTO dto = dao.getBoard(bno);
	%>
	
	<fieldset>
		<form action="updatePro.jsp?pageNum<%=pageNum %>" method="post" onsubmit="return check();" name="fr">
			<input type="hidden" name="bno" value="<%=dto.getBno() %>"><br>
			제목 : <input type="text" name="subject" value="<%=dto.getSubject()%>"><br>
			작성자 : <input type="text" name="name" value="<%=dto.getName()%>"><br>
			비밀번호 : <input type="password" name="pass" placeholder="비밀번호를 입력하세요"><br>
			내용 : <textarea rows="10" cols="20" name="content" ><%=dto.getContent()%></textarea>
			<hr>
			<input type="submit" value="글 수정하기">
			
		</form>
	</fieldset>
</body>
</html>