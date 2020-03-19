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
				@RequestParam(defaultValue = "new") String sort_option,   // 정렬하는 값
				@RequestParam(defaultValue = "all") String search_option, // 검색 선택 창(나는 없x)
				@RequestParam(defaultValue = "") String keyword, 		  // 검색하는 공간 , 키워드가 안 오면 공백값을 넣어달라 = ""
				Model model) {
		
		log.info(">>>> GET: Board List Page");
		// controller ( curPage: 1)
		
		// 게시글 갯수 계산
		int count = bService.countArticle(search_option, keyword);
		
		
		// 페이지 관련 설정
		// pager 인스턴스 안에 변수들의 값(pager.java)이 다 들어가 있다. 인스턴스 생성함과 동시에 쓸 수 있다.
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin(); // getPageBegin(1)
		int end = pager.getPageEnd();	  // getPageEnd(10)
		List<BoardDTO> list = bService.listView(sort_option, search_option, keyword, start, end); // 게시물 목록 
		
		HashMap<String,Object> map = new HashMap<>(); // 보낼게 많을땐 HashMap을 써서 map에 담아서 보내는게 효율적이다.
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map", map);
		
		
		return "board/list";
	}
	

}
