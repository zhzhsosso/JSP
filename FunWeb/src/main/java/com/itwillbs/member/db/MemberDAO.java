package com.itwillbs.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

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
	
	// 회원가입 - memberJoin(DTO)
	/**
	 *  회원가입 해주는 메서드, 실행할때 회원정보(DTO)받아서 사용
	 *  리턴X, 실행결과가 0보다 클때 메세지 출력
	 *  * @param dto
	 */
	public void memberJoin(MemberDTO dto) {
		
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. SQL 작성 & pstmt 객체 
			sql = "insert into itwill_member(id,pw,name,birth,gender,email,addr,tel) "
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//???
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getAddr());
			pstmt.setString(8, dto.getTel());
			// 4. SQL 실행
			int result = pstmt.executeUpdate();
			
			if(result>0) {
				System.out.println(" DAO : 회원가입 성공! ");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	// 회원가입 - memberJoin(DTO)
	
	
	// 아이디 중복체크 - memberIdCheck(ID)
	public int memberIdCheck(String id) {
		int result = 0; // 0 - 중복X(아이디사용 O)  1 - 중복O(아이디사용X)
		
		try {
			//1.2. 디비연결
			con = getConnection();
			// 3. sql & pstmt
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// 회원이 있다 (중복)
				result = 1;
				System.out.println(" DAO : 아이디 중복결과 ("+result+")");
			}
			
			// result == 0
			System.out.println(" DAO : 아이디 중복결과 ("+result+")");			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// 아이디 중복체크 - memberIdCheck(ID)
	
	
	// 로그인 여부 체크 - memberLogin(ID,PW)
	public int memberLogin(String id,String pw) {
		int result = -1;
		
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. sql & pstmt
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// 회원
				if(pw.equals(rs.getString("pw"))) {
					// 로그인 성공
					result = 1;
				}else {
					// 로그인 실패
					result = 0;
				}
			}else {
				// 비회원
				result = -1;
			}
			System.out.println(" DAO : 로그인 체크 ("+result+")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// 로그인 여부 체크 - memberLogin(ID,PW)
	
	// 회원정보 조회 - getMember(id)
	public MemberDTO getMember(String id){
		MemberDTO dto = null;
		try {
			con = getConnection();
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setAddr(rs.getString("addr"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setTel(rs.getString("tel"));
			}
			System.out.println(" DAO : 회원 정보 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	// 회원정보 조회 - getMember(id)
	
	//회원정보 수정 - updateMember(dto)
	public int updateMember(MemberDTO dto) {
		int result = -1;
		
		try {
			con = getConnection();
			
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(dto.getPw().equals(rs.getString("pw"))) {
					sql ="update itwill_member set name=?,addr=?,tel=?,birth=?,gender=? where id=?";
					pstmt = con.prepareStatement(sql);
					//객체생성은 sql구문당 한번, 둘은 세트
					
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getAddr());
					pstmt.setString(3, dto.getTel());
					pstmt.setString(4, dto.getBirth());
					pstmt.setString(5, dto.getGender());
					pstmt.setString(6, dto.getId());
					
					result = pstmt.executeUpdate();
					
					
				}else {
					result = 0;
				}
			}else {
				result = -1;
			}
			
			System.out.println("DAO : 회원수정 완료("+result+")");
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		return result;
	}
	//	회원정보 수정 - updateMember(dto)

	
	//	회원정보 삭제 - deleteMember(dto)
	public int deleteMember(String id, String pw) {
		int result = -1;
		
		try {
			con = getConnection();
			
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					sql = "delete from itwill_member where id=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					result = pstmt.executeUpdate();
					
				}else {
					result = 0;
				}
			}else {
				result = -1;
			}
			
			System.out.println("DAO : 회원수정 완료("+result+")");
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		return result;
	}
	//	회원정보 삭제 - deleteMember(dto)
	
	// 회원목록 조회 - getMemberList()
	public List<MemberDTO> getMemberList() {
		//회원목록 저장 List
		List memberList = new ArrayList();
		
		try {
			con = getConnection();
			
			sql="select * from itwill_member where id != ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "admin");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//DB -> DTO -> List
				MemberDTO dto = new MemberDTO();
				
				int cnt = 0;
				dto.setId(rs.getString(++cnt));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setGender(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setAddr(rs.getString(7));
				dto.setTel(rs.getString(8));
				dto.setRegdate(rs.getTimestamp(9));
				
				//DTO -> List
				memberList.add(dto);
			}//while
			
			System.out.println("DAO : 회원수 : "+memberList.size());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberList;
	}
	// 회원목록 조회 - getMemberList()
	
	//관리자 회원탈퇴 - adminMemberDelete(ID)
	public void adminMemberDelete(String delID) {
		try {
			con = getConnection();
			
			sql="delete from itwill_member where id=?";
			pstmt= con.prepareStatement(sql);
			
			pstmt.setString(1, delID);
			pstmt.executeUpdate();
			
			System.out.println("DAO : 관리자 회원 탈퇴!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//관리자 회원탈퇴 - adminMemberDelete(ID)
	
	
	
	
	
	

}
