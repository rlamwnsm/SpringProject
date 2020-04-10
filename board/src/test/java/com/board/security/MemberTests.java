package com.board.security;


import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;
import com.board.domain.AuthVO;
import com.board.domain.MemberVO;
import com.board.mapper.MemberMapper;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})

public class MemberTests {
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	@Setter(onMethod_=@Autowired)
	private DataSource ds;
	@Setter(onMethod_ = @Autowired)
	MemberMapper mapper;	
	public void testInsertMember() {
		String sql = "insert into member(userid, userpw, username) values (?, ?, ?)";

		for (int i = 0; i<10; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(2,  pwencoder.encode("pw"+i));
				
				if(i<5) {
					pstmt.setString(1,  "user"+i);
					pstmt.setString(3, "일반사용자"+i);
				}
				else if(i<8) {
					pstmt.setString(1,  "manager"+i);
					pstmt.setString(3, "운영자"+i);
				}
				else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(3, "관리자"+i);
				}
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) {try {pstmt.close();}catch(Exception e) {}}
				if(con!=null) {try {con.close();}catch(Exception e) {}}
			}
		}
	}
	
	public void regtest() {
		MemberVO mem = new MemberVO();
		AuthVO auth = new AuthVO();
		auth.setUserid("admin01");
		auth.setAuth("ROLE_ADMIN");
		List<AuthVO> list = new ArrayList<>();
		list.add(auth);
		mem.setUserid("admin01");
		mem.setUsername("jun1");
		mem.setUserpw(pwencoder.encode("pw001"));
		
		mapper.register(mem);
		mapper.set_auth(list);
	}
	
	@Test
	public void deltest() {
		String id = "dd";
		mapper.del_auth(id);
		mapper.delete(id);

	}

	public void testInsertAuth() {
		String sql = "insert into member_auth(userid, auth) values (?, ?)";
		
		for (int i = 0; i<10; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i<5) {
					pstmt.setString(1,  "user"+i);
					pstmt.setString(2, "ROLE_USER");
				}
				else if(i<8) {
					pstmt.setString(1,  "manager"+i);
					pstmt.setString(2, "ROLE_MEMBER");
				}
				else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) {try {pstmt.close();}catch(Exception e) {}}
				if(con!=null) {try {con.close();}catch(Exception e) {}}
			}
		}
	}
}


