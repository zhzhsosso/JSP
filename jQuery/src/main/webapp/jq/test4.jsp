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
	    // html(),text()
	    var h = $('h2').html(); // 해당 대상(요소) 처음만나는 값을 1개 가져옴
	    alert(h);
	    var t = $('h2').text(); // 해당 대상(요소) 모든 값을 가져옴
	    alert(t);
	    
	    // 해당요소의 값을 변경(모두)
	    //$('h2').html('Hello Itwill');
	    //$('h2').text('Hello Itwill');
	    
	    // 전달되는 값이 HTML 태그의 경우
	    //$('h2').html('<h1>Hello Itwill'+t+'</h1>'); // 태그가 적용
// 	    $('h2').text('<h1>Hello Itwill</h1>'); // 태그가 적용 X,단순텍스트
	    
	    $('h2').html(function(idx,html){
	    	return html+"///"+idx+"@@@@@@@@@";
	    });
	    
	    
	    // append(), prepend()
	    $('body').append("추가!!!!!!!!!!!!!!!!!!!");
	    $('body').prepend("@@@@@@@@@@@@@@@@@@@@@@@@@");
	    
// 	    $('div').html(function(idx,html){
// 	    	return html+idx;
// 	    });
		$('div').append(function(i){
			return i;
		});
		
		
		// 배열(2차원배열 형태) => JSON타입 
		var arr =
			[
				{name:"학생1",addr:"부산"},
				{name:"학생2",addr:"울산"},
				{name:"학생3",addr:"서울"},
				{name:"학생4",addr:"제주"},
				{name:"학생5",addr:"대전"}
			];
		
		$('tr').append("<tr><td>"+arr[0].name+"</td><td>"+arr[0].addr+"</td></tr>");
		
		
		
		
	    
   });
</script>
</head>
<body>
   <h1>test4.jsp</h1>
	
	<h2>head-0</h2>
	<h2>head-1</h2>
	<h2>head-2</h2>
	<h2>head-3</h2>
	<h2>head-4</h2>
	
	<hr>
	<div>div</div>
	<div>div</div>
	<div>div</div>
	<div>div</div>
	<div>div</div>
	
	<hr>
	<table border="1">
	    <tr>
	       <td>이름</td>
	       <td>주소</td>
	    </tr>
	    
	</table>
	
	<hr>
	<h3 style="background: red">item-0</h3>
	
	
	
	

</body>
</html>
