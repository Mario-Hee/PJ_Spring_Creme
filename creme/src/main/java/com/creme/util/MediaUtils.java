package com.creme.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String,MediaType> mediaMap; // 변수만 만들어 진 것
	// 클래스를 로딩할 때 제일 먼저 실행되는 코드
	static {
		mediaMap = new HashMap<>(); // 변수생성
		mediaMap.put("JPG", MediaType.IMAGE_JPEG); // .put : 집어 넣는 것 
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG); // String타입으로 받게되니까, PNG타입의 그림이라는걸 알려줘야한다.
		// mediaMap.put에는 총 3개의 값이 들어있다.
	}
	public static MediaType getMediaType(String type) {  // 타입이 PNG파일이라고 가정할때,
		// toUpperCase() 대문자로 변경
		return mediaMap.get(type.toUpperCase()); // 타입에 PNG파일이 들어 있다.
		// .get -> mediaMap에 있는 값을 꺼내와라
		
	}

}
