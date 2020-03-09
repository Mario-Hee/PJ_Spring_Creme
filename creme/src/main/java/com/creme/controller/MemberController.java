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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.creme.domain.MemberDTO;
import com.creme.service.mail.MailService;
import com.creme.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@SessionAttributes({"memberDTO"})	
@Controller
public class MemberController {
	@Autowired // @Autowired는 의존성 주입 할때마다 하나 당 한개씩 따로 써야한다. 
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	MemberService mService;  //의존성 주입 타입으로 하므로 MemberService(객체자료형,전역변수)의 타입이 중요하다. 
							 // 타입으로 읽는다.
							 //자동초기화하는데 객체자료형이므로 null값이 들어간다.
	
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
		
		// 비정상적인 접근일 경우 약관 동의페이지로 이동
		if(!flag.equals(1)) {
			return "member/constract";
		}
		
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
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, 
						SessionStatus sessionStatus, 
						HttpServletRequest request,
						RedirectAttributes rttr) {   
		
		
		// View단에서 Controller단으로 이동
		// 콘솔창에서 테스트 하려고 써 놓은 것
		// setter값이 잘 안들어오면 name값을 확인하라
		log.info(">>>>>>>>>>> MEMBER/JOIN POST DB에 회원정보 저장"); 
		
		// View단에서 전송된 데이터가 잘 전달됐는지 확인 , 들어오지 않은 값은 모두 null처리
		log.info(mDto.toString());
		
		
		log.info("Password: " + mDto.getPw()); // 사용자 입력한 PW값 그대로 나타난다.
		
		// 1.사용자 암호 hash 변환
		String encPw = passwordEncoder.encode(mDto.getPw()); //사용자가 입력한 Pw값을  encoder메서드를 실행하겠다!(요상한 값을 바뀌어서 나옴.)
		mDto.setPw(encPw); // 사용자가 입력한 값을 Hash에 값을 넣어서 바꾸겠다. 암호화된 패스워드가 변화되어서 넣어져있다. mDto에 변환된 값이 넣어져있다.
		log.info("Password(+Hash): " + mDto.getPw()); // 암호화된 비밀번호가 나온다. 
		
		// 2.DB에 회원 등록
		int result = mService.memInsert(mDto);  // mDto 데이터를 가지고  mService에 간다.
												// mService(인스턴스) memberService를 사용하려면 의존성주입을 해야한다.
												// insert, update, delete : 성공 1 또는 실패 0 으로 나타난다. 
		
		log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★result: " + result);
		// 3.회원 등록 결과
		if(result > 0) {
			log.info(">>>>>> " + mDto.getId() + "님 회원가입되셨습니다.");
		}
		
		log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★인증 이메일 좀 보내봐....");
		// 4.회원가입 인증 메일 보내기
		mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request); // 수신인으로 인증하는 메일이 보내진다.(오류x)
//		
//		// 자원을 반납하는 작업!!
//		// SessionAttributes를 사용할때 insert, update가 완료되고
//		// view로 보내기 전 반드시 setComplete()를 실행하여
//		// Session에 담긴 값을 clear 해주어야 한다.
//		log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★sessionattributes 초기화");
		sessionStatus.setComplete(); // <- 써서 반드시 자원을 반납해 주어야 한다. 안그러면 계속 자원이 남아있기 때문에!
									 // controller에서 공유하던 영역 제거하는 작업이다.!
//		
//		log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★화면단 출력함");
		
		// 회원가입 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", mDto.getId());
		rttr.addFlashAttribute("email", mDto.getEmail());
		rttr.addFlashAttribute("key", "join");
		
		return "redirect:/";
	}
	
	// 회원가입 후 email 인증
	@GetMapping("/keyauth")
	public String ketAuth(String id, String key, 
						  RedirectAttributes rttr) {
		
		mailService.keyAuth(id, key);
		
		//인증 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "auth");
		
		return "redirect:/"; // redirect라고 명시하지 않으면 forward가 기본이다.
							 // redirect:(redirect:방법으로 하겠다) 페이지를 새로띄울 수 있게 만들려면  mapping 을 타야하므로
							 // /로 mapping 을 실행하라는 뜻이다.
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
	
	// 회원정보수정
	@GetMapping("/update")
	public String memUpdate(HttpSession session, Model model) {
		log.info(">>>>> GET: MEMBER UPDATE PAGE");
		
		// 현재 로그인 상태를 확인
		// session 영역에 담는 순간 자기 타입을 상실한다. ()형 변환을 꼭 써줘야한다
		String id = (String)session.getAttribute("userid"); 
		
		// 로그인이 안돼있으면 비정상적인 접근으로 간주하여
		// 인덱스페이지로 이동!
		if(id == null) {
			return "redirect:/";	
		}
		
		// 로그인된 유저의 정보를 GET
		// 회원정보수정 페이지로 보내기
		/* MemberDTO mDto = mService.userView(id); */
		model.addAttribute("user", mService.userView(id)); 
		
		return "member/join";
	}
	
	@PostMapping("/update")
	public String memUpdate(MemberDTO mDto, HttpSession session) {
		log.info(">>>>>>>>>>>>POST: Member Update Action");
		log.info(mDto.toString());
		
		mService.memUpdate(mDto, session);

		return "redirect:/";
	}
}
