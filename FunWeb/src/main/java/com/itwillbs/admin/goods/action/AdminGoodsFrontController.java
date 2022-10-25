package com.itwillbs.admin.goods.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.ag")
public class AdminGoodsFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : doProcess()");
		
		// 1. 가상주소 계산
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI : "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" C : ctxPath : "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" C : command : "+command);
		
		System.out.println(" C : 1. 가상주소 계산 끝 \n");
		Action action = null;
		ActionForward forward = null;
		
		// 2. 가상주소 매핑(패턴1,2,3)
		if(command.equals("/AdminGoodsAdd.ag")) {
			System.out.println(" C : /AdminGoodsAdd.ag 호출");
			System.out.println(" C : 패턴1");
			
			forward = new ActionForward();
			forward.setPath("./center/admin_goods_write.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/AdminGoodsAddAction.ag")) {
			System.out.println("C : /AdminGoodsAddAction.ag 호출");
			System.out.println("C : 패턴2");
			
			//AdminGoodsAddAction() 객체 생성
			action = new AdminGoodsAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/AdminGoodsList.ag")) {
			System.out.println("C : /AdminGoodsList.ag 호출");
			System.out.println("C : 패턴3");
			
			action = new AdminGoodsListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(command.equals("/adminGoodsModify.ag")) {
			System.out.println("C : /adminGoodsModify.ag 호출");
			System.out.println("C : 패턴 3");
			
			//adminGoodsModifyAction()
			action = new adminGoodsModifyAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		else if(command.equals("/AdminGoodsModifyPro.ag")) {
			System.out.println("C : /AdminGoodsModifyPro.ag 호출");
			System.out.println(" C : 패턴 2");
			
			//AdminGoodsModifyProAction
			action = new AdminGoodsmodifyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/adminGoodsRemove.ag")) {
			System.out.println("C : /adminGoodsRemove.ag 호출");
			System.out.println("C : 패턴2");
			
			//adminGoodsRemoveAction
			action = new AdminGoodsRemoveAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		System.out.println("C : 2. 가상주소 매핑 끝");
		
		
		// 3. 페이지 이동	
		if(forward != null) {
			if(forward.isRedirect()) { // true
				System.out.println(" C : sendRedirect() : "+forward.getPath());
				response.sendRedirect(forward.getPath());
			}else { // false
				System.out.println(" C : forward() : "+forward.getPath());
				RequestDispatcher dis  
				      = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			System.out.println(" C : 3. 페이지 이동 끝 \n");
		}
	}		
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : doPost()");
		doProcess(request, response);
	}

}
