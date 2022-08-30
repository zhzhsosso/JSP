package com.itwillbs.test;

//데이터 -> 저장 -> 변수
//코드 -> 저장 -> 메서드
//데이터(같은형태,여러개) -> 저장 -> 배열

//객체 - 1) 속성 (명사)-변수	2) 동작(동사)-메서드
//클래스: 객체를 생성하기위한 자바코드(설계도)
// => 사용자정의 타입

// 붕어빵틀 -> 가열 -> 붕어빵
// 클래스 -> 메모리에 올리기 -> 객체(인스턴스)

public class TestClass {
	/*
	 * 클래스 영역 - 변수, 메서드 선언
	 */
	int age; //객체의 속성 (변수)
	
	public int getAge() {	//객체의 동작(메서드)
		return age;
	}
	
	
	public static void main(String[] args) {
		//객체생성
		Phone p1 = new Phone();
//		p1.model = "폴드4";
		p1.setModel("폴드4");
		p1.color = "black";
		p1.price = 100;
		
		System.out.println(p1.getModel()+"의 가격은 "+p1.price+"입니다.");
//		Phone p2 = new Phone();
////		p2.model = "아이폰14";
//		p2.color = "white";
//		p2.price = 200;
//		
//		Phone p3 = new Phone();
////		p3.model = "z플립4";
//		p3.color = "green";
//		p3.price = 150;
	}
	
}


//휴대폰(Phone) 객체 - 모델명(model), 색상(color), 가격(price)
class Phone{
	//캡슐화
	private String model;
	String color;
	int price;
	
	//메서드
	// alt shift s + r
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
}


class ATM{ //계좌정보
	//private(접근지정자/제어자)는 클래스 안에서만 사용가능
	private int money; //잔액
	
	//alt shift s +r => setter(), getter() 생성
	//=> 은행원
	
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
}
