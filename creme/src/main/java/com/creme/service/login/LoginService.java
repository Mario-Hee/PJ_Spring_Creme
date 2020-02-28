package com.creme.service.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.creme.domain.MemberDTO;

@Service
public interface LoginService {
		
	// 로그인
	public int login(MemberDTO mDto, HttpSession session);

	//로그아웃
	public void logout(HttpSession session);
}
