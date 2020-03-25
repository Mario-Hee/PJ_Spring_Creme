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
			height: 737px;
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

		.postcomment_up {
			position: relative;
			left: 707px;
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
	<%@ include file="../include/modal.jsp" %>
	<div class="container">
		<div class="contents">
			<div class="main_board">
				<div class="board_title">
					<div class="titleArea">
						<div class="main_txt" style="font-size: 20px; font-family: 'Nanum Gothic Coding', monospace; font-weight: bold;">자유게시판</div>
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
							<img src="${path}/resources/img/icons8-chat-bubble-50.png" class="chat"><span class="comment_chat">${one.replycnt}<span>
								<c:if test="${!empty userid}">
									<span><a href="#" class="postcomment_up">등록</a></span>
								</c:if>
						</div>
						</div>
					</div>
						<!-- 댓글 창 -->
						<div id="listReply"></div>
			<div class="base_button">
				<span class="gLeft">
					<a href="${header.referer}" style="padding: 12px 25px 10px;border:1px solid black; background-color: #34495e; border-radius: 4px; color: white; text-decoration: none; position: relative; top: -11px; ">목록</a>
					<a href="#" style="padding: 12px 25px 10px;border:1px solid black; background-color: #34495e;border-radius: 4px;  color: white; text-decoration: none; position: relative; top: -11px; right: 3px;">답변</a>
				</span>
			<c:if test="${name == one.writer}">
				<span class="gRight">
					<a href="#" style="padding: 12px 25px 10px;;border:1px solid black; background-color: #34495e; border-radius: 4px; color: white; text-decoration: none; position: relative; top: -11px;">수정</a>
					<a href="#" class="del_btn" style="padding: 12px 25px 10px;border:1px solid black; background-color: #34495e; border-radius: 4px; color: white; text-decoration: none; position: relative; top: -11px; right: 3px;">삭제</a>
				</span>
			</c:if>
			</div>
				</div>
			</div>
</body>
<script type="text/javascript">

	$(function(){
		//alert('이전 URL: $(header.referer)');
		//페이지가 시작되자마자 listReply();를 호출해서 실행하라
		listReply();
		

		// 삭제버튼 클릭시 모달창 Open 
		$('.del_btn').click(function(){
			$('.modal_msg_wrap').css('display', 'flex');
		});
		
		// 삭제 알림 모달창에서 확인버튼 Click -> 게시글 삭제
		$('.modal_msg_yes').click(function() {
			alert("text");
			location.href='${path}/board/delete?bno=${one.bno}';
		});
	});
	
	// 댓글 목록 출력 함수
	function listReply(){
		$.ajax({
			type: "get",
			url: "${path}/reply/list?bno=${one.bno}",
			success: function(result){  		//result는 결과값
				$("#listReply").html(result);	//"#listReply"를 쓰면 화면 전환은 안하면서도 댓글 값은 불러온다.
			}
		});
	}	
</script>
</html> 