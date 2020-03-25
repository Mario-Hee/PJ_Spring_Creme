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
			font-family: 'Nanum Gothic Coding', monospace; 
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

	</style>
<body>
	<%@ include file="../include/modal.jsp" %>
			<div class="reply_header">
				${reply.size()}
			</div>
				<div class="u_cbox_wrap">
					<div class="u_cbox">
						<div class="u_cbox_write_wrap">
							<div class="u_cbox_write_box">
								<form>
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
													<div class="u_cbox_box_name">
														<span class="u_cbox_write_name">${reply.writer} ${reply.regdate} ${reply.content}</span> 
													</div>
												</c:forEach>	
													<div class="Comment" >
														<textarea class="u_cbox_write_area" placeholder="댓글입력"></textarea>
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
</body>
</html>