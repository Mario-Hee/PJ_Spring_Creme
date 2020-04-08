package com.creme.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.creme.service.Board.BoardService;
import com.creme.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bSrService;
	
	// 첨부파일을 넣을 경로
	// 업로드 디렉토리 servlet-context.xml에 설정되어 있다.
	@Resource(name = "uploadPath") 
	String uploadPath;
	
	// 파일첨부 페이지로 이동
	// Get으로 와도 Post로 보낸다.
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
		log.info("GET: upload Ajax");
		return "/upload/uploadAjax";
	}
	
	// Upload File 멀티파트파일에 Save
	// @ResponseBody : Ajax를 사용할 때 붙인다. 페이지 이동을 안한다.
	@ResponseBody
	@PostMapping(value="/upload/uploadAjax", produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {	 // MultipartFile로 보냈으니 멀티파트타일로 받아야한다. 
		log.info("POST: upload Ajax");
		// 업로드한 파일 정보와 Http 상태 코드를 함께 리턴한다
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
		// new ResponseEntity : 객체 생성을 해서 인스턴스가 만들어지면 그대로 바로 보내준다.
		// < > : 제네릭 -> < >안에 들어오는 타입을 강하게 체크한다. 일종의 유효성 체크
		//       <String>이면 String타입의 값만 받으므로 다른 타입은 못들어오게 애초에 막아버린다. 
		// file. : 첨부파일 하나
		// file.getOriginalFilename() : 순수한 파일의 이름만 가져온다.
		// file.getBytes()) : 올릴 첨부파일의 크기를 알려준다.
		
		// 순서
		// 1.Ajax 끝나고 View단을 갈 때 uploadPath : d/:developer/upload
		// 2.파일이름
		// 3.파일크기(byte)
		// 4.HttpStatus(상태).OK 로 성공 (200은 성공)
	}
}
