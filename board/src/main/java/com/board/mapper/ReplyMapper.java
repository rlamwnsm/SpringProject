package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.domain.Criteria;
import com.board.domain.ReplyVO;

public interface ReplyMapper {
	
	//public ReplyVO read(Long bno); 댓글을 조회하는방식 - 불필요
	public int insert(ReplyVO vo);
	public int delete(Long rno);
	public int update(ReplyVO vo);
	public List<ReplyVO> getReplyList(@Param("cri") Criteria cri, @Param("bno") Long bno);	
	
}
