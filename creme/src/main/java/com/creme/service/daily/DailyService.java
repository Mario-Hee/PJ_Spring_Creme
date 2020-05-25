package com.creme.service.daily;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creme.persistence.DailyDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DailyService {
	// 인터페이스를 만들고 구현 받아서
	// 오버라이딩한 메서드를 사용할 것이냐
	// 또는
	// 내가 그냥 직접 메서드를 만들어서 사용할 것이냐의 차이다.
	
	@Autowired
	private SqlSession sqlSession;
	
	DailyDAO dDao; //전역변수
	
	@Autowired
	public void newDailyDAO() {
		dDao = sqlSession.getMapper(DailyDAO.class);
	}
	
	public void dailyCreate() {
		
	}
	public void dailyRead() {
		
	}
	public void dailyUpdate() {
		
	}
	public void dailyDelete() {
		
	}
}
