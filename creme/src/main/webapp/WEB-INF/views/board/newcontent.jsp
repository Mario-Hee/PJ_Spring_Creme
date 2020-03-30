<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			background: #f5f6f7;
			font-family: 'Nanum Gothic Coding', monospace; 
			margin: 0;
			padding: 0;
			font-size: 14px;
			color: #1D292C;
			padding-top: 70px;
			 padding-bottom: 30px;
		}
		.container {
			border: 1px solid #d7d5d5;
			border-top: 2px solid #34495e;
			width: 900px;
			height: 800px;
			margin: 30px auto;
		}
		.inner_txt {
			position: relative;
			top: 5px;
		}
		.writer_txt {
			display: inline-block;
			position: relative;
			top: 19px;
			left: 11px;
		}
		.writer_inner {
			color: #1b1b1b;
			display: inline-block;
			position: relative;
			right: 241px;
			bottom: -1px;
			font-size: 17px;
		}
		.mb-3 {
			font-size: 18px;
			font-weight: bold;
			color: #1b1b1b;
			margin: 0 0 20px 34px;
		}
		.form_control {
			width: 700px;
			height: 30px;
			font-size: 14px;
			color: #d7d5d5;
			position: relative;
			left: 26px;
			text-align: center;
		}
		.content_txt {
			position: relative;
			bottom: 285px;
			left: 17px
		}
		.title_txt {
			position: relative;
			left: 17px;
		}
		#title {
			position: relative;
			left: 62px;
			font-family: 'Nanum Gothic Coding', monospace;
			border: 1px solid #d7d5d5;
		}
		#content {
			height: 400px;
			position: relative;
			left: 62px;
			text-align: center;
			border: 1px solid #d7d5d5;
		}
		#tag {
			height: 150px;
			font-weight: bold;
			font-family: 'Nanum Gothic Coding', monospace;
			border: 1px solid #d7d5d5;
			margin: 0 0 0 -15px;
		}
		.tag_txt {
			height: 100px;
		}
		.btn_comm {
			position: relative;
			text-align: center;
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
			right: 226px;
		}
		#btnup {
			position: relative;
			left: 311px;
		}
		.fa, .fas {
			font-weight: 900;
		}
	</style>
</head>

<body>
	<article>
		<div class="container" role="main">
			<form name="form" id="form"  method action>	
				<div class="inner_txt">
					<div class="mb-3">
						<label class="writer_txt" for="reg_id">작성자</label>
							<div class="form_control"><span class=" writer_inner">왕콘치</span>
						</div>
					</div>
					<div class="mb-3">
						<label class="title_txt" for="title">제목</label>
						<input type="text" class="form_control" name="title" id="title" placeholder="제목을 입력해 주세요">
					</div>
					<div class="mb-3">
						<label class="content_txt" for="content">내용</label>
						<textarea class="form_control" rows="5" name="content" id="content" placeholder></textarea>
					</div>
					<div class="mb-3">
						<label class="tag_txt" for="tag"><i class="fas fa-paperclip"></i>첨부파일</label>
						<input type="text" class="form_control" name="tag" id="tag" placeholder="첨부파일을 드래그 해주세요">
					</div>
				</div>
			</form>
			<div class="btn_comm">
				<button type="button" class="btn button.btn_basic" id="btncancle">취소</button>
				<button type="button" class="btn button.btn_basic" id="btnup">등록</button>
			</div>
		</div>
	</article>
</body>
</html>