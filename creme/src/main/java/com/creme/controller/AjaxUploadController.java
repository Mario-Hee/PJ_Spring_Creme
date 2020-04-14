//Controller에서 multipart타입의 자료를 받으려면 servlet-context에 파일 업로드 하는 multipartResolver 빈즈를 생성해줘야한다
package com.creme.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import javax.annotation.Resource;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.creme.service.Board.BoardService;
import com.creme.util.MediaUtils;
import com.creme.util.UploadFileUtils;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AjaxUploadController {
	
	
	
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-context.xml에 설저되어 있음
	// 의존성 주입
	@Resource(name = "uploadPath")
	String uploadPath;
	
	//Upload File 멀티파트파일에 Save
	// 파일첨부 할때는 예외처리 해야함
	// @RequestMapping( method = "get" OR "post"로 적으면 get인지 post인지 확인 할 수 있는데 안 쓰면 둘다 사용 할 수 있음)
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax", produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		log.info("POST : uploadAjax");
		// 업로드한 파일 정보와 Http 상태 코드를 함께 리턴  : Ajax에 있는 success: function (data)의 data에 리턴 
		//UploadFileUtils :static 메서드(객체생성없이 사용 가능)
		// c드라이브에 developer의 uploadPath 
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes()),HttpStatus.OK);
	}
	
	//이지미 표시기능
	@ResponseBody // view가 아닌 data 리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		//log.info("와아아ㅏ아아아아아아ㅏ아ㅏ아ㅏㅏ아ㅏ아ㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		//서버의 파일을 다운로드하기 위한 스트림
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			//확장자검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			//헤더구성객체
			HttpHeaders headers = new HttpHeaders();
			// InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
//				if(mType != null) { // 이미지 파일이면
//					headers.setContentType(mType);
//				}else { //이미지가 아니면
					fileName= fileName.substring(fileName.indexOf("_")+1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					//큰 따옴표 내부 "\" "
					//바이트배열을 스트링으로
					//iso-8859-1 서유럽언어
					//new String(fileName.getBytes("utf-8),
					headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"),"iso-8859-1")+"\"");
					//header.add(headers.add("Content-Disposition", "attachment; fileName=\""
							
			
				//바이트배열 헤더
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			if(in != null)
				in.close(); // 스트림 닫기
		}
		 return entity;
	}
	
	@ResponseBody
	@PostMapping("/upload/deleteFile")
	public ResponseEntity<String> deletsFile(String fileName) {
		log.info("fileName: " + fileName);
		// fileName : /2020/04/10/s_13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg
		
		// 확장자 검사
		String formatName= fileName.substring(fileName.lastIndexOf(".") + 1); // 끝에서부터 점을 찾으라
		// formatName = jpg
		MediaType mType = MediaUtils.getMediaType(formatName);
		// 이미지일때만 차는 if문
		if(mType != null) { // 이미지 파일이면 원본이미지 삭제
			String front = fileName.substring(0, 12); // 12이므로 11까지 잘린다 (0-11) 끝의 값을 포함이 안된다.
			// front : /2020/04/10
			
			String end=fileName.substring(14);
			// end : 13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg  s_가 빠졌다. 원본이미지 경로이다.
			
			// File.separatorChar : 유닉스/ , 윈도우즈\
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
			// new File(c://developer/upload/2020/04/10/13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg) (원본이미지)
			// replace >> c:\\developer\ upload\2020\04\10\13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg 역슬러시\ 로 치환(윈도우)
			// delete >> c:\\developer\ upload\2020\04\10\13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg
			// 원본이미지 삭제 
		}
		// 원본 파일 삭제(이미지면 썸네일 삭제)
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		// new File(c://developer/ upload/2020/04/10/s_13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg (썸네일이미지)
		// replace >> c:\\developer\ upload\2020\04\10\s_13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg
		// delete >> c://developer/ upload/2020/04/10/s_13c900ce-6b89-4a7f-b7c2-f110b9ac202b_banana.jpg 
		
		// 썸네일 이미지 삭제 or 이미지가 아닌 첨부파일 삭제
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		// deleted 라는 값을 보내줄거고 HttpStatus(상태코드)를 보내줄건데 200이 들어오면 .OK 성공이다.
		// 아직은 Local에서 이미지는 지워지나 화면단에서 디자인이 삭제가 안된다.  
	}
	
	@ResponseBody // 뷰가 아닌 데이터를 리턴
	@PostMapping("upload/deleteAllFile")
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		log.info("delete all files: " + files);
		
		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files) {
			String formatName=fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType=MediaUtils.getMediaType(formatName);
			
			if(mType != null) { //이미지 파일이면 원본 이미지 삭제
				String front=fileName.substring(0, 12);
				String end=fileName.substring(14);
				//File.separatorChar : 유닉스 /, 윈도우즈 \
				new File(uploadPath+(front+end).replace('/',File.separatorChar)).delete();
			}
			
			// 원본 파일 삭제(이미지면 썸네일 삭제)
			new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
}