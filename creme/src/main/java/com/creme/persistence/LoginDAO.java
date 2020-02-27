package com.creme.persistence;

import com.creme.domain.MemberDTO;

public interface LoginDAO {
	
	
	// ID, PW 유저가 존재하는지만 체크
	public MemberDTO loginUser(MemberDTO mDto);
	
}
