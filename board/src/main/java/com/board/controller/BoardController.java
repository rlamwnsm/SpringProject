package com.board.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.PageDTO;
import com.board.service.BoardService;

import lombok.AllArgsConstructor;

@Controller

@RequestMapping("/menu/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	@GetMapping ("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(@RequestParam("bno")Long bno, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("board", service.read(bno));
		
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() 
	{	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) 
	{
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/menu/board/list";
	}

	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr) {
		if(service.modify(board)) 
		{
			rttr.addFlashAttribute("result", "success");
		}	
		return "redirect:/menu/board/list"+cri.getListLink();
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")Long bno, @ModelAttribute("cri")Criteria cri, RedirectAttributes rttr, String writer) {
		if(service.remove(bno)) 
		{
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/menu/board/list"+cri.getListLink();
	}
}





