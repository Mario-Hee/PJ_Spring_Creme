package com.creme.service.Board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<BoardDTO> listView(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");

		return bDao.listView(map);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		
		return bDao.countArticle(map);
	}

	@Override
	public BoardDTO view(int bno) {
		
		return bDao.view(bno);		

	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		// ex) now_time: 현재시간
		// ex) plus_time: 조회수 + 1 시간
		// now_time - plus_time = 조회수 + 1 증가 후 지난시간
		
		long update_time = 0; // 조회수 + 1 증가한 시간
		
		if(session.getAttribute("update_time_"+bno) != null) {  // "update_time"+bno은 세션에 아직 값이 없으므로 null, !=null과 값이 같으므로 if 안탐
			//게시물 bno를 210이라 할때,
			//update_time_"+bno => update_time_210
			
			// 최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		
		// 현재시간
		long current_time = System.currentTimeMillis(); // 35000초, 시간 초
		
		// 일정시간이 경과한 후 조회수 증가 처리
		//if(current_time - update_time > 5000) { 			 // 새로고침 후 5초후에 조회수 +1 증가
		if(current_time - update_time > 24*60*60*1000) {	 // 하루마다 조회수 +1 증가, 1day
			// DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			// 조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
	}

	@Override
	public String delete(int bno) {
		bDao.delete(bno);
		
		return null;
	}
	
	@Transactional
	@Override
	public void write(BoardDTO bDto) {
		// tbl_board에 게시글 등록(type, title, content, writer)
		bDao.write(bDto);
		
		// tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
		
		if(files == null) {
			return; // 첨부파일 없음, 종료
		}
		for(String name : files) {
			// tbl_attach 테이블에 첨부파일 1건씩 등록
			bDao.addAttach(name);
		}
	
	}

	@Override
	public void updateView(BoardDTO bDto) {	
		bDao.updateView(bDto);
	}

	@Override
	public void answer(BoardDTO bDto) {
		// 답글 알고리즘
		// Current Status bDto:
		// answer: title, writer, type, content
		// main: bno, ref, re_leverl, re_step
		
		// 1) re_step을 수정
		// : ref가 같은 row중에 메인 게시글의
		//   re_step보다 크기가 큰 값을 찾아
		//   전부 + 1 => updateStep()을 해야한다. updateStep = step등록
		// 	 (답글을 등록하기 전에 updateStep해야한다.)
		bDao.updateStep(bDto);
		
		
		// 2) 답글 DB에 INSERT
		bDto.setRe_level(bDto.getRe_level()+1);
		bDto.setRe_step(bDto.getRe_step()+1);
		bDao.answer(bDto);
		
	}
	
	
	
	
}
