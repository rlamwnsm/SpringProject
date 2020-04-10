package com.board.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	

	public void testgetList() {
		log.info(mapper.getList());

	}

	
	public void testinsertSelectKey() {
		BoardVO board = new BoardVO();
		
		board.setTitle("테스트");
		board.setContent("테스트2");
		board.setWriter("usertest");
		mapper.insertSelectKey(board);
	}
	
	public void read() {
		long bno = 55;
		mapper.read(bno);
	}
	
	
	public void delete() {
		long bno=62;
		boolean results = mapper.delete(bno);
	}
	
	
	public void update() {
		BoardVO board = new BoardVO();
		board.setBno(61);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user111");
		boolean count = mapper.update(board);
	}
	
	
	public void test() {
		Criteria cri = new Criteria();
		cri.setAmount(10);
		cri.setPageNum(1);
		List<BoardVO> list=mapper.getListWithPaging(cri);
		list.forEach(board->log.info(board.getBno()));
	}

	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("test");
		cri.setType("");
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board->log.info(board));
	}
}

