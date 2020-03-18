package com.creme.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.creme.domain.BoardDTO;
import com.creme.service.Board.BoardService;
import com.creme.service.Board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService bService;
	
	@GetMapping("/list")
		public String list(
				@RequestParam(defaultValue="1") int curPage,
				Model model) {
		log.info(">>>> GET: Board List Page");
		
		// 게시글 갯수 계산
		int count = bService.countArticle();
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<BoardDTO> list = bService.listView(start, end); // 게시물 목록 
		
		HashMap<String,Object> map = new HashMap<>(); // 보낼게 많을땐 HashMap을 써서 map에 담아서 보내는게 효율적이다.
		map.put("list", list);
		map.put("count", count);
		
		model.addAttribute("map", map);
		
		
		return "board/list";
	}
	

}
