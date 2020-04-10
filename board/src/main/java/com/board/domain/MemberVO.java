package com.board.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String username;
	private String enabled;
	
	private Date regdate;
	private Date updatedate;
	
	private List<AuthVO> authList;
}
