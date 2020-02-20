package com.creme.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creme.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@GetMapping("/constract")
	public String viewConstract() {
		
		log.info(">>>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
		// / 는 폴더 경로
		// member 폴더 안 constract.jsp를 찾아가라.
	}
	
	@GetMapping("/join")
	public String getJoin(MemberDTO mDto) {
		log.info("GET방식");
		log.info(mDto.toString());
		
		return "member/join";
	}
	
	@PostMapping("/join")
	public String getJoin() {
		log.info(">>>>>>>>>>> MEMBER/JOIN PAGE GET 출력");
		return "member/join";
	}
}