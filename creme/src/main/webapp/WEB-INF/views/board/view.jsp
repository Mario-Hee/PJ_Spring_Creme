<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/include.jsp" %> --%>
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


		.content_txt {
			padding: 20px 40px 0;
		}
		.chat {
			width: 27px;
			padding: 5px 0 0 0;
		}
		.view_list {
			padding: 12px 25px 10px;
			border:1px solid #95A5C3;
			background-color: #95A5C3;
			border-radius: 4px; 
			color: white; 
			text-decoration: none; 
			position: relative; 
			top: -11px;
			font-family: 'Nanum Gothic Coding', monospace; 
		}
		.tel_btn {
			padding: 12px 25px 10px;
			border:1px solid #95A5C3;
			background-color: #95A5C3;
			border-radius: 4px; 
			color: white; 
			text-decoration: none; 
			position: relative; 
			top: -11px; 
			right: -1px;
			font-family: 'Nanum Gothic Coding', monospace; 
		}
		.upt_btn {
			padding: 12px 25px 10px;
			border:1px solid #95A5C3;
			background-color: #95A5C3; 
			border-radius: 4px; 
			color: white; 
			text-decoration: none; 
			position: relative; 
			top: -11px;
			font-family: 'Nanum Gothic Coding', monospace; 
		}
		.del_btn {
			padding: 12px 25px 10px;
			border:1px solid #95A5C3;
			background-color: #95A5C3;
			border-radius: 4px; 
			color: white; 
			text-decoration: none; 
			position: relative; 
			top: -11px; 
			right: 3px;
			font-family: 'Nanum Gothic Coding', monospace; 
		}
		.btn:hover {
			background-color: #34495e;
			border: 1px solid #34495e;
			border-color: transparent;
			color: white;
			font-family: 'Nanum Gothic Coding', monospace; 
		}
		
	</style>
</head>
<body>
<%@ include file="../include/modal.jsp"%>
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
										<!-- jstl 주석은 <%-- --%>로 사용-->
										<!-- jsp 주석은 ! 사용-->
											<strong>작성일</strong>
											<c:if test="${one.regdate != one.updatedate}">
												<span class="txtNum"><fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>${regdate}</span>
												<span class="txtNum"><fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" var="updatedate"/>${updatedate}</span>				
											</c:if>
										</li>
										<li class>
											<strong>조회수</strong>
											<span class="txtNum2">${one.viewcnt}</span>
										</li>
										<li class>
											<strong>댓글수</strong>
											<span class="txtNum3">${one.replycnt}</span>
										</li>
									</ul>
									<div class="detail">
										<div class="content_txt">${one.view_content}</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

						<!-- 댓글 창 -->
						<div id="listReply"></div>
			<div class="base_button">
				<span class="gLeft">
					<a href="${header.referer}" class="view_list btn">목록</a>
					<a href="#"  class="tel_btn btn" >답변</a>
				</span>
			<c:if test="${name == one.writer}">
				<span class="gRight">
					<a href="${path}/board/update?bno=${one.bno}" class="upt_btn btn">수정</a>
					<a href="#" class="del_btn btn" >삭제</a>
				</span>
			</c:if>
			</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">

	$(function(){
		setInterval(refreshReply, 180000);
		//setInterval 자바스크립트 내장함수, 일정한 시간 간격으로 작업을 수행하기 위해 사용한다
		//일정 시간마다 반복 실행하는 함수
		//refreshReply를  3000000(5분)에 한번씩 실행하라 
		
		//alert('이전 URL: $(header.referer)');
		//페이지가 시작되자마자 listReply();를 호출해서 실행하라
		listReply();
		

		// 삭제버튼 클릭시 모달창 Open 
		$('.del_btn').click(function(){
			$('.modal_msg_wrap').css('display', 'flex');
		});
		
		// 삭제 알림 모달창에서 확인버튼 Click -> 게시글 삭제
		$('#modal_msg_yes').click(function() {
			//alert("게시글 삭제");
			location.href='${path}/board/delete?bno=${one.bno}';
		});
	});
	
	
	//목록 버튼
	$(document).on('click', '.view_list', function(){
		var referer = '${header.referer}'
		//console.log('이전 URL : ' + referer);
		
		var index = referer.indexOf('/board/list');
		//console.log('index :  + referer.indexOf('/board/list'));
	
		if(index == '-1') {
			$('.view_list').prop('href', '/creme/board/list')
		}
		
	});
	
	
	$(document).on('click', '.postcomment_up', function(){
		$('.modal_wrap').css('display', 'flex');
	});
	
	//1.사용자가 댓글을 입력하고 댓글등록버튼을 클릭한다
	$(document).on('click', '.reply_btn', function(){
		//2.u_cbox_write_name라고 변수에 사용자가 입력한 댓글내용을 입력한다
		var u_cbox_write_name = $('.u_cbox_write_area').val();
		//alert(u_cbox_write_name);
		
		//3.조건문 사용자가 입력한 값이 ''이거나 길이가 0이면
		//null값 이기 떄문에 댓글 입력부분으로 포커스를 이동하고,
		//경고 메ㅔ세지를 출력하고 여기서 이벤트를 종료
		//사용자가 입력한 값이 있으면 실행하지않고 통과한다
		if(u_cbox_write_name == '' || u_cbox_write_name.lengh == 0) {
			$('.u_cbox_write_area').focus();
			$('.error_next_box').css('visibility', 'visible');
			return false;
		}
		
		$('.reply_bno').val('${one.bno}');
		$('.reply_type').val('${one.type}');
		$('.reply_writer').val('${name}');
		
		// 댓글 등록
		// 1)type, content, writer, bno 4개의 데이터를 다 보내야한다
		$.ajax({
			type: 'POST',
			url: '${path}/reply/insert',
			// url: '${path}/reply/insert?bno='+bno+'$type='+type+'$writer='+name+'$content='+content, //쿼리스트링 변수가 많아지면 다 써야하므로 불면하다, 그럴땐 .serialize()를 써야한다. 
			// data: {"bno": bno, "type" : type, "writer" : name, "content" : content}, // 2)json방식, 해쉬맵을 생각하면 된다. "key" 값으로 : value 값을 꺼낼 수 있다. ("key" : value)
			data: $('.frm_reply').serialize(), //serialize() 직렬화는 form(frm_reply)태그 안에 있는 애들을 다 보내겠다, 쿼리스트링을 자동으로 만들어서 보내준다.
			success: function() {
				listReply();
			}
			
		});
		
	});
	
	// 댓글 삭제
	$(document).on('click', '.reply_del_btn', function(){
		var rno = $(this).attr('data_num');
		var bno = ${one.bno};
		alert("삭제");		
		
		$.ajax({
			type: "POST",
			url: '${path}/reply/delete',
			data: {'rno' : rno, 'bno' : bno},
			success: function() {
				listReply();
			}
			
			
		});
		
	});
	
	// 댓글 목록 출력 함수
	function listReply(){
		$.ajax({
			type: "get",
			async: false,
			url: "${path}/reply/list?bno=${one.bno}",
			success: function(result){  		//result는 결과값
				console.log(result);
				$("#listReply").html(result);	//"#listReply"를 쓰면 화면 전환은 안하면서도 댓글 값은 불러온다.
			}
		});
		
		// 게시글 댓글수 수정!
		$('.txtNum3').text($('.replyListCnt').val());
	}	
	
	// 새로운 댓글 확인하기 버튼 클릭시
		$(document).on('click', '.reply_refresh_btn', function(){
			listReply();
	});
	
	function refreshReply() {
		listReply();
	} 
	
</script>
</html> 