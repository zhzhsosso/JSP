<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<tr><td>15</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>14</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>13</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>12</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>11</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>10</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>9</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>8</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>7</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>6</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>5</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>4</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>3</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>2</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>
<tr><td>1</td><td class="left">Vivanus viveer portitor commodo.</td>
    <td>Host Admin</td><td>2012.11.06</td><td>15</td></tr>    
</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">
<a href="#">Prev</a>
<a href="#">1</a><a href="#">2</a><a href="#">3</a>
<a href="#">4</a><a href="#">5</a><a href="#">6</a>
<a href="#">7</a><a href="#">8</a><a href="#">9</a>
<a href="#">10</a>
<a href="#">Next</a>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
 	<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>