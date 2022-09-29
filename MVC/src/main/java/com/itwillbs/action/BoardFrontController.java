package com.itwillbs.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//컨트롤러  => 서블릿
@WebServlet("*.bo")
//@WebServlet("*.bo") : 주소가 ~~~~.bo 주소의 형태면 해당 컨트롤러 처리
public class BoardFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoradFrontController - doProcess() 호출");
		System.out.println(" Get/POST 방식 상관없이 한번에 처리");
		
		////////////////////1.가상주소계산//////////////////////
		//URI => 웹실행주소
		// URI => URL - (프로토콜, IP, PORT번호)
		
//		System.out.println(request.getRequestURI());
//		System.out.println(request.getRequestURL());
		
		System.out.println("C : 1단계시작 가상주소 계산 시작---------------");
		String requestURI = request.getRequestURI();
		System.out.println("C = requestURI : "+requestURI);
		
		String ctxPath = request.getContextPath();
		System.out.println("C = ctxPath : "+ctxPath);
		
		String command = requestURI.substring(ctxPath.length());
		System.out.println("C = command : "+command);
		
		System.out.println("C : 1단계끝 가상주소 계산 완료---------------");
		
		///////////////////2. 가상주소매핑//////////////////////
		System.out.println("C : 2단계시작 가상주소 매핑 시작---------------");
		
		ActionForward forward = null;
		
		if(command.equals("/BoardWrite.bo")) {
			System.out.println("C: /BoardWrite.bo 호출");
			System.out.println("C: [패턴1]DB사용X, view 페이지 이동");
			
			forward = new ActionForward();
			forward.setPath("./board/writeForm.jsp");
			forward.setRedirect(false);
		}
		
		
		System.out.println("C : 2단계끝 가상주소 매핑 완료---------------");
		
		
		////////////////////3. 페이지 이동/////////////////////
		System.out.println("C : 3단계시작 페이지 이동 시작---------------");
		
		if(forward != null) { //이동정보가 있을 때(티켓이 있을 때)
			if(forward.isRedirect() == true) {//true
				System.out.println("C: 이동방식 : "+forward.getPath());
				response.sendRedirect(forward.getPath());
			}else {//false
				System.out.println("C : 이동방식 : "+forward.isRedirect()+",");
				
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			
		}
		System.out.println("C : 3단계끝 페이지 이동 완료---------------");
	}
	
	
	//http://localhost:8088/MVC/board
	//http://localhost:8088/MVC/board2
	
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoradFrontController - doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoradFrontController - doPost() 호출");
		doProcess(request, response);
	}

	
}
