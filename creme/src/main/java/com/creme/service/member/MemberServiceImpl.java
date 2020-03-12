package com.creme.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.creme.domain.MemberDTO;
import com.creme.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override
	public int idOverlap(String id) {
		return mDao.idOverLap(id);
	}
	
	@Override
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	}
	
	@Override
	public MemberDTO userView(String id) {
		return mDao.userView(id);
	}
	
	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		
		if(result > 0) { // 수정성공
			// 세션에 로그인유저 정보를 수정된 정보로 변경
			session.removeAttribute("name");
			session.setAttribute("name", mDto.getName());
		}
	}
	@Override
	public int pwCheck(String id, String pw) {

		String encPw = mDao.pwCheck(id);
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		return result;
	}
	
	@Override
	public void pwUpdate(MemberDTO mDto) {
		mDao.pwUpdate(mDto);
		
	}
	
	@Override
	public void memDrop(HttpSession session, String id) {
		// 비즈니스로직(회원탈퇴)
		// 로그인 -> session ('쫑이') :session값이 있으면 로그인이 된다.
		// '쫑이' => 회원탈퇴하고 인덱스 페이지에 가면 session 값이 그대로 있으니 로그인이 되므로
		//	session값을 초기화 해야한다.
				
		// 1) 해당회원의 useyn으로 Update(DB)		
		int result = mDao.memDrop(id);   
		
		// 2) 로그인 정보를 삭제(session 초기화)
		if(result > 0) {
			session.invalidate();  // 로그인 된 회원정보를 날린다. 지운다.
		}
		
	}
	 
}
