package com.creme.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creme.domain.MemberDTO;
import com.creme.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
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
	 
}
