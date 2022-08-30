package com.itwillbs.member;

import java.sql.Timestamp;

public class MemberBean {
	// itwill_member 테이블의 정보를 한번에 저장 객체
		private String id;
		private String pw;
		private String name;
		private String gender;
		private int age;
		private String email;
		private Timestamp regdate;
		

	
		
		// set/get 메서드 생성
		//alt shift s + r
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPw() {
			return pw;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}
		public Timestamp getRegdate() {
			return regdate;
		}

		public void setRegdate(Timestamp regdate) {
			this.regdate = regdate;
		}
		
		
		//alt shift s+s
		@Override
		public String toString() {
			return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", age=" + age
					+ ", email=" + email + ", regdate=" + regdate + "]";
		}
		
}
