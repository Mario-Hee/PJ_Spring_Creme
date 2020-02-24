package com.creme.persistence;

import com.creme.domain.MemberDTO;

public interface MemberDAO {
	
	// 회원가입 ID중복 체크( + AJAX)
	public int idOverLap(String id);
	
	// 회원가입 
	public int memInsert(MemberDTO mDto);
	
}
