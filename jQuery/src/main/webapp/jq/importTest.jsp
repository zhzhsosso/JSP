<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	var IMP = window.IMP;
	IMP.inti("imp07884015");// 가맹점 식별코드
	
	function requestPay() {
	      IMP.request_pay({ 
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: "ORD20180131-0000011",   //주문번호
	          name: "노르웨이 회전 의자",
	          amount: 0,                         // 숫자타입
	          buyer_email: "gildong@gmail.com",
	          buyer_name: "홍길동",
	          buyer_tel: "010-4242-4242",
	          buyer_addr: "서울특별시 강남구 신사동",
	          buyer_postcode: "01181"
	      }, function (rsp) { // callback
	          if (rsp.success) {
	              // 결제 성공 시 로직,
	           	alert('걸제 성공!');
	            
	          } else {
	              // 결제 실패 시 로직,
				alert('결제 실패!');
	            console.log(rsp);
	             
	          }
	      });
	    }
</script>
</head>
<body>
	<h1> importTest.jsp </h1>
	<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>