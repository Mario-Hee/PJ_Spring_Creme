package com.creme.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.creme.persistence.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service // 붙어있어야 스프링이 권한을 가져감. 
		 // 붙어있다고 스프링이 읽지는 않고 표지판같은 기능이다. 서블릿컨텍스트에 가서 컨포넌트 스캔이 읽는다. 
		 // 스캔해서 빈즈로 객체생성을 한다. 
public class MailServiceImpl implements MailService{  //구현, 인터페이스 자기타입도 되고 부모타입도 된다!
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMwmberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	// 이메일 난수 생성 메서드
	private String init() {
		Random ran = new Random(); //무언가 random한 값을 만들 수 있는 큰 객체!
		StringBuffer sb = new StringBuffer(); // StringBuffer String 문자열이 차곡차곡 쌓인것을 처리
											  // StringBuffer 를 안써도 되는데 문자열을 쓰는 효율성때문에 StringBuffer를 쓴다. 
		int num = 0;
		
		do { // while문 실행 전에 최초로 한번 실행
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				// num에 무작위 랜덤한 숫자가 들어온다. 48과 57 사이에 들어오는 사이값이면 if를 탄다. 
				sb.append((char) num); //char 타입 (문자 하나를 체크한다, 'A'= 65  ) append(기존값 맨 뒤에 붙이는 것) buffer에 추가하라
			} else {
				continue;
			}
			
		} while(sb.length() < size); // size: 20 , 20보다 작으면 다시 실행해라
			if(lowerCheck) {
				return sb.toString().toLowerCase(); // tostring으로 넣었을때 buffer에 있던 것을 완벽하게 문자열로 만들어 준다. 
													// tostring으로 넣기전까진 Buffer임시저장소에 저장되있따.  
													// init()에서 만들어진 20글자의 난수를 리턴해라
			}
			return sb.toString();
		}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getkey(boolean lowerCheck, int size) { // 인스턴스에 있는 전역변수 getkey에 20, false가 들어가있다.
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init(); // init() 호출(호출한 곳은 getkey)
	}
		
	//회원가입 발송 이메일(인증키 발송)
	@Override
	public void mailSendUser(String email, String id, HttpServletRequest request) {
//		log.info("메일을 보내볼까???");
		String key = getkey(false, 20); // 길이 20의 난수 생성 , getkey메서드 호출
		log.info(id+","+email);
		mDao.getkey(id, key);
		MimeMessage mail = mailSender.createMimeMessage(); // Mime타입 : 타입중 하나, 사진이나 동영상, 소리(주로 첨부파일)를 자동으로 형변환 해주는 타입이다ㅏ.
														   // 메일 보낼때 첨부파일을 넣어서 보낼 수도 있으므로 Mime타입을 쓴다.
		String htmlTxt = "<h2>안녕하세요 CREME입니다:)<h2><br><br>" // htmlTxt 문자열 변수를 하나 만들고 값을 전달하겠다!
				+ "<h3>" + id + "님</h3>" + "<p>인증하기 버튼을 누르시면 CREME사이트 활동이 가능합니다."
				+ "<a href='http://localhost:8081" + request.getContextPath() + "/member/keyauth?id=" + id +"&key="+key+"'>인증하기</a></p>"
				+ "(CREME에 가입한적이 없다면 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] CREME님의 인증메일 입니다","utf-8"); // 메일의 제목을 setSubject로 만들었다.
			mail.setText(htmlTxt, "utf-8", "html"); // 메일의 내용(본문)을 setText로 만들었다. html형식으로 만들어야 h2,h3태그를 인식한다. 한글을 써야하므로 utf-8 을 쓴다. 
			mail.addRecipient(RecipientType.TO, new InternetAddress(email)); // 메일의 수신자를 addRecipient 만들었다. email -> 사용자가 입력한 email이 수신자가 되는 것이다.
			mailSender.send(mail); // 메일 발송
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int keyAuth(String id, String key) {
		return mDao.alterkey(id, key);
	}
	
//	@Override
//	puvlic int memInsert(MemberDTO, mDto) {
//		return mDao.memInsert(mDto);
//	}
	
}
