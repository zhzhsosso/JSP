package com.itwillbs.action;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.db.BoardDAO;
import com.itwillbs.db.BoardDTO;

public class BoardReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BoardReWriteAction_excute() 호출");
		
		//한글처리 생략
		
		//전달된 파라미터 pageNum bno re_ref re_lev re_sep subject name pass content
		String pageNum = request.getParameter("pageNum");
		
		BoardDTO dto = new BoardDTO();
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dto.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		dto.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		dto.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		
		dto.setSubject(request.getParameter("subject"));
		dto.setName(request.getParameter("name"));
		dto.setPass(request.getParameter("pass"));
		dto.setContent(request.getParameter("content"));
		
		dto.setIp(request.getRemoteAddr());
		
		//DAO 객체 생성
		BoardDAO dao = new BoardDAO();
		dao.reInsertBoard(dto);
		
		//페이지 이동(정보 저장)
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo?pageNum"+pageNum);
		forward.setRedirect(true);
		
		return forward;
	}

}
