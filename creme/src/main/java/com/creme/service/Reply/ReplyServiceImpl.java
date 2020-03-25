package com.creme.service.Reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creme.domain.ReplyDTO;
import com.creme.persistence.ReplyDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private SqlSession sqlSessin;
	
	private ReplyDAO rDao;
	@Autowired
	public void ReplyDAO() {
		rDao = sqlSessin.getMapper(ReplyDAO.class);
	}
	
	//비즈니스 로직: 해당 댓글목록을 보내주는 것, DB에 해당 목록 값이 있으니 DB에 가야한다.
	@Override
	public List<ReplyDTO> list(int bno) {
		
		return rDao.list(bno);
	}

}
