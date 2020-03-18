package com.creme.service.Board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creme.domain.BoardDTO;
import com.creme.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService{
	BoardDAO bDao;
	
	@Autowired
	private SqlSession sqlSession;  
	
	@Autowired
	public void newProductDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	@Override
	public List<BoardDTO> listView(int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);

		return bDao.listView(map);
	}

	@Override
	public int countArticle() {
		return bDao.countArticle();
	}
	
	
}
