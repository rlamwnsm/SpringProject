package com.board.service;

import java.util.List;

import com.board.domain.Criteria;
import com.board.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	public int modify(ReplyVO vo);
	public int remove(Long rno);
	public List<ReplyVO> getList(Criteria cri, Long bno);

}
