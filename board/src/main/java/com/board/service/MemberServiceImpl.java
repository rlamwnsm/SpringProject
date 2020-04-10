package com.board.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.board.domain.MemberVO;
import com.board.mapper.MemberMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	private MemberMapper mapper;
	private PasswordEncoder pwencoder;
	@Override
	public void register(MemberVO vo) {
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		mapper.register(vo);
		mapper.set_auth(vo.getAuthList());
	}
	@Override
	public void delete(String userid) {
		mapper.del_auth(userid);
		mapper.delete(userid);		
	}

}
