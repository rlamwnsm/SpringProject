package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;

public interface BoardService {
	//public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	public BoardVO read(Long bno);
	public void register(BoardVO board);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
	public int getTotal(Criteria cri);
}
