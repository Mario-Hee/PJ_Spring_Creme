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
			padding: 65px 225px;
			font-size: 18px;
		}
		.tag_txt {
		}
		.form_inner {
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
						<textarea name="content" id="board-content" style="width: 100%; height: 400px;">${one.content}</textarea>
					</div>
					<div class="mb-3">
						<label class="tag_txt" for="tag">첨부파일</label>
						<div type="text" class="form_inner" name="tag" id="tag" >
							<span class="tag_text"><i class="fas fa-paperclip"></i>첨부파일을 드래그 해주세요</span>
						</div>
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
		$(function(){	
			// update인 경우에만
			
			// register를 게시글 등록과 게시글 수정할 때 사용하는데, 
			// ${one}에 값이 있으면 수정페이지 로딩한다.
			if('${one}' != '') {
				// 수정페이지로 디자인 변경
				$('.btn').css('background', '#95A5C3;');
				$('#btnup').removeClass('.btn')
							 .addClass('.button.btn_basic')
							 .text('수정');
				
				// SelectBox 값으로 Selected
				$('#board_type').val('${one.type}').attr('selected', 'selected');
			}
		});
			
		$(document).on('click', '#btncancle', function(){
			var referer = '${header.referer}';
			console.log('이전 URL: '+referer);
			
			var index = referer.indexOf('/board/list');
			console.log('index: '+referer.indexOf('/board/lis'))
			
			if(index == '-1') {
				location.href = '${path}/board/list';				
			} else {
				location.href = '${header.referer}';
			}
			
		});
		$(document).on('click', '#btnup', function(){
			var title = $('#title').val();
			
			if(title == '' || title.length == 0) {
				// 에러메세지 '제목을 입력해주세요.'
				$('.error_msg').css('display', 'block');
				 alert('값 입력해!');
				return false;
			} else {
				// 서버로 전송
				// 에디터의 내용이 textarea에 적용된다.
 				oEditors.getById["board-content"].exec("UPDATE_CONTENTS_FIELD", []);
				// alert('옮지! 서버로 옮겨 줄게!');
				$('#frm_board').submit();
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
		elPlaceHolder: "board-content",
	    sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
		});
	</script>
		
</body>
</html>