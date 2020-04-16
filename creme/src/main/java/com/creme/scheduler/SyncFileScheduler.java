package com.creme.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.creme.domain.AttachDTO;
import com.creme.persistence.BoardDAO;
import com.creme.util.MediaUtils;

import lombok.extern.slf4j.Slf4j;

// 게시글 첨부파일 사용시
// 로컬에 저장된 첨부파일과
// DB에 저장된 첨부파일 이름이
// 매칭이 안되는 경우 아무도 사용하지 않는 파일이므로
// 로컬에서 삭제한다
// 하루에 한번씩 새벽시간에 전날 로컬첨부파일 폴더를 대상으로 삭제한다.

@Slf4j
@Component
public class SyncFileScheduler {

	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao;
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	String uploadPath = "C:/developer/upload";

	
	// 하루 전날 파일 목록 가져오기
	private String getFolderYesterday() {
		// format 형식 생성
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		// 오늘 날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();
		// 오늘 날짜에서 -1해서 어제로 설정
		cal.add(Calendar.DATE, -1);
		// 어제날짜 yyyy-MM-dd로 설정 ex) 2020-04-15
		String str = sf.format(cal.getTime());
		// File.separator은 \ 또는 /로 파일 경로를 분리
		// 2020-04-15을 2020\04\15으로 변경
		return str.replace("-", File.separator);
	}
	
	// 매일 새벽 2시에 첨부파일 목록과 DB를 비교해서
	// DB에 없는 첨부파일을 로컬 디렉토리에서 삭제
	@Scheduled(cron = "0 0 2 * * *") 
	public void checkFiles() throws Exception {
		log.warn("File Check Tack run ......................");
		log.warn("" + new Date());
		
		// DB에 등록되어 있는 첨부파일 목록 불러오기
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		// 오늘 날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); // 어제날짜로 된 첨부파일을 가져온다. 해제할것
		log.info("어제날짜: " + sf.format(cal.getTime()));
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));
		
//		for (AttachDTO one : fileList) {
//			log.info(one.toString());
//		}
		
		// 내 fileList에 담긴 이름
		// fullname = /2020/04/16/s_856d0830-cfb7-4c15-8b9f-557a2fac89c2_minion.jpg
		// fileListPaths = C:/developer/upload/2020/04/16/s_856d0830-cfb7-4c15-8b9f-557a2fac89c2_minion.jpg
		// stream() : 배열에서 값을 하나씩 꺼내온다. fileList에서 값을 하나씩 꺼내온다. = 불러오기
		// .map() : 꺼내온 데이터를 전처리(정제)작업을 한다. stream에서 하나씩 꺼내온 값을 전처리한다. 그래서 .map()은 stream이 없으면 안된다. =전처리
		// .collect : 전처리까지 다 된 작업을 다시 어딘가에 저장한다(집어넣는다.) = 저장
		
		List<Path> fileListPaths = fileList.stream()
				.map(dto -> Paths.get(uploadPath+dto.getFullname())) // 람다식 : 좌측은 매개변수이고  화살표(->) 우측에 있는게 실행하는 함수이다.
				.collect(Collectors.toList());
		
//		 람다식을 사용 안하는 경우 아래 코드 처럼 써야한다.
//		public String sumPath(String fullname) {
//			return Path.get(uploadPath+fullname); 
//		}
		
		// 이미지 파일이면 DB에 썸네일 이미지파일이 등록돼있기 때문에
		// 파일 목록에 원본이미지 파일도 등록
		for(AttachDTO avo : fileList) {
			String fileName = avo.getFullname();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end=fileName.substring(14);
				//file.separatorChar : 유닉스 / 윈도우즈 \
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));
				//원본파일 지움
			}
		}
		
		// 파일목록 : 파일, 원본이미지, 썸네일 이미지
		// 첨부파일 1개 이미지를 2개 넣으면 ==> 파일1, 원본2 , 썸넬2 = 5개가 들어온다.
		// DB
		fileListPaths.forEach(p -> log.info("" + p)); // 람다식 : 좌측은 매개변수이고  화살표(->)우측에 있는게 실행하는 함수이다.
		
		// 하루 전날 첨부파일 저장 폴더 지정
		// uploadPath : C:\developer\ipload\2020\04\15
		// toFile = 모든 파일 목록 //targetDir => Local꺼다
		File targetDir = Paths.get(uploadPath, getFolderYesterday()).toFile();
		
		// 디렉토리의 파일목록(디렉토리 포함)을 File배열로 반환
		// DB 첨부파일 목록과 하루 전 폴더의 첨부파일과 매칭!
		// -> DB에 없는 첨부파일 목록 = 삭제 목록 생성
		// targetDir은 예를들어 파일목록에 5개까 있다면 5개를 .listFiles가 배열로 만든다.(Local) 
		// file은 배열로 만든 것에서 한칸씩 꺼내온다.(Local)
		// .toPath()은 Local목록에 있는 것이 DB 목록에 있냐 없냐를 판단한다. DB 포함하고 있으면 false이므로 다시 반환한다.
		//  DB 포함하고 있지않으면 true이므로 Local에서 삭제한다. 
		// removeFiles은 삭제해야 할 목록이 다 들어있다. 
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		//file => 로컬에 있는 것들 //fileListPaths =DB의 꺼
		//정상이니까 하지말라고 false반환
		//포함하지 않고 있다면 true 로 removeFiles에 들어감
		
		// DB에 등록되지 않은 첨부파일 삭제 시작한다!
		log.warn("====================================================");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
	
}
