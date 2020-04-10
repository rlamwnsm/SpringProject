package com.board.mapper;

import java.util.List;


import com.board.domain.BoardVO;
import com.board.domain.Criteria;

public interface NoticeMapper {
	public List<BoardVO> getList();
	public List<BoardVO> getListWithPaging(Criteria cri);
	public BoardVO read(Long bno);
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board); //bno값을 지정하지 않아도, 자동으로 시퀀스를 확인하기때문에 지정할 필요가 없다 
	public boolean delete(Long bno);
	public boolean update(BoardVO board);
	public int getTotalCount(Criteria cri);
}
