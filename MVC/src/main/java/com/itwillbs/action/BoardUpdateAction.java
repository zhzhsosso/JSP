package com.itwillbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.db.BoardDAO;
import com.itwillbs.db.BoardDTO;

public class BoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BoardUpdateAction_excute() 호출");
		
		
		//페이지 전달정보 저장
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		
		//BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		
		//db에 저장된 수정할 글번호를 가져와서 
		BoardDTO dto = dao.getBoard(bno);
		
		//request 영역에 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		
		//view출력 (./board/updateForm.jsp)
		//페이지 이동(티켓)
		ActionForward forward = new ActionForward();
		forward.setPath("./board/updateForm2.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
