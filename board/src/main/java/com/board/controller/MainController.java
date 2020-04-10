package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MainController {	
	@RequestMapping(value = {"/", "/menu/main"}, method = RequestMethod.GET)
	public String main() {
		return "/menu/main";
	}
}





