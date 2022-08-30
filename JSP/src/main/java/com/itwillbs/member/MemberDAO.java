package com.itwillbs.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	//DAO(Data Access Object : 데이터 처리객체
	
	//공통으로 사용할 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public MemberDAO() {
		System.out.println("DAO : 생성자 호출(객체 생성)");
		System.out.println("DAO : DB연결에 대한 모든 처리 준비 완료");
	}
	
	//디비 연결해주는 메서드
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
	
	//정보조회 메서드()
	/**
	 * 
	 * JavaDoc 주석 : 문법에 대한 설명을 작성하는 주석문
	 * 이 메서드는 로그인정보(id)를 입력받아서
	 * id에 해당하는 정보 모두를 조회 후 MemberBean 객체에 담아서 리턴하는 메서드 입니다
	 * 
	 */
	public MemberBean getMember(String id) throws Exception{
		//db에서 정보 조회(select) -> MemberBean 객체 만들기
		//한글처리
		
		//db에서 필요한 정보 가져오기
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		//1.드라이버 로드
		Class.forName(DRIVER);
		
		//2.디비 연결
		Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
		
		//3.sql작성 & pstmt 객체
		String sql = "select * from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//???
		pstmt.setString(1, id);
		
		//4.sql 실행
		ResultSet rs = pstmt.executeQuery();
		
		
		//MemberBean mb = new MemberBean();
		MemberBean mb = null;
		//5. 데이터처리
		if(rs.next()){
			//회원정보 저장 (MemberBean)
			//rs(DB정보) -> MemeberBean
			mb = new MemberBean();
			
			mb.setAge(rs.getInt("age"));
			mb.setEmail(rs.getString("email"));
			mb.setGender(rs.getString("gender"));
			mb.setId(rs.getString("id"));
			mb.setName(rs.getString("name"));
			mb.setPw(rs.getString("pw"));
			mb.setRegdate(rs.getTimestamp("regdate"));
		}
		
		//MemberBean 객체 생성완료
		System.out.println("정보 조회 완료! mb리턴!");
		return mb;
	}//정보 조회 메서드
	
	//정보 수정동작()
	public int updateMember(MemberBean umb) {
		//[1]-정상수정, [0]-비밀번호 오류, [-1]-회원정보 없음
		int result = -1;
		
		try {
			//1. 드라이버 로드
			//2. 디비연결
			con = getConnection();
			//3. sql작성(select) & pstmt 객체
			// 본인여부 체크
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			//??
			pstmt.setString(1, umb.getId());
			
			//4. sql 실행
			rs = pstmt.executeQuery();
			
			//5. 데이터 처리
			if(rs.next()) {
				//비밀번호가 있다(회원)
				if(umb.getPw().equals(rs.getString("pw"))) {
					//본인 -> 정보수정
					//3. sql 작성(update - 이름 나이 성별을 수정하는 구문)
					sql = "update itwill_member set name=?,age=?,gender=? where id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, umb.getName());
					pstmt.setInt(2, umb.getAge());
					pstmt.setString(3, umb.getGender());
					pstmt.setString(4, umb.getId());
					
					//4. sql 실행
					pstmt.executeUpdate();
					
					result = 1;
				}else {
					//비밀번호 오류
					result = 0;
				}
				
			}else {
				//비밀번호가 없다(비회원)
//				return -1;
				result = -1;
			}
			
			System.out.println("DAO : 정보 삭제완료 ("+result+")");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}//정보 수정동작
	
	
	//정보 삭제동작()
	public int memberDelete(String id,String pw) {
		//[1]-정상삭제, [0]-비밀번호 오류, [-1]-회원정보 없음
		int result = -1;
		
		try {
			//1. 드라이버 로드
			//2. 디비연결
			con = getConnection();
			//3. sql작성(select) & pstmt 객체
			// 본인여부 체크
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			//??
			pstmt.setString(1, id);
			
			//4. sql 실행
			rs = pstmt.executeQuery();
			
			//5. 데이터 처리
			if(rs.next()) {
				//비밀번호가 있다(회원)
				if(pw.equals(rs.getString("pw"))) {
					//본인 -> 정보삭제
					//3. sql 작성(delete) 
					sql = "delete from itwill_member where id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					
					//4. sql 실행
					result = pstmt.executeUpdate();
					//=> executeUpdate():sql구문(insert,update,delete)
					//실행했을때 테이블에 영향을 준 row수를 리턴
//					result = 1;
				}else {
					//비밀번호 오류
					result = 0;
				}
				
			}else {
				//비밀번호가 없다(비회원)
//					return -1;
				result = -1;
			}
			
			System.out.println("DAO : 정보 삭제완료 ("+result+")");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}//정보삭제동작
	
}//class
