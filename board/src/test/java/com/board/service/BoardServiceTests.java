package com.board.service;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.board.domain.BoardVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

//@AllArgsConstructor
public class BoardServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	/*
	public void TestExist() {
		log.info(service);
		assertNotNull(service);
	}

	public void testregister() {
		BoardVO board = new BoardVO();
		board.setContent("service테스트");
		board.setTitle("service테스트");
		board.setWriter("service00");
		service.register(board);
	}
	
	public void testread() {
		Long bno = 63L;
		service.read(bno);
	}
	
	public void testgetlist() {
		//service.getList();
	}
	

	public void testdelete() {
		service.remove(63L);
	}
	*/
	@Test
	public void testupload() {
		BoardVO board = new BoardVO();
		board.setBno(61);
		board.setContent("service테스트");
		board.setTitle("service테스트");
		board.setWriter("service00");
		
		service.modify(board);
	}
}
