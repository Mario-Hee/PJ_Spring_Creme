package com.creme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creme.domain.DailyDTO;
import com.creme.service.daily.DailyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/daily")	
public class DailyController {	
	
	// 조회(1개의 메서드 필요=Action)
	// 등록(1개의 메서드 필요=Action)
	// 수정(1개의 메서드 필요=Action)
	// 삭제(1개의 메서드 필요=Action)
	
	@Autowired // 의존성 주입(의존성 주입을 사용하려면 스프링이 객체에 대한 제어권을 가지고 있어야한다.)
	DailyService dService;
	// dailyService ds = new DailyService(); 개발자 x, Spring
	// dService = ds

	
	
	@GetMapping("/create")
	public void dailyAppend(DailyDTO dDto) {
		log.info("Daily Appled:");
		log.info(dDto.toString());
		dService.dailyCreate();
	}
	@GetMapping("/read") // 데이터베이스에서 읽어온다.
	public void dailySelectAll() {
		log.info("Daily Select:");
		dService.dailyRead();
	}
	@GetMapping("/update") // 데이터베이스에 가서 내용을 수정한다.
	public void dailyUpdate() {
		log.info("Daily Update:");
		dService.dailyUpdate();
	}
	@GetMapping("/delete") // 데이터베이스에 가서 내용을 삭제한다.
	public void dailyDelets() {
		log.info("Daily Delete:");
		dService.dailyDelete();
	}


}
