package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test2")
public class TestServlet2 extends HttpServlet {
	//http://localhost:8088/JSP/test2
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//배열
		//String[] foods
		String[] foods = {"햄버거","피자","서브웨이","돈까스","초밥"};
		
		//배열정보를 request 영역에 저장
		request.setAttribute("foods", foods);
		
		// 스포츠종류를 ArrayList 저장
		List sports = new ArrayList();
		
		sports.add("축구");
		sports.add("축구");
		sports.add("축구");
		sports.add("축구");


		
		// forward방식 이동 - ./el/Arrays.jsp
		RequestDispatcher dis = request.getRequestDispatcher("./el/Array.jsp");
		dis.forward(request, response);
	}
	
}
