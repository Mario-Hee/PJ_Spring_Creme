package com.creme.service.Reply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.creme.domain.ReplyDTO;
import com.creme.persistence.BoardDAO;
import com.creme.persistence.ReplyDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private SqlSession sqlSessin;
	
	private ReplyDAO rDao;
	private BoardDAO bDao;
	@Autowired
	public void ReplyDAO() {
		rDao = sqlSessin.getMapper(ReplyDAO.class);
	}
	
	//비즈니스 로직: 해당 댓글목록을 보내주는 것, DB에 해당 목록 값이 있으니 DB에 가야한다.
	@Override
	public List<ReplyDTO> list(int bno) {
		
		return rDao.list(bno);
	}

	//댓글 등록
	@Transactional
	@Override
	public void replyinsert(ReplyDTO rDto) {
		
		rDao.replyinsert(rDto);
		
		rDao.replyCntPlus(rDto.getBno());
		
	}

	@Override
	public void delete(int rno, int bno) {
		
		//1.댓글 삭제
		rDao.delete(rno);
		
		//2.게시글 댓글 수 -1
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("type", "minus");
		rDao.replyCntUpdate(map);
	}
	

}
