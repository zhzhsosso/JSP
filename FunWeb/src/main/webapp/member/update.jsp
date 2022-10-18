<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 <script type="text/javascript">
 	function checkPw(){
 		alert('데이터 유효성체크 완료');
 		
 		// 비밀번호 입력 x -> submit (x)
 		var pw = document.forms[0].pw.value;
 		//alert(pw);
 		if(pw == ""){
 			alert('비밀번호를 입력해주세요.');
 			document.fr.pw.focus();
 			return false;
 		}
 		
 	}
 
 
 </script>
 
 
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"/>
	<!-- 추가할 페이지를 컴파일후 페이지를 추가 -->
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
	<article>
			<h1>회원 정보 수정</h1>
			<form action="./MemberUpdatePro.me"  method="post" id="join" 
			      name="fr"  onsubmit=" return checkPw(); ">
				<fieldset>
					<legend>기본정보</legend>
					<label>아이디</label> <input type="text" name="id" class="id" value="${dto.id }" readonly><br>
					<label>비밀번호</label> <input type="password" name="pw"><br>
					<label>이 름</label> <input type="text" name="name" value="${dto.name }"><br>
					<label>E-Mail</label> <input type="email" name="email" value="${dto.email }" readonly><br>
					<label>주소</label> <input type="text" name="addr" value="${dto.addr }"><br>
					<label>연락처</label> <input type="text" name="tel" value="${dto.tel }"><br>
					<label>생년월일</label> 
					    <select name="birth">
					       <option value="${dto.birth.split('-')[0] }">${dto.birth.split("-")[0] }년</option>
					       <c:forEach var="y" begin="2000" end="2022" step="1">
					       		<option value="${y }">${y }년</option>
					       </c:forEach>
					    </select>
					     <select name="birth">
					       <option value="${dto.birth.split('-')[1] }">${dto.birth.split('-')[1] }월</option>
					       <c:forEach var="m" begin="1" end="12" step="1">
					       		<option value="${m }">${m }월</option>					       
					       </c:forEach>
					    </select>
					     <select name="birth">
					       <option value="${dto.birth.split('-')[2] }">${dto.birth.split('-')[2] }일</option>
					        <c:forEach var="d" begin="1" end="31" step="1">
					       		<option value="${d }">${d }일</option>					       
					       </c:forEach>
					    </select>
					<hr>
					<label>성별</label> 
					    <input type="radio" name="gender" value="남" 
					      <c:if test="${dto.gender == '남' }">
					         checked
					      </c:if>
					    >남 
					    <input type="radio" name="gender" value="여" 
					      <c:if test="${dto.gender == '여' }">
					         checked
					      </c:if>
					    >여 
					<br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="회원수정" class="submit">
					<input type="reset" value="초기화" class="cancel">
				</div>
			</form>
		</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>