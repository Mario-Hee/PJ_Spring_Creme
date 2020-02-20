package com.creme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creme.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;

// lombok라이브러리의 log기능을 사용
@Slf4j

// Spring이 동작시 DispatcherServlet 생성과정에서
// servlet-context.xml의 환경설정을 읽어들이는데
// servlet-context.xml 내의 component-scan이
// 설정된 경로를 돌아다니며 @Controller가 붙어있는
// class들을 전부 Spring Context에 Beans로 등록
// 시키기 위해 사용!
// Spring Context에 Beans로 등록되있어야
// DispatherServlet이 Handler Mapping과
// Handler Adapter를 통해 요청처리를 시킬 수 있음

// Spring Context에 Beans로 등록되었다
// = Spring이 객체의 제어권을 개발자로부터 넘겨받음(IOC패턴)

// Spring Context에 Beans로 등록되있는 객체들만
// 의존성주입 가능(DI패턴)

@RequestMapping("/sample")
@Controller
public class SampleController {

	//@RequestMapping를 쓰면 GET방식, POST방식 둘 다 띄어준다.
	// Sample 페이지 출력
	@RequestMapping("/")
	public String print() {
		return "sample";
	}
	
	@GetMapping("/view")
//	@RequestMapping(value="/sample/view", method=RequestMethod.GET)
	public String view(String user) {
		log.info("GET 방식 호출");
		log.info("user: " + user);
		return "result";
	}
	
	
//	@RequestMapping(value="/sample/view", method=RequestMethod.POST)
//	public String view(HttpServletRequest request) {
//	public String view(@RequestParam String user, @RequestParam String pass ) {
//	@RequestParam 는 화면단에서 오는 데이터를 모두 String(문자열)타입으로 받아버린다. 
//	@RequestParam 생략가능
	// name의 이름을 먼저 찾고 값이 있으면 user에 바로 집어넣고 없으면 default 값을 집어 넣는다.
//	public String view(@RequestParam(value="user", defaultValue="도비") String user, String pass ) {
	
@PostMapping("/view")
	public String view(SampleDTO sDto) {
		// input 2개의 값을 전달(Name 속성값)
		// name=user, name=pass
		
		// (과거) View단으로부터 데이터를 받는 방법
		// request.getParameter(""); 값을 모두 String타입으로 받음
		// 그래서 개발자가 받아서 형변환하는 작업이 필수!
		// 추가로 값을 View단에서 넘겨주지 않으면 Null값이 들어가서
		// 하단에 매개변수를 사용하는 부분에서 전부 Error발생한다
		// 그러니 Null체크 해주는 코드가 필수!
//		String user = request.getParameter("user");
//		String pass = request.getParameter("pass");
		
		log.info("POST 방식 호출");
//		log.info(user + ", " + pass);
		log.info(sDto.toString());
		return "result"; 
	}

		//동기방식
		@GetMapping("/sync")
		public String sync(String name, Model model) {
			
			log.info("동기방식: " + name);
			model.addAttribute("name", name);
			
			return "sample";
		}
		
		//비동기방식
		//@ResponseBody는 더이상 화면단으로 인식을 안한다.
		@ResponseBody
		@PostMapping(value="/ajax", produces="application/text;charset=utf-8")
		// 한글이 깨지므로  produces="application/text;charset=utf-8 을 명시한다.
		public String async(String name) {
			log.info("비동기 방식: " + name);		
			return name;
		// 문자열 데이터를 리턴한다.
		}
}
