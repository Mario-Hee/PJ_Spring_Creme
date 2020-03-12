package com.creme.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.creme.domain.MemberDTO;
import com.creme.persistence.LoginDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	private LoginDAO lDao;

	@Autowired
	public void newMemberDAO() {
	
		lDao =sqlSession.getMapper(LoginDAO.class);
	}
	@Override
	public int login(MemberDTO mDto, HttpSession session) {
		// Session을 서비스가 받았으니 그대로 사용하면 된다.
		
		// 비즈니스로직 처리
		// 1.DB에 가서 회원인지 아닌지 유무 체크
		MemberDTO loginDto = lDao.loginUser(mDto); // 사용자가 입력한 아이디, 패스워드값을 보내준다.
		log.info("**************************로그인 결과");
		
		// 로그인 결과값
		int result = 0;
		
		// result 결과
		// 결과 값 0 : 등록된 회원이 아닙니다. 회원가입을 진행해주세요.
		// 2: 이메일 인증을 하셔야만 로그인 할 수 있습니다.
		// 1: 로그인 성공 
		// 3: 아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해주세요.
		
		// 회원 정보가 없는 경우
		if(loginDto == null) { // 값이 하나도 안들어오면 회원자체가 아니므로 에러메세지를 띄어줌
			result = 0;
			return result; // 회원이 아닌데 인증할 필요가 없으므로 값을 반환한다
		}
		
		// 탈퇴한 회원인 경우
		if(loginDto.getUseyn().equals("d")) {
			result = 3;
			return result;
		}
		
		// 인증을 안 했을 경우(y가 아닌경우는 무조건 인증을 안 한것)
		if(!(loginDto.getUseyn().equals("y"))) {
			result = 2;
			return result; // 이메일 인증이 안 된 경우이므로 값을 반환한다
		}
		
		
		// 회원정보가 있고 인증을 한 경우
		if(loginDto != null) {
			// 아이디와 패스워드가 같은지 체크 (이메일 인증을 하고 아이디와 패스워드가 같다)
			if(passwordEncoder.matches(mDto.getPw(), loginDto.getPw())) {
				// 로그인 진행~
				result = 1;
				
				// session에 로그인 유저 정보를 저장한다.
				// 공유영역에 로그인이 되면 userid, name의 값을 가져다 주는데 
				// 값을 가져다주지 않으면 로그인이 되지않는 상태이다 (session = null일때)
				// removeAttribute는 초기화 시킨다. 초기화 시키고 setAttribute로 다시 값을 집어 넣겠다!
				// setAttribute 값을 집어 넣는다.
				// getAttribute 해당요소에 지정된 값을 반환시킨다.
				session.removeAttribute("userid"); 
				session.removeAttribute("name");
				session.setAttribute("userid", loginDto.getId()); 
				session.setAttribute("name", loginDto.getName());
				
			} else {
				result = 3; // 아이디 또는 비밀번호가 틀린경우이므로 값을 반환한다
			}
		}
		
		return result;
		
		// 2.DB결과에 따라 동작
		//  - 회원인데 인증을 안한경우
		
		// 	- 회원인데 인증한 경우
		
		//  - 회원이 아닌경우
		

	}
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}
	
	
}
