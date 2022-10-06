package com.itwillbs.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.db.BoardDAO;

public class BoardListAction implements Action{//같은패키지이므로 import 안됨

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : BoardListAction_execute() 호출");
		
		//BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		
		//게시판 전체 글 개수 확인
		int cnt = dao.getBoardCount();
		System.out.println("M : 전체글개수 : "+cnt+"개");
		
		
	   /////////////////////////////////////////////////////////////////
       // 페이징 처리 (1)
       
       // 한 페이지에 보여줄 글의 개수 
       int pageSize = 5;
       
       // http://localhost:8088/JSP/board/boardList.jsp?pageNum=2
    		   
       // 현 페이지가 몇페이지 인지 확인
       String pageNum = request.getParameter("pageNum");
       if(pageNum == null){
    	   pageNum = "1";
       }
       
       // 시작행 번호 계산하기  1   11   21    31   41 .....
       int currentPage = Integer.parseInt(pageNum);
       int startRow = (currentPage-1)*pageSize+1;
       
       // 끝행 번호 계산하기  10   20   30   40  50.....
       int endRow = currentPage * pageSize;
       /////////////////////////////////////////////////////////////////
		
		
		
		
		
		//디비에 전체 글 리스트 가져오기
//		ArrayList boardListAll = dao.getBoardList();
		ArrayList boardListAll = dao.getBoardList(startRow,pageSize);
		
//		System.out.println("M : "+boardListAll); //내용 다찍힘 >느려짐
		
		
		/////////////////////////////////////////////////////////////////
		// 페이징 처리 (2)
//	    if(cnt != 0){ // 글이 있을때
		// 총 페이지 = 글개수(총량) / 페이지당 출력
		//    => 만약에 나머지가 있을때 페이지 1개 추가
		
		// 전체 페이지수 
		int pagecnt = (cnt/pageSize)+(cnt%pageSize==0? 0:1);
		
		// 한 화면에 보여줄 페이지수
		int pageBlock = 5;
		
		// 페이지블럭의 시작번호    1~10 => 1,  11~20 => 11  21~30 => 21
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 페이지블럭의 끝번호
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pagecnt){
		endPage = pagecnt; 
		}
//	    }
		/////////////////////////////////////////////////////////////////
		
		
		
		//직접 출력 => 위임(대신 출력) view .jsp 페이지에서 출력
		
		//Action => jsp 페이지 정보 전달 (request 영역객체 저장)
		request.setAttribute("boardListAll", boardListAll); //추가할때
//		request.setAttribute("boardListAll", dao.getBoardList()); //db그대로 출력할때
		
		
		//페이징처리 정보 저장
		request.setAttribute("totalCnt", cnt);
		request.setAttribute("PageNum", pageNum);
		request.setAttribute("PageCount", pagecnt);
		request.setAttribute("PageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		//페이지 이동준비(티켓생성)
		// ./board/boardList.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardList.jsp");
		forward.setRedirect(false);
		
		return forward;
	} 
	
	
}
