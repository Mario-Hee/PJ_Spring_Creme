package com.creme.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.creme.domain.BoardDTO;

public interface BoardDAO {

	// 게시글 갯수 계산
	public int countArticle(@Param("map") Map<String, String> map);
	
	//목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> listView(@Param("map") Map<String, Object> map);
	
	//상세게시글
	public BoardDTO view(int bno);
	
	//조회수 +1 증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	//게시글 삭제
	public void delete(@Param("bno") int bno);
	
	//댓글 수 
	public void replyCntUpdate(@Param("map") HashMap<String, Object> map);
	
	//게시글 등록
	public void write(BoardDTO bDto);

	//게시글 수정
	public void updateView(BoardDTO bDto);
}
