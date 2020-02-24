package com.creme.controller;
/*
 * SessionAttribue로 설정된 변수(객체)는
 * response를 하기 전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다
 * web browser와 server간에 한번이라도 연결이 이루어졌으면
 * Session..에 등록된 변수는 서버가 중단될 때까지 그 값이 그대로
 * 유지된다.
 * web은 클라이언트의 req를 서버가 받아서
 * res를 수행하고 나면 모든 정보가 사라지는 특성이 있다.
 * 이런 특성과는 달리 Spring기반의 web은 일부 데이터들을
 * 메모리에 보관했다가 재사용하는 기법이 있다.
 * 그중 SessionAttribute라는 기능이 있다.
 * 
 * SessionAttribute()에 설정하는 문자열(이름)은
 * 클래스의 표준 객체생성 패턴에 의해 만들어진 이름
 * MemoDTO memoDto
 * 
 * 이름을 표준 패턴이 아닌 임의의 이름으로 바꾸고 싶다.
 * */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.creme.domain.MemberDTO;
import com.creme.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@SessionAttributes({"memberDTO"})	
@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
	/*
	 * SessionAttribut를 사용하기
	 * 반드시 해당 변수를 생성하는 method가 controller에 있어야 하고
	 * 해당 메서드에게 @ModelAttribut("변수명") 가 있어야 한다.
	 * 아래처럼 초기화 하는 작업을 꼭 해주어야한다 안그러면 오류난다! 
	 * 꼭 초기화 작업 해주기!
	 */
	
	@ModelAttribute("memberDTO")
	public MemberDTO newMember() {
		return new MemberDTO();
	}
	
	@GetMapping("/constract")
	public String viewConstract() {
		
		log.info(">>>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
		// / 는 폴더 경로
		// member 폴더 안 constract.jsp를 찾아가라.
	}
	

	@GetMapping("/join")
	public String getJoin(@ModelAttribute("memberDTO") MemberDTO mDto, 
						  @RequestParam(value="flag", defaultValue ="0") String flag, Model model) {
		// 컨스트랙트 페이지를 통해서 들어오는 플래그는 1이 들어가고 그외 비정상적인 페이지를 통해 들어오는 것은 0이 들어간다
		log.info(">>>>>> MEMBER/JOIN PAGE GET 출력");
		log.info(mDto.toString());
		model.addAttribute("flag", flag);
		
		return "member/join";
	}
	
	/*
	 * join POST가 mDto를 수신할때
	 * 입력 form에서 사용자가 입력한 값들이 있으면
	 * 그 값들을 mDto의 필드변수에 Setting을 하고
	 * 
	 * 만약 없으면
	 * 메모리 어딘가에 보관중인 SessionAttributes로 설정된
	 * mDto변수에서 값을 가져와서 비어있는
	 * 필드변수를 채워서서 매개변수에 주입한다.
	 *  
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도
	 * 자동으로 join POST로 전송되는 효과를 낸다.
	 * 단, 이 기능을 효율적으로 사용하려면
	 * jsp 코드에서 Spring-form tag로 input을 코딩해야 한다.
	 * */
	
	
	// @model.. 이 되어있으면 mDto에  null값이 있다 하면
	// memberDTO 이름의 저장소에 가보고 같은 변수명이 있으면 null값이 있는데다가 채워준다. 
	// 원래 8개가 있다가 8개 제외 null값이 있으니까 저장소 가서 찾아보면 4개의 값이 있다.
	// 그래서 4개 값을 넣어서 12개(8개 + 4개)가 된다 
	// 그러나 해당 값이 HTML Form태그가 아닌 Spring input? Form? 태그로 꼭 되있어야한다!!
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus) {   
		log.info(">>>>>>>>>>> MEMBER/JOIN POST DB에 회원정보 저장");
		log.info(mDto.toString());
		
		
		// DB에 회원 등록
		int result = mService.memInsert(mDto);
		
		
		// 회원 등록 결과
		if(result > 0) {
			log.info(">>>>>> " + mDto.getId() + "님 회원가입되셨습니다.");
		}
		
		// 자원을 반납하는 작업!!
		// SessionAttributes를 사용할때 insert, update가 완료되고
		// view로 보내기 전 반드시 setComplete()를 실행하여
		// Session에 담긴 값을 clear 해주어야 한다.
		sessionStatus.setComplete(); // <- 써서 반드시 자원을 반납해 주어야 한다. 안그러면 계속 자원이 남아있기 때문에!
		return "";
	}
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping(value="/idoverlap", produces="appication/text; charset=utf-8")
	public String idOverlap(String id ) {
		log.info(">>>>> ID OVERLAP CHECK");
		log.info("아이디: " + id);
		
		int cnt = mService.idOverlap(id);
		
		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		
		return flag;
		
//		return mService.idOverlap(id);
	}
}
