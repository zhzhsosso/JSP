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
 		
//  		$.ajax({
//  			url:"test.json",
//  			dataType:"json",
//  			success:function(data){
//  				alert("성공");
//  				console.log(data);
//  				$('body').append(data.name);
//  				$('body').append(data.addr);
//  				$('body').append(data.tel);
//  			}
 			
//  		});

			$.getJSON("test.json",function(data){
				console.log(data);
				//각각에 접근
				$(data).each(function(idx,item){
					//idx : 번호, item: 내용
					//table태그에 추가하겠다
					$('table').append("<tr> <td>"+item.name+"</td> <td>"+item.addr+"</td> <td>"+item.tel+"</td> </tr>");
				});
			});
 	});
</script>
</head>
<body>
	<h1>test6.jsp</h1>
	
	<table>
		<tr>
			<td>이름</td>
			<td>주소</td>
			<td>전화번호</td>
		</tr>
	</table>
	
</body>
</html>