package com.board.service;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.ReplyVO;
import com.board.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReplyServiceTests {
	@Setter(onMethod_=@Autowired)
	ReplyService service;
	
	@Test
	public void insertTest()
	{
		ReplyVO vo = new ReplyVO();
		vo.setBno(413L);
		vo.setReply("Tests");
		vo.setReplyer("Testss");
		
		service.register(vo);
	}
}
