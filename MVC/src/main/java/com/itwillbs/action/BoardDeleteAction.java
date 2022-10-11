package com.itwillbs.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.db.BoardDAO;
import com.itwillbs.db.BoardDTO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BoardDeleteAction_excute() 호출");
		
		
		//전달된 파라미터 bno pass pageNum
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pass = request.getParameter("pass");
		String pageNum = request.getParameter("pageNum");
		
		//BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		
		//db에 저장된 수정할 글번호를 가져와서 
		int result = dao.deleteBoard(bno,pass);
		
		//결과에 따른 페이지 이동(js)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(result == 1) {
			out.print("<script>");
			out.print("alert('게시판 글 삭제 완료');");
			out.print("location.href='./BoardList.bo?pageNum="+pageNum+"';");
			out.print("</script>");
			out.close();
			
			return null;
		}else if(result == 0) {
			out.print("<script>");
			out.print("alert('비밀번호 오류');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null;
		}else {
			out.print("<script>");
			out.print("alert('글없음');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
		
	}

}
