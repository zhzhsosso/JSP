package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	//DAO : 데이터 처리 객체
	//공통변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	//생성자
	public BoardDAO() {
		System.out.println("DAO : 생성자 호출(객체 생성)");
		System.out.println("DAO : DB연결에 대한 모든 처리 준비 완료");
	}
	
	//디비 연결메서드
	private Connection getConnection() throws Exception {
		//디비연결정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		//1.드라이브 로드
		Class.forName(DRIVER);
		
		//2. 디비 연결
		con = DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("DAO : 디비연결 성공");
		System.out.println("DAO : "+con);
		return con;
	}
	
	
	//글쓰기 메서드 - insertBoard()
	public void insertBoard(BoardDTO dto) {
		System.out.println("DAO : insertBoard() 호출");
		
		int bno=0;	//글번호 저장
		//디비연결
		try {
			// 디비연결
			con = getConnection();
			// sql작성 & pstmt 객체
			sql="select max(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			// sql 실행
			rs = pstmt.executeQuery();
			// 데이터 처리(글 번호 계산 : 번호최대값 + 1)
			//rs.next() - true/false 구분
			//=> 워크벤치에 실행(select)
			//		결과 |> (삼각형 커서) : true(커서이동가능, sql null상관없음)
			//		결과 * , 커서x : false (커서 이동 불가능)
			
			if(rs.next()) {
//				bno = rs.getInt("max(bno)")+1;	//컬럼명
				bno = rs.getInt(1)+1;	//컬럼인덱스
				// => rs.getInt() : 리턴데이터의 값이 sql-null인 경우 0 리턴
			}
//			else {
//				bno =1;//else 필요없음
//			}
			
			System.out.println("DAO : 글번호="+bno);
			
			//sql 작성(insert) & pstmt 객체
			sql = "insert into itwill_board(bno,name,pass,subject,content,"
					+"readcount,re_ref,re_lev,re_seq,date,ip,file)"
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			
			//??
			pstmt.setInt(1, bno);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			
			pstmt.setInt(6, 0);		//조회수 0 초기화
			pstmt.setInt(7, bno);	// ref 그룹번호(bno 초기화)
			pstmt.setInt(8, 0);		// lev 들여쓰기(0 초기화)
			pstmt.setInt(9, 0);		// seq 순서(0 초기화)
			
			pstmt.setString(10, dto.getIp());
			pstmt.setString(11, dto.getFile());
			
			
			
			//sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 게시판 글쓰기 완료");
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//글쓰기 메서드 - insertBoard()
	
	
	//글정보 가져오기 - getBoardList()
	public ArrayList getBoardList() {
		System.out.println("DAO : getBoardList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList boardList = new ArrayList();
		
		
		try {
			//디비연결
			con=getConnection();
			//sql작성 & pstmt 객체
			sql="select * from itwill_board";
			pstmt = con.prepareStatement(sql);
			//sql 실행
			rs = pstmt.executeQuery();
			//데이터 처리(DB->DTO->List)
			while(rs.next()) {
				
				//DB->DTO
				BoardDTO dto = new BoardDTO();
				dto.setBno(rs.getInt("bno"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getDate("date"));
				dto.setFile(rs.getString("file"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRe_lev(rs.getInt("re_lev"));
				dto.setRe_ref(rs.getInt("re_ref"));
				dto.setRe_seq(rs.getInt("re_seq"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));
				dto.setIp(rs.getString("ip"));
				
				//DTO -> List
				boardList.add(dto);
				
			}//while
			
			System.out.println("DAO : 게시판 목록 저장완료");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return boardList;
	}
}
