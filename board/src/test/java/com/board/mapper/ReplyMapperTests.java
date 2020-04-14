package com.board.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReplyMapperTests {
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;

	public void testMapper() {
		log.info(mapper);
	}
	
	
	public void testinsert() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(413L);
		vo.setReply("테스트");
		vo.setReplyer("테스터");
		
		mapper.insert(vo);
	}
	
	
	public void testdelete() {
		Long rno = 5L;
		
		mapper.delete(rno);
	}
	
	
	public void testupdate() {
		Long rno = 4L;
		ReplyVO vo = new ReplyVO();
		vo.setRno(rno);
		vo.setBno(413L);
		vo.setReply("업데이트");
		vo.setReplyer("테스터");
		
		mapper.update(vo);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getReplyList(cri, 413L);
		replies.forEach(reply->log.info(reply));
	}
}





