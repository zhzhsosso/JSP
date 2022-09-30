package com.itwillbs.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 생성자
		public BoardDAO() {
			System.out.println(" DAO : BoardDAO() 객체 생성 ");
			System.out.println(" DAO : itwill_board 테이블 접근준비 완료 ");
		}

		// 디비 연결해주는 메서드
		private Connection getConnection() throws Exception {
			// 디비연결정보 (상수)
			final String DRIVER = "com.mysql.cj.jdbc.Driver";
			final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
			final String DBID = "root";
			final String DBPW = "1234";

			// 1. 드라이버 로드
			Class.forName(DRIVER);
			// 2. 디비 연결
			con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println(" DAO : 디비연결 성공 ");
			System.out.println(" DAO : " + con);

			return con;
		}
		
		// 자원해제 메서드-closeDB()
		public void closeDB() {
			System.out.println("DAO : 디비연결자원 해제");
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 자원해제 메서드-closeDB()
		
		//글쓰기 메서드 -  insertBoard(DTO)
		public void insertBoard(BoardDTO dto) {
			int bno = 0;
			
			try {
				//디비연결
				con = getConnection();
				
				//sql작성 & pstmt객체
				sql = "select max(bno) from itwill_board";
				pstmt = con.prepareStatement(sql);
				
				//sql 실행
				rs = pstmt.executeQuery();
				
				//데이터처리
				if(rs.next()) {
					bno = rs.getInt(1) + 1;
				}
				
				System.out.println("DAO : bno :" + bno);
				
				//sql & pstmt
				sql = "insert into itwill_board(bno,name,pass,subject,content, readcount, re_ref,re_lev,re_seq,date,ip,file) values(?,?,?,?,?,?,?,?,?,now(),?,?)";
				
				pstmt = con.prepareStatement(sql);
				
				//??
				pstmt.setInt(1, bno);
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPass());
				pstmt.setString(4, dto.getSubject());
				pstmt.setString(5, dto.getContent());
				
				pstmt.setInt(6, 0);//조회수 0
				pstmt.setInt(7, bno); //ref == bno
				pstmt.setInt(8, 0); //lev 0
				pstmt.setInt(9, 0); //seq 0 
				pstmt.setString(10, dto.getIp());
				pstmt.setString(11, dto.getFile());
				
				//실행
				pstmt.executeUpdate();
				
				System.out.println("DAO : 글쓰기 완료");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}
		//글쓰기 메서드 -  insertBoard(DTO)
	
}
