<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/include.jsp" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>글쓰기</title>
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding&display=swap');
 		body {
			background: #fff;
			font-family: 'Nanum Gothic Coding', monospace; 
			margin: 0;
			padding: 0;
			font-size: 14px;
			color: #1D292C;
			padding-bottom: 30px;
		}
		.header_content_logo_img {
			max-width: 135px;
			display: block;
			margin: auto;
		}
		.container {
			border: 1px solid #d7d5d5;
			border-top: 2px solid #34495e;
			width: 900px;
			height: 882px;
			margin: 30px auto;
			padding: 10px;
		}
		.inner_txt {
			position: relative;
			top: 5px;
		}
		.writer_txt {
			display: inline-block;
			position: relative;

		}
		.writer_inner {
			color: #1b1b1b;
			display: inline-block;
			position: relative;
			font-size: 17px;
			top: 5px;
		}
		.mb-3 {
			display: flex;
			font-size: 18px;
			font-weight: bold;
			color: #1b1b1b;
			margin-bottom: 20px;
			align-items: center;
			justify-content: space-between;
			padding: 0 47px;
		}
		.board_fileDrop {
			display: flex;
			font-size: 18px;
			font-weight: bold;
			color: #1b1b1b;
			margin-bottom: 20px;
			align-items: center;
			justify-content: space-between;
			padding: 0 47px;
		}
		.form_control {
			width: 700px;
			height: 30px;
			font-size: 14px;
			color: #1b1b1b;
			position: relative;
			text-align: left;
			border: 1px solid #d7d5d5;
		}
		.content_txt {
			min-width: 84px;
		}
		.title_txt {
			
		}
		#title {
			position: relative;
			font-family: 'Nanum Gothic Coding', monospace;
			border: 1px solid #d7d5d5;
		}
		#content {
			height: 450px;
			position: relative;
			text-align: center;
			border: 1px solid #d7d5d5;
		}
		#tag {
			height: 150px;
			font-weight: bold;
			font-family: 'Nanum Gothic Coding', monospace;
			border: 3px dashed #d7d5d5;
		}
		.tag_text {
			color: gray;
			position: absolute;
			padding: 65px 194px;
			font-size: 18px;
		}
		.tag_txt {
			min-width: 85px;
		}
		.board_div {
			background: white;
			width: 700px;
			border: 1px solid #d7d5d5;
		}
		.btn_comm {
			position: absolute;
			padding: 0 410px;
		}
		.btn {
			width: 80px;
			height: 40px;
			background-color: #95A5C3;
			color: white;
			font-weight: bold;
			border: 1px solid #95A5C3;
			border-radius: 4px;
			font-family: 'Nanum Gothic Coding', monospace; 
		}
		.btn:hover {
			background-color: #34495e;
			border: 1px solid #34495e;
			border-color: transparent;
			color: white;
			font-family: 'Nanum Gothic Coding', monospace; 
		}
		#btncancle {
			position: relative;

		}
		#btnup {
			position: relative;

		}
		.fa, .fas {
			font-weight: 900;
			position: relative;
			z-index: 10;
			color: gray;
		}
		.error_msg {
			color: tomato;
			font: 14px;
			padding: 0 148px;
			display: none;
		}
		
	</style>
</head>

<body>
	<!-- 스프링에서 제공하는 폼태그 -->
	<form:form id="frm_board"> 
		<div class="container" role="main">
			<form name="form" id="form"  method action>	
				<div class="inner_txt">
					<div class="mb-3">
						<label class="writer_txt" for="reg_id">작성자</label>
						<div class="form_control">
							<span class=" writer_inner"><b>${name}</b></span>
							<input type="hidden" value="${name}" name="writer">
						</div>
					</div>
					<div class="mb-3">
						<label class="type_txt" for="type">타입</label>
						<select type="board_type" class="form_control" name="type" id="board_type">
							<option value="free" selected>자유게시판</option>
							<option value="qna">QnA게시판</option>
							<option value="review">제품후기</option>
						</select>
					</div>
					<div class="mb-3">
						<label class="title_txt" for="title">제목</label>
						<input type="text" class="form_control" name="title" id="title" placeholder="제목을 입력해 주세요" value="${one.title}">
					</div>
					<div class="mb-3">
						<label class="content_txt" for="content">내용</label>
						<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
						<textarea id="board_content" name="view_content" style="width: 100%; height: 400px;">${one.view_content}</textarea>
					</div>
					
					<!-- 게시글 첨부파일 목록 -->
					<div class="board_fileDrop">
						<label class="tag_txt" for="tag">파일</label>
						<div type="text" class="board_div fileDrop" name="tag" id="tag" >
							<span class="tag_text"><i class="fas fa-paperclip"></i>첨부파일을 드래그 해주세요</span>
						</div>
						<ul class="mailbox-attachments clearfix uploadedList"></ul>
					</div>
					
				</div>
			</form>
			
			<!-- 유효성 체크 경고 메세지  -->
			<div>
				<span class="error_msg">필수 정보입니다.</span>
			</div>
			
			
			<!-- 취소, 등록 버튼 -->
			<div class="btn_comm">
				<button type="button" class="btn button.btn_basic" id="btncancle">취소</button>
				<button type="button" class="btn button.btn_basic" id="btnup">등록</button>
			</div>
		</div>
	</form:form>
	
	<script type="text/javascript">
		var flag = '${flag}';
		console.log('flag: ' + flag);
	
	
		$(function(){	
			// update인 경우에만
			
			// register를 게시글 등록과 게시글 수정할 때 사용하는데, 
			// ${one}에 값이 있으면 수정페이지 로딩한다.
			if(flag == 'update') {      
				// 수정페이지로 디자인 변경
				$('.btn').css('background', '#95A5C3;');
				$('#btnup').removeClass('.btn')
							 .addClass('.button.btn_basic')
							 .text('수정');
				
				// SelectBox 값으로 Selected
				$('#board_type').val('${one.type}').attr('selected', 'selected');
				
			} else if(flag == 'answer') {
				// 답글페이지로 변경
				$('.btn').css('background', '#95A5C3;');
				$('#btnup').removeClass('.btn')
							 .addClass('.button.btn_basic')
							 .text('답글');
				
				// SelectBox 값 선택 할 수 없도록 고정
				$('#board_type').val('${one.type}')
								.attr('selected', 'selected')
								.attr('onFocus', 'this.initialSelect = this.selectedIndex')
								.attr('onChange', 'this.selectedIndex = this.initialSelect');
				$('#title').val('${one.title}').attr('readonly', 'readonly');
							
			}
			
			// 첨부파일
			// 1.웹브라우저에 drag & drop시 파일이 열리는 문제(기본 효과)
			//	  기본 효과 막음!
			$('.fileDrop').on('dragenter dragover', function(e){
				e.preventDefault();
			});
			
			// 2.사용자가 파일을 drop했을 때
			$('.fileDrop').on('drop', function(e){
				e.preventDefault();
				console.log("파일전송");
				
				var files=e.originalEvent.dataTransfer.files;	// 드래그에 전달된 
				var file=files[0];	// 그중 하나만 꺼내옴
				
				var formData = new FormData();	// 폼 객체 생성	
				formData.append('file', file);	// 폼에 파일 1개 추가한다
				
				
				// 서버에 파일 업로드
				$.ajax({
					url: '${path}/upload/uploadAjax',
					data: formData,
					datatype: "text",
					processData: false,		// 쿼리스트링 방식 생성X
					contentType: false,		// (contentType: 서버를 보내는 역할) 서버단으로 전송하는 데이터 타입(multipart)
					type: 'POST',			// 쿼리스트링은 길이제한이 있다(GET).  프로세서 데이터를 false로 하면 쿼리스트링 방식을 쓰지 않는다. 
					success: function(data) {
						console.log(data);
						// data: 업로드한 파일 정보와 http 상태 코드
						printFiles(Data);	// 첨부파일 출력 메서드 호출한다
					}
				});
			});
			
			
			
		});
			
		$(document).on('click', '#btncancle', function(){
			var referer = '${header.referer}';
			console.log('이전 URL: '+referer);
			
			var index = referer.indexOf('/board/list');
			console.log('index: '+referer.indexOf('/board/list'))
			
			if(index == '-1') {
				location.href = '${path}/board/list';				
			} else {
				location.href = '${header.referer}';
			}
			
		});
		// 게시글 등록 버튼
		$(document).on('click', '#btnup', function(){
			// 유효성체크(제목)
			var title = $('#title').val();
			
			if(title == '' || title.length == 0) {
				// 에러메세지 '제목을 입력해주세요.'
				$('.error_msg').css('display', 'block');
				 alert('값 입력해!');
				return false;
			} else {
				// 서버로 전송
				// 에디터의 내용이 textarea에 적용된다.
				// 스마트에디터에 있는 값을 #board_content에 입력한다. (값을 #board_content에 집어 넣어준다.)
 				oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
				var view_content = $('#board_content').val();
				// console.log('view_content: ' + view_content);
				// view_content는 스마트에디터에서 가져온 값	
				// search_content는 순수 Text
				// 정규식을 통해 HTML 태그를 제거 후 순수 Text만 추출한다
				var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp;","");
				// console.log('search_content: ' + search_content);	
				// 순수 Text를 얻으면 화면단에서 서버단으로 옮겨줘야한다. 
				// 게시글 등록 버튼을 눌렀을때 폼 태그의 .append때문에 맨 마지막에 추가한다.
				// .append("코드") : 선택한 요소의 내용의 맨 끝에 콘텐트를 추가한다.
				 $('#frm_board').append('<textarea id="search_content" name="search_content"></textarea>');
				 $('#search_content').val(search_content);
				//var search_content2 = $('#search_content').val();		
				//console.log('search_content2: ' + search_content2);
				// alert('옮지! 서버로 옮겨 줄게!');
				// 서버로 이동!
				 $('#frm_board').submit();
				// alert('서버로 이동!!!!');
			}
			
		});
		
		$(document).on('keyup', '#title', function(){
			var len = $(this).length;
			
			if(len != 0) {
				$('.error_msg').css('display', 'none');
			}
		});
	</script>
		
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "board_content",
	    sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
		});
	</script>
		
</body>
</html>