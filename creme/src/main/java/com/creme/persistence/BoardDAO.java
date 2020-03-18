package com.creme.persistence;

import java.util.List;

import com.creme.domain.BoardDTO;

public interface BoardDAO {
	//목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> listView();

}
