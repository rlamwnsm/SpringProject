package com.board.service;

import com.board.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO vo);
	public void delete(String userid);
}
