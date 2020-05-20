package com.creme.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	// 메모리 => mediaMap 변수공간
	// 				ㄴ HashMap() 구조 만듬
	//						  KEY : VALUE 
	//					ㄴ 1) JPG : MediaType.IMAGE_JPEG
	//					ㄴ 2) GIF : MediaType.IMAGE_GIF
	//					ㄴ 3) PNG : MediaType.IMAGE_PNG
	// result: mediaMap 안에 3개의 데이터(JPG, GIF, PNG) 저장
	
	private static Map<String,MediaType> mediaMap; // 변수만 만들어 진 것
	// 클래스를 로딩할 때 제일 먼저 실행되는 코드
	// static{} => static 블록
	// static 블록: 프로그램 시작과 동시에 실행되어 메모리에 상주하는 코드!
	static {
		mediaMap = new HashMap<>(); // 변수생성
		mediaMap.put("JPG", MediaType.IMAGE_JPEG); // .put : 집어 넣는 것 
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG); // String타입으로 받게되니까, PNG타입의 그림이라는걸 알려줘야한다.
		// mediaMap.put에는 총 3개의 값이 들어있다.
	}
	//											jpg
	public static MediaType getMediaType(String type) {  // 타입이 PNG파일이라고 가정할때,
		// toUpperCase() 대문자로 변경
		//					jpg => JPG
		return mediaMap.get(type.toUpperCase()); // 타입에 PNG파일이 들어 있다.
		// .get -> mediaMap에 있는 값을 꺼내와라
		// return MEdiaType.IMAGE_JPEG;  <-- 결과적으로 IMAGE_JPEG을 찾는것이다.
		// 나를 호출한 곳으로 다시 돌아가라.
	}

}
