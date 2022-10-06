package com.itwillbs.action;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.db.BoardDAO;
import com.itwillbs.db.BoardDTO;

public class BoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BoardContentAction_execute() 호출");
		
		//전달정보(파라메터) 저장
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		
		System.out.println("M :bno : " +bno+", pageNum : "+pageNum);
		
		//DAO 객체 생성
		BoardDAO dao = new BoardDAO();
		//글 조회수 1증가 -> DAO 1증가 메서드 호출
		dao.updateReadcount(bno);
		System.out.println("M : 조회수 1증가 완료!");
		
		//글번호에 해당 글 정보를 가져오기
		BoardDTO dto = dao.getBoard(bno);
		
		//request 영역에 글정보를 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		//패이지 이동(준비)
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardContent.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
