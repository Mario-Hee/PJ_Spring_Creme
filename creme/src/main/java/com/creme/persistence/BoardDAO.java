package com.creme.persistence;

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
	public BoardDTO viewArticle(int bno);


}
