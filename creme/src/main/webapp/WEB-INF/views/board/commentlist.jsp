<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
	<title>상세게시글</title>
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
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
			padding-bottom: 8px;
			width:846px;
			height: 80px;
			margin: 2px -15px 1px;
			border: 1px solid black;
			resize: none;
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
		}
		.Comment {
			background-size: 30px 30px;
 	 		background-position: 11px 8px;
   			background-repeat: no-repeat;
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
			border: 1px solid #34495e;
			resize: inherit;
			border: none;
			height: 91px;
			width: 846px;
			margin: 2px -15px 0;
		}	 
		.base_button {
			display: inline-block;
			margin: -35px 0 0 26;
		}
		.gLeft {
			display: inline-block;
			position: relative;
			left: 1px;
			top: 68px;
			font-size: 15px;
			width: 169px;
			font-weight: bold;
		}
		.gRight {
			display: inline-block;
			position: relative;
			left: 508px;
			top: 68px;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
		}
		.u_cbox_write_area{
			font-weight: bold;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
		}
		.reply_del_btn {
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 12px;
			color: #ccc;
			border: 1px solid #ccc;
			margin: 0 25px 0 0;
		}
		.post_btn {
			height: 32px;
			padding-bottom: 10px;
			margin-bottom: 2px;
		}
		.wrap_postcomment {
			display: inline-block;
			position: relative;
			margin: -6px 0 0 16px;
			bottom: 5px;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
			line-height: 29px;
			padding: 0 10px 0;
		}
		.error_next_box {
			display: inline-block;
			font-size: 12px;
			line-height: 14px;
			color: #f46665;
			margin: 0 0 0 569px;	
			visibility: hidden;
		}
		.postcomment_up {
			position: relative;
			top: -1px;
			border: 1px solid #95A5C3;
			padding: 10px 24px;
			font-family: 'Nanum Gothic Coding', monospace; 
			font-size: 15px;
			font-weight: bold;
			background-color: #95A5C3;
			color: white;
			text-decoration: none;
			border-radius: 4px;
		}
		.postcomment_up:hover:hover {
			background-color: #34495e;
			border: 1px solid #34495e;
			border-color: transparent;
			color: white;
			font-family: 'Nanum Gothic Coding', monospace; 
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
		.reply_header {
			padding: 0 65px;
			height: 17px;
		}
		.comment_cnt {
			display: inline-block;
			position: relative;
			margin: 16px 0 0 0;
		}


	</style>
<body>
			<div class="reply_header">
			<input type="hidden" class="replyListCnt" value="${list.size()}">
				<span class="comment_cnt">${list.size()}</span>
			</div>
				<div class="post_btn">
					<div class="wrap_postcomment">
						<div class="postcomment">
							<img src="${path}/resources/img/icons8-chat-bubble-50.png" class="chat">
									<span class="comment_chat">${one.replycnt}<span>
							<c:if test="${!empty userid}">
								<span class="error_next_box">텍스트를 입력해 주세요</span>
								<span><button type="button" class="postcomment_up reply_btn">등록</button></span>
							</c:if>
						</div>
					</div>
				</div>
				<div class="u_cbox_wrap">
					<div class="u_cbox">
						<div class="u_cbox_write_wrap">
							<div class="u_cbox_write_box">
									<div class="u_cbox_write">
										<div class="u_cbox_write_inner">
											<div class="u_cbox_profile_area">
												<div class="u_cbox_profile">
												<div class="like_ico"><span><a href="#"><img src="${path}/resources/img/icons8-love-24.png" class="like_ico"></span>2</a></div>
													<strong class="u_vc">로그인 정보</strong>
													<div class="u_cbox_thumb">
														<img src="${path}/resources/img/default.png" class="u_cbox_img_profile" >
													</div>
												<c:forEach items="${list}" var="reply">		
													<div class="u_cbox_box_name"><fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd hh-MM-ss" var="regdate"/>
														<span class="u_cbox_write_name"><b>${reply.writer}</b> ${regdate} ${reply.content}</span> 
														<c:if test="${name == reply.writer}">	
															<span>${reply.rno}</span>		
															<button  type="button" class="reply_del_btn" data_num="${reply.rno}">삭제</button>
														</c:if>
														<div class="u_cbox_write_name"><span> ${reply.content}</span>
														</div>
													</div>
												</c:forEach>			
												<c:if test="${list.size() == 0}" >
													<div class="u_cbox_box_name">
														<span class="u_cbox_write_name"><b>관리자 이브</b></span>
														<span class="u_cbox_write_name">등록된 댓글이 없습니다:(</span> 
															<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today"/> 
													</div>		
												</c:if>
																					
												<c:choose>
													<c:when test="${empty userid}">
														<div class="Comment" >
															<span class="u_cbox_write_name"></span>
															<textarea class="u_cbox_write_area" placeholder="로그인 후 댓글을 입력할 수 있습니다." readonly></textarea>	
														</div>
													</c:when>
													<c:otherwise>
														<form class="frm_reply">
															<input type="hidden" name="bno" class="reply_bno">
															<input type="hidden" name="type" class="reply_type">
															<input type="hidden" name="writer"" class="reply_writer">
															<textarea class="u_cbox_write_area" name="content" placeholder="댓글을 입력해주세요"></textarea>
														</form>
													</c:otherwise>
												</c:choose>
												</div>
											</div>
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
</body>
</html>
