package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;

public class memberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberLoginAction_execute() 호출");
		//한글처리(생략)
		//전달정보 저장(id,pw)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//DAO 객체 생성 - 로그인 여부 체크메서드
		MemberDAO dao = new MemberDAO();
		dao.
		
		//체크 결과에 따른 페이지 이동(JS)
		
		return null;
	}

}
