package com.itwillbs.basket.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BasketDAO {
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
	
	//기존의 장바구니 체크 - checkBasket()
	public boolean checBasket(BasketDTO dto) {
		boolean result = false;
		
		try {
			con = getConnection();
			
			sql="select * from itwill_basket"
					+ "where b_m_id=? and b_g_num=? and b_g_size=? && b_g_color=?"; //동일상품 정보 체크
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getB_m_id());
			pstmt.setInt(2, dto.getB_g_num());
			pstmt.setString(3, dto.getB_g_size());
			pstmt.setString(3, dto.getB_g_color());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//기존 동일상품 존재 -> 수량만 수정
				sql = "update itwill_basket set b_g_amount=b_g_amount+?"
						+"where b_m_id=? and b_g_num=? and b_g_size=? && b_g_color=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getB_g_amount());
				pstmt.setString(2, dto.getB_m_id());
				pstmt.setInt(3, dto.getB_g_num());
				pstmt.setString(4, dto.getB_g_size());
				pstmt.setString(5, dto.getB_g_color());
				
				int tmp = pstmt.executeUpdate();
				if(tmp == 1) {
					result = true;
				}
			}
			System.out.println("DAO : result "+(result? "기존의 정보 수정":"기존의 상품 없음"));
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
	}
	//기존의 장바구니 체크 - checkBasket()
	
	//장바구니 상품 추가 - basketAdd(DTO)
	public void basketAdd(BasketDTO dto) {
		
		int b_num = 0;
		try {
			con=getConnection();
			//1) 장바구니 번호 b_num
			sql="select max(b_num) from itwill_basket";
			pstmt = con.prepareStatement(sql);
			pstmt.executeQuery();
			
			if(rs.next()) {
				b_num = rs.getInt(1)+1;
			}
			
			//2) 장바구니 저장(insert)
			sql="insert into itwill_basket(b_num,b_m_id,b_g_num,b_g_amount,b_g_size,b_g_color) "
					+ "values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, b_num);
			pstmt.setString(2, dto.getB_m_id());
			pstmt.setInt(3, dto.getB_g_num());
			pstmt.setInt(4, dto.getB_g_amount());
			pstmt.setString(5, dto.getB_g_size());
			pstmt.setString(6, dto.getB_g_color());
			
			rs = pstmt.executeQuery();
			
			System.out.println(" DAO :장바구니 등록완료!");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
	}
	//장바구니 상품 추가 - basketAdd(DTO)
	
	//장바구니 목록 조회 - getBasketList(id)
	public Vector getBasketList(String id){
		Vector totalList = new Vector();
		List basketList = new ArrayList();
		List goodsList = new ArrayList();
		
		try {
			con = getConnection();
			
			//sql - id 값에 해당하는 장바구니 정보 조회
			sql = "select * from itwill_basket where b_m_id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//장바구니 정보 저장
				//DB -> DTO -> List
				
					//장바구니 상품에 해당하는 상품정보 조회
					//DB -> DTO -> List
			}//while
			//totalList 저장
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalList;
	}
	//장바구니 목록 조회 - getBasketList(id)
}
