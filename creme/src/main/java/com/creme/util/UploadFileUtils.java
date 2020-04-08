package com.creme.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils { 
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		// uuid 발급
		// uuid : 중복된 이름을 방지하기 위해 사용하는 ID , 랜덤한 id값을 만들어준다.
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName; // 랜덤한 id 값 뒤에 파일이름을 붙여서 중복된 파일이름이 없게 한다. 
		// 업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath); // calcPath : 캘린더라고 생각하면 된다. 오늘 날짜로 된 폴더를 만들어 준다.
												// 당일날 올라온 파일은 그 날짜 폴더에 파일을 집어넣어준다
												// uploadPath 의 경로는 d/:developer/upload 까지
		File target = new File(uploadPath + savedPath, savedName); // saveName : 중복된 이름을 확인 
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target); // 첨부파일을 (target)어디에 어떤 이름으로 (fileData)데이터를 넣어라
		// 파일의 확장자 검사 
		// 이미지인지 확장자를 보고 판단한다.
		// a.jpg / aaa.bbb.ccc.jpg 
		// lastIndexOf : 파일이름에 .이 들어 갈 수 있으므로 뒤에서부터 .을 찾도록 한다.
		// formatName : 확장자가 들어온다.
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1); 
		String uploadFileName = null;
		// 이미지 파일은 썸네일 사용
		if (MediaUtils.getMediaType(formatName) != null) {
			// 썸네일 생성
			uploadFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadFileName;
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance(); // (오늘)달력 값을 가져온다
		String yearPath = File.separator + cal.get(Calendar.YEAR); // separator : 구분자, 구분하는 것은 = /  ==>(오늘) yearPath : /2020
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // ==>(yearPath)/2020  + (오늘) monthPath /04  , MONTH는 0부터 12까지 인식이 되므로  +1을 해줘야한다.
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); //  ==>(yearPath)/2020 + (monthPath)/04 + (오늘)datePath/08 가 들어온다.
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		
		return datePath;
	}
	
		// makeDir(uploadPath, yearPath, monthPath, datePath); --> yearPath, monthPath, datePath가 String ...으로 들어가 있다. 
	private static void makeDir(String uploadPath, String... paths) {
		// ...은 동일한 타입의 매개변수를 여러개 받을때 사용한다.
		// ...을 쓰면 paths를 쓰는 애들을 모두 배열list로 만들어준다
		// ...은 동적으로 매개변수가 바뀌어야할 때 사용한다. 
		// 사용할때마다 매개변수가 달라질때 사용한다. 기능은 같은데 매개변수가 달라질때 사용한다.
		
		// 디렉토리가 존재하면 skip한다
		if (new File(paths[paths.length - 1]).exists()) {  // 마지막 길이를 사용하고 싶다면 - 1을 한다. 0부터 있기 때문에 총 길이는 3인데 마지막 길이는 2이다.
			return;  // 폴더가 있으면 return하고 끝낸다. 
		}
		
		// 디렉토리가 존재하지 않으면 아래를 실행한다.
		for (String path : paths) {
			File dirPath = new File(uploadPath + path); // 폴더가 없으면 uploadPath를 실행해서 폴더를 만든다.
														// (uploadPath) c/:developer/upload + (path) /2020 / 04 /08
														// d/:developer/upload/2020/04/08 파일이 만들어진다. 
			if (!dirPath.exists()) { // 파일이 있는지 확인하고 있으면 넘어가고, 파일이 없으면 아래 mkdir()을 실행한다.
				dirPath.mkdir(); // 디렉토리를 생성한다.
			}
		}
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		// 아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름을 리턴
		// File.separatorChar : 디렉토리 구분자
		// 윈도우 \ , 유닉스(리눅스) /
		return iconName.substring(uploadPath.length()).replace(File.pathSeparatorChar, '/'); // replace : 치환, 모두 /로 바꾸라는 것
		// iconName = C:/developer/upload/2020/04/08/1klj3123123_abc.txt
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// 이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName)); // sourceImg: 원본 이미지, Local에 저장 되어있다.
		// 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100); // destImg : 썸네일 이미지, Local에 저장이 안 된 상태
		// 썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); // lastIndexOf ("."): 뒤에서 .을 찾아서 확장자 확인 후 데이터를 
																			   // formatName 에 집어 넣는다
		// 썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.pathSeparatorChar, '/');
	}
}
