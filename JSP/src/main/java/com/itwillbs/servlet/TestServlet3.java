package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.test.Person;
import com.itwillbs.test.Phone0;

@WebServlet("/test3")
public class TestServlet3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//[/test3] 가상주소 사용하여 실행
		//http://localhost:8088/JSP/test3
		
		//Person 객체 정보 생성후 저장해서 전달
		Person p = new Person();
		Phone0 iPhone = new Phone0();
		iPhone.
		//Person - com.itwill.test 패키지에 생성됨
		//이름, 나이, 휴대폰
		//휴대폰 - 모델명, 전화번호
		
		//"김학생" 20 아이폰14 010-1234-5678
		p.setName("김학생");
		p.setAge(30);
		p.setP(iPhone);
		
		//request 영역 저장
		request.setAttribute("Person", p);
		
		// ./el/Beans.jsp 이동후 출력(jsp/el)
		RequestDispatcher dis = request.getRequestDispatcher("./el/Beans.jsp");
		
		dis.forward(request, response);
	}

}
