package com.board.mapper;

import java.util.List;

import com.board.domain.AuthVO;
import com.board.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);
	public void register(MemberVO vo);
	public void set_auth(List<AuthVO> authlist);
	public void delete(String userid);
	public void del_auth(String userid);
}
