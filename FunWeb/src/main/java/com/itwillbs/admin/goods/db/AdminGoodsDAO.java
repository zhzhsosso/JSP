package com.itwillbs.admin.goods.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class AdminGoodsDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 디비 연결해주는 메서드(커넥션풀)
	private Connection getConnection() throws Exception {
		// 1. 드라이버 로드 // 2. 디비연결

		// Context 객체 생성 (JNDI API)
		Context initCTX = new InitialContext();
		// 디비연동정보 불러오기 (context.xml 파일정보)
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/funweb");
		// 디비정보(연결) 불러오기
		con = ds.getConnection();

		System.out.println(" DAO : 디비연결 성공(커넥션풀) ");
		System.out.println(" DAO : con : " + con);

		return con;
	}

	// 자원해제 메서드-closeDB()
	public void closeDB() {
		System.out.println("DAO : 디비연결자원 해제");

		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 자원해제 메서드-closeDB()
	
	// 상품등록 메서드 - insertGoods(DTO)
	public void insertGoods(GoodsDTO dto) {
		//1. 상품번호 계산
		int gno = 0;
		
		try {
			//디비연결
			con = getConnection();
			
			//sql작성 & pstmt객체
			sql = "select max(gno) from itwill_goods";
			pstmt = con.prepareStatement(sql);
			
			//sql 실행
			rs = pstmt.executeQuery();
			
			//데이터처리
			if(rs.next()) {
				gno = rs.getInt(1) + 1;
			}
			
			System.out.println("DAO : gno :" + gno);
			
			//sql & pstmt
			sql = "insert into itwill_goods(gno,category,name,content,size,color, amount, price,image,best) values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			//??
			pstmt.setInt(1, gno);
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getSize());
			
			pstmt.setString(6, dto.getColor());
			pstmt.setInt(7, dto.getAmount()); 
			pstmt.setInt(8, dto.getPrice()); 
			pstmt.setString(9, dto.getImage()); 
			pstmt.setInt(10, dto.getBest());
			
			//실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 상품등록 완료");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// 상품등록 메서드
	
	//상품 전체 개수 확인 - getGoodsCount()
	public int getGoodsCount() {
		int cnt = 0;
		
		try {
			//1.2 디비연결
			con = getConnection();
			
			//3.sql
			sql = "select count(*) from itwill_goods";
			pstmt = con.prepareStatement(sql);
			
			//4. sql 실행
			rs = pstmt.executeQuery();
			
			//5. 데이터처리
			if(rs.next()) {
//				cnt = rs.getInt(1);
				cnt = rs.getInt("count(*)");
			}
			System.out.println("DAO: 전체 상품 개수 : "+cnt+"개");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return cnt;
	}
	//상품 전체 개수 확인 - getGoodsCount()
	
	// 글정보 가져오기 - getBoardList()
	public ArrayList getGoodsList() {
		System.out.println(" DAO : getGoodsList() 호출 ");
		// 글정보 모두 저장하는 배열
		ArrayList boardList = new ArrayList();
		
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. sql 작성(select) & pstmt 객체
			sql = "select * from itwill_goods";
			pstmt = con.prepareStatement(sql);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리(DB->DTO->List)
			while(rs.next()) {
				
				// DB -> DTO
				GoodsDTO dto = new GoodsDTO();
				dto.setGno(rs.getInt("gno"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setAmount(rs.getInt("amount"));
				dto.setBest(rs.getInt("best"));
				dto.setCategory(rs.getString("catecory"));
				dto.setColor(rs.getString("color"));
				dto.setPrice(rs.getInt("price"));
				dto.setSize(rs.getString("size"));
				dto.setImage(rs.getString("img"));
				
				// DTO -> List
				boardList.add(dto);
				
			}//while
			
			System.out.println(" DAO : 게시판 목록 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return boardList;
	}
	// 글정보 가져오기 - getBoardList()
	
	
	
}
