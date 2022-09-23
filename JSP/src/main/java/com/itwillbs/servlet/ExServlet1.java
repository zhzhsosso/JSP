package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//class HttpServlet{
//}
//서블릿 2.3 이전

public class ExServlet1 extends HttpServlet {
	
	//http://localhost:8088/JSP/ex1
	// ^ ctrl키 누른상태로 클릭
	
	//alt shift s v > doGet, doPost 체크
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET() 호출!");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
	}

}
