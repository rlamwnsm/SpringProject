package com.board.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.mapper.NoticeMapper;

import lombok.AllArgsConstructor;




@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	//autowired로도 사용가능 !
	private NoticeMapper mapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public BoardVO read(Long bno) {
		// TODO Auto-generated method stub
		return mapper.read(bno);
	}
	
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.insertSelectKey(board);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.update(board);
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}


}
