package com.creme.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	
	
	//cron 표기법
	//ex) 0시 7분 10시 년 월 일
	//@Scheduled(cron = "0 07 10 * * *")
	public void cronTest() {
		log.info("Welcome Scheduling:)");
	}

}
