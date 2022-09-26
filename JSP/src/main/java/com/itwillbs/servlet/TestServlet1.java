package com.itwillbs.servlet;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class TestServlet1 extends HttpServlet{

	//http://localhost:8088/JSP/test1
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		
		//request 영역에 정보 저장
		request.setAttribute("cnt", 1000);
		
		//session 영역에 정보 저장
		// cnt - 2000
		HttpSession session = request.getSession();
		session.setAttribute("cnt", 2000);
		
		
//	1)response.setContentType("text/html; charset=UTF-8");
//	2)	PrintWriter out = response.getWriter();
//		out.print("<h1> HTML 메세지 작성하기222</h1>");
//		out.close();
		
	//3) forward 방식 - 포워딩
	//1. 페이지 이동시 주소 변경안됨, 화면 변경됨
	//2. request 내장객체 정보를 전달가능
		//<jsp:forward>(JSP 코드 x) 
		RequestDispatcher dis = request.getRequestDispatcher("./el/Attribute.jsp");
																//이동할 주소
		dis.forward(request, response);
	}
	
}
