/*
 *  Login이 필요한 기능 수행시
 *  Session 체크를 하는 Interceptor
 */
package com.creme.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
// 상속 필요하다
public class LoginInterceptor extends HandlerInterceptorAdapter{
	// 부모 메서드를 재정의 하는 Override를 사용
	// HandlerInterceptorAdapter에 있는 메서드를 재정의해서 사용하겠다
	// 전처리/후처리 하나만 단독으로 사용해도 된다.(그래서 후처리 주석 함)
	// preHandle == url 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Session 객체 생성
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userid");
		log.info(">>>>> id Session: " + id);
		
		// LOGIN NO
		// return 값이 true면 인터셉터가 낚아채서 조건이 충족되면 통과해준다.
		// return 값이 flase면 인터셉터가 이전 페이지로 이동한다.
		if(session.getAttribute("userid") == null) {
			log.info(">>>>> NOLOGIN:(");
			// referer = 바로 직전에 머물렀던 웹링크 주소
			// 이전 페이지 URL을 GET한다
			String referer = request.getHeader("referer"); 	
			log.info(">>>>> 이전 URL: " + referer);
			
			// URL만 신경쓴다. GET or POST는 중요하지 않다.
			// 예를들어) 회원수정페이지: GET:/member/update
			// 회원수정DB: POST:/member/update 
			// 수정페이지의 공통된 /member/update만 URL에 하나만 넣어두면 GET or POST를 쓰지 않아도 된다. 
			
			
			// request(GET, POST) 요청 보냄 > response(forward, sendRedirect) 응답 받음
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			
			// URL로 바로 접근한 경우(referer이 없는 경우) 인덱스로 이동 
			if(referer == null) {
				referer = "http://localhost:8081/creme/";
			}
			log.info("null URL:" + referer);
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			
			//response.sendRedirect(referer+"?message=nologin"); // 값을 보내줘야하므로 쿼리스트링을 쓴다.
			
			return false; // 원래 가려던 곳으로 이동 할 수 없어!
			
		// LOGIN OK	
		} else {
			log.info(">>>>> LOGIN:)");
			return true; // 원래 가려던 곳으로 이동해!
		}
		
	}
	
// postHandle == url 후 
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}
	
}
