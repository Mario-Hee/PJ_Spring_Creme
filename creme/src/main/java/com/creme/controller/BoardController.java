package com.creme.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.creme.domain.BoardDTO;
import com.creme.service.Board.BoardService;
import com.creme.service.Board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
@SessionAttributes({"BoardDTO"})
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
	
	// 상세게시글
	@GetMapping("/view/{bno}") 
	public String view(@PathVariable(value="bno") int bno,  
						Model model,
						HttpSession session) {
		log.info(">>>>> GET: Board Detail Page");
		
		// 1.해당 bno의 조회수 +1 증가
		bService.increaseViewCnt(bno, session);
		
		
		// DB에서 해당 bno정보를 get해서 View단으로 전송
		model.addAttribute("one", bService.view(bno));
		model.addAttribute("key", "dropBoard");
		
		return "board/view";
	}
	
	// 게시글 삭제
	@GetMapping("/delete")
	public String delete(int bno) {
		log.info(">>>>> GET: Board Delete Action");
		bService.delete(bno);
		
		return "redirect:/board/list";
	}
	
	//글쓰기 페이지를 띄움
	@GetMapping("/write")
	public String writer() {
		log.info(">>>>> GET: Board Write Page");
		
		return "board/register";
	}
	
	//글을 DB에 담음
	//게시글 등록
	@PostMapping("/write")
	public String write(BoardDTO bDto) {
		log.info(">>>>> POST: Board Write Action");
		log.info(bDto.toString());
		// log.info("currval :" + "번호" + bDto.getBno()); 게시글 bno값을 조회
		
		if (bDto.getFiles() == null) {  // 첨부파일 NO
			bDto.setFilecnt(0);
		} else {  // 첨부파일 YES
			log.info("첨부파일 수:" +bDto.getFiles().length); // 파일 수만큼 들어간다.
			bDto.setFilecnt(bDto.getFiles().length);
		}	
		bService.write(bDto);
		
		return "redirect:/board/view/" + bDto.getBno();
	}
	
	// 게시글 수정
	@GetMapping("/update")
	public String updateBoard(int bno, Model model) {
		log.info(">>>>> GET: Board Update View Page");
		log.info("bno: " + bno);
		
		//수정을 원하는 게시글의 정보를(1줄)을 원함
		//1줄짜리 데이터를 가져다 준다. 
		model.addAttribute("one", bService.view(bno));
		model.addAttribute("flag", "update");
		
		return "/board/register";
	}
	
	@PostMapping("/update")
	public String updateView(BoardDTO bDto) {
		log.info(">>>>> POST: Board Update View Action");
		
		if (bDto.getFiles() == null) {  // 첨부파일 NO = 0
			bDto.setFilecnt(0);
		} else {  // 첨부파일 YES = 파일이 들어있는 갯수만큼 알려준다.
			log.info("첨부파일 수:" +bDto.getFiles().length); // 파일 수만큼 들어간다.
			bDto.setFilecnt(bDto.getFiles().length);
		}	
		log.info(bDto.toString());
		
		bService.updateView(bDto);
		
		// 수정할 해당 bno정보를 get해서 View단으로 전송
		return "redirect:/board/list";
	}
	
	// 답글 달기
	@GetMapping("/answer")
	public String answerBoard(BoardDTO bDto, Model model) {  // 컨트롤러 어노테이션이 붙은 것에 한해서 매개변수를 써 놓으면 객체생성을 자동으로 해준다. 
		log.info(">>>>> GET: Board Answer Page");	
		bDto = bService.view(bDto.getBno());
		
		String newContent = "<p>이전게시글내용</p>"+
								bDto.getView_content()+
								"<br>===============================";
		bDto.setView_content(newContent);
		
		model.addAttribute("one", bDto);
		model.addAttribute("flag", "answer");
		
		return "/board/register";
	}
	
	@PostMapping("/answer")
	public String answerBoard(BoardDTO bDto) {
		log.info(">>>>> POST: Board Answer Action");
		
		// 현재상태: 답글(타입, 제목, 내용, 작성자)이 담겨있다.
		log.info("메인게시글: " + bDto.toString());
		
		// 현재상태: 메인(ALL, ref, re_level, re_step)이 담겨있다.
		BoardDTO prevDto = bService.view(bDto.getBno());
		log.info("메인DTO: " + prevDto.toString());
		
		if (bDto.getFiles() == null) {  // 첨부파일 NO = 0
			bDto.setFilecnt(0);
		} else {  // 첨부파일 YES = 파일이 들어있는 갯수만큼 알려준다.
			log.info("첨부파일 수:" +bDto.getFiles().length); // 파일 수만큼 들어간다.
			bDto.setFilecnt(bDto.getFiles().length);
		}	
		
		// 현재상태: 답글(bno(메인게시글)), 타입, 제목, 내용, 작성자, ref(메인), re_level(메인), re_step(메인)이 담겨있다. / 아직 + 1은 안한 상태
		bDto.setRef(prevDto.getRef());
		bDto.setRe_level(prevDto.getRe_level());
		bDto.setRe_step(prevDto.getRe_step());
		
		// ref, re_step, re_lever
		// ref = 그래도 메인게시글 ref C&P
		// re_level = 메인게시글 re_level + 1
		// re_step  = 메인게시글 re_step + 1
		
		bService.answer(bDto);
		
		return "redirect:/board/view/" + bDto.getBno();
		
	}
	
	@PostMapping("/getAttach")
	@ResponseBody
	public List<String> getAttach(int bno) {
		log.info(">>>>> POST: Board getAttach Action");
		log.info(">>>>> bno: " + bno);
		
		return bService.getAttach(bno);
	}
}
