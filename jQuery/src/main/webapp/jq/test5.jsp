<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.1.js"></script>
<script type="text/javascript">
    /*
      AJAX란 비동기 자바스크립트와 XML 
             (Asynchronous JavaScript And XML)을 말합니다
             
      동기화 <-> 비동기화
      
      동기 : 서버의 데이터와 클라이언트의 데이터를 동일하게 만드는 작업
       (화면 전환 O)
      
      비동기 : 서버의 데이터와 클라이언트의 데이터를 동일하게 만드는 작업
      (화면 전환 X)
      
    */
	$(function(){
		
// 		$('input').click(function(){
// 			// 비동기방식 처리
// 			//$.ajax("test.jsp");
// 			$.ajax({
// 				url:"test.jsp",
// 				data: {name:"홍길동",tel:"010-1234-1234"} ,
// 				success:function(data){
// 					//alert('ajax 성공!');
// 					//alert(data);
// 					$('body').append(data);
// 				},
// 				error:function(){
// 					alert('ajax 실패!');
// 				},
// 				complete: function(){
// 					//alert(" ajax 완전 끝 ");
// 				}
// 			});
// 		});//click
		
		
		$('#btnNews').click(function(){
			alert("뉴스 정보 가져오기");
			
			$.ajax({
				url: "https://fs.jtbc.co.kr//RSS/sports.xml",
				success:function(data){
					alert("성공");
// 					console.log(data);
					$(data).find('items').each(function(){
						$('body').append("<img src='https://photo.jtbc.co.kr/new....")
						$('body').append("<a href='"+$(this).find('link').text()+"'>"+$(this).find('title').text()+"</a>")
					});
				}				
			});
			
			
		});
	
	});//jquery
</script>	

</head>
<body>
	<h1>test5.jsp</h1>
	<input type="button" value=" 정보 불러오기 ">
	
	<input type="button" id="btnNews" value=" 뉴스 정보 불러오기 ">
	
	
	
</body>
</html>