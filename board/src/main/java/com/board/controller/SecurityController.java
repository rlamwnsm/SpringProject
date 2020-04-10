package com.board.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.board.domain.MemberVO;
import com.board.service.MemberService;
import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/security/*")
@AllArgsConstructor
public class SecurityController {
	private MemberService service;
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth) {
	}
	
	@GetMapping("/customLogin")
	public void loginInput(String error, Model model) {
		if(error!=null) {
			model.addAttribute("error", "아이디 혹은 비밀번호가 다릅니다.");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
	}
	
	@GetMapping("/register")
	public void register() {
		
	}

	@PostMapping("/register")
	public String welcome(MemberVO vo) {
		service.register(vo);
		return "security/welcome";
	}
	
	@GetMapping("/delete")
	public void delete() {
		
	}

	@PostMapping("/delete")
	public String successDelete(String userid) {
		service.delete(userid);
		return "security/successDelete";
	}
	
}
