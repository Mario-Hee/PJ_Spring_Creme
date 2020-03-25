package com.creme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creme.domain.ReplyDTO;
import com.creme.service.Reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	
	@GetMapping("/list")
	public String list(int bno, Model model) {
		//model은 앞이 이름(list), 뒤가 실제데이터(rService.list(bno)), 화면단에 전송할 데이터
		//rService.list(bno)는 반드시 return이 있어야한다.
		log.info(">>>>> GET: Reply List Page");
		
		model.addAttribute("list", rService.list(bno));
		return "/board/commentlist";
	}

}
