<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//선택자
		$('h2').css('color','RED');
		$('*').css('color','blue');
		$('.title1').css('color','orange');
		$('#title2').css('color','pink');
		
		//jQuery - 아이디값 가져오기
		alert($('input').value);
		
		
		
		//위치탐색 선택자
		$('tr:odd').css('background','red');
		$('tr:even').css('background','blue');
		$('tr:first').css('background','yellow');
		
	});

</script>
</head>
<body>
	<h1>test2.jsp</h1>
	<h2 class="title1">제목1</h2>
	<h2 id="title2">제목2</h2>
	
	<form action="">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="id"><br>
	</form>
	
	<hr>
	
	<table border="1">
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
	</table>
</body>
</html>