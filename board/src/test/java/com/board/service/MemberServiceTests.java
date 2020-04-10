package com.board.service;



import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.board.domain.AuthVO;
import com.board.domain.MemberVO;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})

//@AllArgsConstructor
public class MemberServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	
	private MemberVO mem = new MemberVO();
	private AuthVO auth = new AuthVO();
	private List<AuthVO> list = new ArrayList<>();
	
	@Test
	public void deltest() {
		String id = "addd";
		service.delete(id);
	}
	
	public void regtest() {
		auth.setUserid("admin");
		auth.setAuth("ROLE_ADMIN");

		list.add(auth);
		mem.setUserid("admin");
		mem.setUsername("jun");
		mem.setUserpw(pwencoder.encode("admin"));
		mem.setAuthList(list);
		service.register(mem);
	}
}
