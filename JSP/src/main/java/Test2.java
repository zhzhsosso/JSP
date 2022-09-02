import java.util.ArrayList;

public class Test2 {

	public static void main(String[] args) {
		// 컬렉션 : 자료구조를 자바 코드로 구현한 객체
		//		set계열, list 계열, map 계열
		
		//list계열 : 저장하는 데이터의 순서를 기억(index)
					//중복된 데이터를 저장가능
		
		//http://www.javatpoint.com/collections-in-java
		// ArrayList : 가변길이 배열(컬렉션)
		
		ArrayList list = new ArrayList();
		// => 가변길이 배열 생성
		
		
		
//		ArrayList list = new ArrayList();
		//=>타입 상관없이 모든 타입 저장가능(Object)
		//ArrayList<참조형타입> list = new ArrayList<참조형타입>();
		//=> 참조형 타입만 저장가능한 배열
		
		//배열에 데이터 입력하기
		//list[0]=10;
		list.add(list);
		list.add(1);
		list.add(2);
		list.add("미ㅏㅓ운ㅁㄴㅇ");
		list.add(30.1234);
		list.add(false);
		
		
		//배열에 데이터 사용하기
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		
		System.out.println("배열에 데이터 사용하기-------");
		
		
		//반복문 출력 - for
		for(int i=-0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		System.out.println("반복문 출력 ------------");
		
		
		//foreach문 (향상된 for문)
		for(Object num:list) {
			System.out.println(num);
		}
		
		// 래퍼클래스(wrapper)
		//기본형 데이터(객체x)->참조형 데이터
		//(8개)					(8개)
		/*
		 * boolean			Boolean
		 * char				Character
		 * byte				Byte
		 * short			Short
		 * int				Integer
		 * long				Long
		 * float			Float
		 * double			Double
		 * 
		 */
		
		//JDK 1.6 이후
		//오토박싱 : 기본형타입 -> 참조형타입
		// 오토언박싱 : 참조형타입 -> 기본형타입
		
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		list2.add(1);
		list2.add(2);
		list2.add(3);
		
		for(int num:list2) {
			System.out.println(num);
		}
	}

}
