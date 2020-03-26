package com.creme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.creme.domain.ReplyDTO;
import com.creme.service.Reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
@SessionAttributes({"replyDTO"})
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
	
	@ResponseBody
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		//비즈니스 로직 
		//해당 게시글에 댓글을 등록하고
		//해당 게시글의 reply_cnt를 + 1 함
		//1.댓글등록
		 rService.reply_insert(rDto);
	}

}
