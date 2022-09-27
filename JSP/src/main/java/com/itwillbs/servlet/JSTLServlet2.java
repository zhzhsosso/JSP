package com.itwillbs.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.MemberBean;

@WebServlet("/jstl2")
public class JSTLServlet2 extends HttpServlet {
	//http://localhost:8088/JSP/jstl2
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//MemberBean 객체를 사용해서 사용자 한명의 정보를 생성
		//사용자의 정보르 core_set2.jsp 페이지에서 출력
		//(id,pw,name,age,gender,email,reg_date)
		
		
		//회원정보 2개 더 생성 (총 3개) => ArrayList에 저장 => set2.jsp 출력(마지막회원정보만)
		ArrayList memberList = new ArrayList();
		
		for(int i=0;i<3;i++) {
			MemberBean mb2 = new MemberBean();
			mb2.setId("swaswa"+i);
			mb2.setPw("1234523"+i);
			mb2.setName("김사사"+i);
			mb2.setAge(20+i);
			mb2.setGender("여");
			mb2.setEmail("aas"+i+"df@naver.com");
			mb2.setRegdate(new Timestamp(System.currentTimeMillis()));
			
			memberList.add(mb2);
		}
		System.out.println(memberList);
		
		request.setAttribute("memberList", memberList);
		
		//forward 이동
		RequestDispatcher dis = request.getRequestDispatcher("./jstl/core_foreach.jsp");
		dis.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
