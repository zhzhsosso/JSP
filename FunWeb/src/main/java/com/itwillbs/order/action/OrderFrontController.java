package com.itwillbs.order.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.or")
public class OrderFrontController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(" C : doProcess() 호출 ");

		// 1. 가상주소 계산
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI : " + requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" C : ctxPath : " + ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" C : command : " + command);

		System.out.println(" C : 1. 가상주소 계산 끝 \n");
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/OrderStart.or")) {
			System.out.println(" C : /OrderStart.or 호출");
			System.out.println(" C : [패턴3] ");
			
			// OrderStartAction()
			action = new OrderStartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/OrderAddAction.or")) {
			System.out.println(" C : /OrderAddAction.or 호출 ");
			System.out.println(" C : [패턴2] ");
			
			//OrderAddAction()
			action = new OrderAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		System.out.println(" C : 2. 가상주소 매핑 끝");
		
		// 3. 페이지 이동
		if (forward != null) {
			if (forward.isRedirect()) { // true
				System.out.println(" C : sendRedirect() : " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else { // false
				System.out.println(" C : forward() : " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			System.out.println(" C : 3. 페이지 이동 끝 \n");
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(" C : doGet() ");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(" C : doPost() ");
		doProcess(request, response);
	}

}
