package com.creme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creme.domain.MemberDTO;
import com.creme.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	LoginService lService;
	
	@ResponseBody
	@PostMapping("/in") // 사용자가 로그인 값을 입력하면 오는 곳
	public Integer logIn(MemberDTO mDto,
						 HttpSession session) { // 매개변수 선언만 해주면 스프링이 읽어서 자동으로 객체생성해서 넣어준다. 
												// 따로 객체생성하지않아도 그대로 사용할 수 있다!
		log.info(">>>>> POST: LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		
		// 로그인
		int result = lService.login(mDto, session);
		/* log.info("결과는~~~~~~~~~~~~~" + result); */
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/out")
	public void logOut(HttpSession session) {
		log.info(">>>>> POST: LOGOUT/LOGOUT ACTION");
		
		lService.logout(session);
	}
}
