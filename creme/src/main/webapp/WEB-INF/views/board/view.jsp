<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>상세게시글</title>
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding&display=swap');
 		body {
		background: #f5f6f7;
		font-family: 'Gothic A1', sans-serif;
		margin: 0;
		padding: 0;
		font-size: 14px;
		color: #1D292C;
	}
		.container {
			width: 900px;
			height: 800px;
			margin: 30px auto;
		}
		.contents {
			position: relative;
			margin: 30px auto;
		}
		.main_board {
			margin: 0;
			padding: 0;
		}
		h2 {
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
		}
		.board_title {
			margin: 0;
			padding: 0;
		}
		.titleArea {
			display: block;
			margin: 0 0 15px;
			border-bottom: 2px solid #34495e;
		}
		.titleArea h2 {
			display: inline-block;
			padding: 1px 421px 8px 15px;
			font-size: 23px;
		}
		.board_read {
			margin: 0;
			padding: 0;
		}
		.base_table table {
			position: relative;
			margin: 10px 0 0;
			border-bottom: 1px solid #d7d5d5;
			border-right: 0;
			border-left: 0;
			border-top-color: #fff;
			color: #1b1b1b;
			line-height: 1.5;
		}
		table {
			width: 100%;
			border-spacing: 0;
			border-collapse: collapse;
		}
		.base-table table:before {
			position: absolute;
			top: 0;
			left: 0;
			display: block;
			content: "";
			width: 100%;
			height: 1px;
			background: #d7d5d5;
		}
		colgroup {
			display: table-column-group;
		}
		tbody {
			display: table-row-group;
			vertical-align: middle;
			border-color: inherit;
		}
		tr{
			display: table-row;
			vertical-align: inherit;
			border-color: inherit;
		}
		.base-table th:first-child {
			border-left: 0;
		}
		.base-table tbody th {
			padding: 11px 0 10px 18px;
			border:  1px solid #d7d5d5;
			border-bottom-width: 0;
			color: #353535;
			text-align: left;
			font-weight: normal;
			background-color: #fbfbfb; 
		}
		.base-table th {
			word-break: break-all;
			word-wrap: break-word;
		}
		.base-table td {
			padding: 11px 10px 10px;
			border-top: 1px solid #dfdfdf;
			color: #353535;
			vertical-align: middle;
			word-break: break-all;
			word-wrap: break-word;
		}
		td {
			zoom: 1;
			line-height: 2.4em;
			font-family: 'Nanum Gothic Coding', monospace;
			font-size: 16px;
		}
		th {
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 18px;
			font-weight: bold;
		}
		ul {
			margin: 0;
			padding: 0;
		}
		.etcArea {
			margin: 1px 19px -13px;
		}
		.etcArea li {
			display: inline-block;
			margin: 0 0 9px;
			padding: 8px 20px 10px;
			vertical-align: top;
			line-height: 22px;
			color: #1b1b1b;
		}
		strong {
			font-weight: bold;
		}
		.txtNum {
			display: inline-block;
			font-size: 15px;
			color: #1b1b1b;
			word-break: normal;
			padding: 0 37px 0;
		}
		.txtNum2 {
			display: inline-block;
			font-size: 15px;
			color: #1b1b1b;
			word-break: normal;
			padding: 0 10px 0;
		}
		.detail {
			line-height: 20px;
			border-top: 1px solid #34495e;
			height: 330px;
		}
		li {
			list-style: none;
		}
		.post_btn {
			height: 46px;
			padding-bottom: 10px;
			margin-bottom: 2px;
		}
		.wrap_postcomment {
			display: inline-block;
			position: relative;
			margin: 9px 0 0 16px;
			bottom: 5px;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
			line-height: 29px;
			padding: 0 10px 0;
		}
		.u_cbox_wrap {
			padding: 67px 27px;
			background: #e9e9e9;
		}
		.u_cbox_write_wrap {
			padding-top: 20px;
			padding-bottom: 20px;
		}
		.u_cbox_write_box {
			position: relative;
		}
		form {
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
			margin: 0;
			padding: 0;
			display: block;
		}
		.u_cbox_write {
			position: relative;
		}
		.u_cbox_write_inner {
			border-color: #34495e;
			position: relative;
			background-color: #fff;
			border: 1px solid #34495e;
			margin: -57px 0 0;
		}
		.u_cbox_profile_area {
			background-color: transparent;
			height: 36px;
			padding-top: 14px;
			padding-left: 17px;
			position: relative;
			padding: 11px 82px 0 14px;
		}
		.u_vc {
			position: absolute;
			clip: rect(0 0 0 0);
			width: 1px;
			height: 1px;
			margin: -1px;
			overflow: hidden;
		}
		.u_cbox_thumb {
			display: block;
			position: relative;
			float: left;
		}
		.u_cbox_img_profile {
			width: 23px;
			height: 23px;
			border-radius: 50%;
			vertical-align: top;
			position: relative;
			bottom: 5px;
		}
		.u_box img {
			border: 0;
		}
		.u_cbox_box_name {
			left: 46px;
			top: 7px;
			display: block;
			overflow: hidden;
			position: absolute;
			right: 82px;
			bottom: 0;
			height: 23px;
			font-size: 12px;
			color: black;
			font-weight: 700;
			line-height: 2.08;
			white-space: nowrap;
			text-overflow: ellipsis;
		}
		.u_cbox_write_name {
			font-weight: 700;
		}
		.u_cbox_write_area {
			max-width: 100%;
			padding-bottom: 8px;
		}
		.u_cbox_guide {
			display: block;
			top: 6px;
			color: #ccc;
			overflow: hidden;
			position: absolute;
			right: 25px;
			bottom: 5px;
			left: 15px;
			z-index: 10;
			border: none;
			font-size: 12px;
			line-height: 1.5;
			cursor: default;
		}
		#Comment {
 		    /*background-image: url(http://rexkirby.com/kirbyandson/images/comment.svg);*/
			background-size: 30px 30px;
 	 		background-position: 11px 8px;
   			background-repeat: no-repeat;
		}
		.Comment {
			word-break: break-all;
			color: black;
			display: block;
			overflow-x: hidden;
			overflow-y: auto;
			position: relative;
			z-index: 1;
			float: left;
			width: 100%;
			height: 56px;
			padding: 6px 0 0;
			margin: 0;
			padding-right: 16px;
			border: none;
			background-color: white;
			font-size: 12px;
			line-height: 18px;
			-webkit-appearance: none;
			vertical-align: top;
			resize: none;
			box-sizing: border-box;
		}
		.base_button {
			display: inline-block;
			padding: 30px 0 0;
		}
		.gLeft {
			display: inline-block;
			position: relative;
			left: 520px;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
		}
		.gRight {
			display: inline-block;
			position: relative;
			left: 519px;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
		}
		.postcomment_up {
			position: relative;
			left: 676px;
			top: 3px;
			border: 1px solid #1b1b1b;
			padding: 10px 24px;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
			background-color: #34495e; 
			color: white;
			text-decoration: none;
			border-radius: 4px;
		}
		.content_txt {
			padding: 20px 40px 0;
		}
		.chat {
			width: 27px;
		}
		.comment_chat {
			position: relative;
			bottom: -2px;
			padding: 0 0 0 10px;
		}
		.like_ico {
			display: inline-block;
			position: absolute;
			right: 16px;
			margin: -2px 0 0 0;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="contents">
			<div class="main_board">
				<div class="board_title">
					<div class="titleArea">
						<h2>자유게시판</h2>
					</div>
				</div>
			</div>
			<!--  board title, main table -->
			<div class="board_read">
				<div class="base_table">
					<table border="1" summary>
						<caption>게시판 상세글</caption>
						<colgroup>
							<col style="width: 130px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>${one.title}</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${one.writer}</td>
							</tr>
							<tr>
								<td colspan="2">
									<ul class="etcArea">
										<li class>
											<strong>작성일</strong>
											<span class="txtNum">${one.regdate}</span>
										</li>
										<li class>
											<strong>조회수</strong>
											<span class="txtNum2">${one.viewcnt}</span>
										</li>
									</ul>
									<div class="detail">
										<div class="content_txt">${one.content}</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="post_btn">
					<div class="wrap_postcomment">
						<div class="postcomment">
							<img src="${path}/resources/img/icons8-chat-bubble-50.png" class="chat"><span class="comment_chat">댓글 1<span>
							<span><a href="#" class="postcomment_up">등록</a></span>
						</div>
						</div>
					</div>
				</div>
				<div class="u_cbox_wrap">
					<div class="u_cbox">
<!-- 						<div class="u_cbox_notice" style="display: none;"></div> -->
						<div class="u_cbox_write_wrap">
							<div class="u_cbox_write_box">
								<form>
<!-- 										<legend class="u_box">댓글쓰기</legend> -->
									<div class="u_cbox_write">
										<div class="u_cbox_write_inner">
											<div class="u_cbox_profile_area">
												<div class="u_cbox_profile">
												<div class="like_ico"><span><a href="#"><img src="${path}/resources/img/icons8-love-24.png" class="like_ico"></span>2</a></div>
													<strong class="u_vc">로그인 정보</strong>
													<div class="u_cbox_thumb">
														<img src="${path}/resources/img/default.png" class="u_cbox_img_profile" >
													</div>			
													<div class="u_cbox_box_name">
														<span class="u_cbox_write_name">꼬부기 2020.03.23 13:03</span> 
														<span>포켓몬 잡으려면 어디로 가야해요?</span>
													</div>
													<div class="u_cbox_write_area">
												<strong class="u_vc">댓글입력</strong>
												<div class="u_cbox_inbox">
													<div id="Comment" class="Comment" style="width: 100%; margin: 2px -15px 0;width: 846px;height: 91px;border: none;resize: inherit; border: 1px solid #34495e;" placeholder="Comment">
													</div>
												</div>
											</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			<div class="base_button">
				<span class="gLeft">
					<a href="#" style="padding: 12px 25px 10px;border:1px solid black; background-color: #34495e; border-radius: 4px; color: white; text-decoration: none; position: relative; top: -11px; ">목록</a>
					<a href="#" style="padding: 12px 25px 10px;border:1px solid black; background-color: #34495e;border-radius: 4px;  color: white; text-decoration: none; position: relative; top: -11px; right: 3px;">답변</a>
				</span>
			<c:if test="${name == one.writer}">
				<span class="gRight">
					<a href="#" style="padding: 12px 25px 10px;;border:1px solid black; background-color: #34495e; border-radius: 4px; color: white; text-decoration: none; position: relative; top: -11px;">수정</a>
					<a href="#" style="padding: 12px 25px 10px;border:1px solid black; background-color: #34495e; border-radius: 4px; color: white; text-decoration: none; position: relative; top: -11px; right: 3px;">삭제</a>
				</span>
			</c:if>
			</div> 
		</div>
	</div>
</body>
</html> 