package com.creme.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creme.domain.MemberDTO;
import com.creme.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
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
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping(value="/idoverlap", produces="appication/text; charset=utf-8")
	public String idOverlap(String id ) {
		log.info(">>>>> ID OVERLAP CHECK");
		log.info("아이디: " + id);
		
		int cnt = mService.idOverlap(id);
		
		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		
		return flag;
		
//		return mService.idOverlap(id);
	}
}
