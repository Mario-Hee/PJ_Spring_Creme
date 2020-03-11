<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../../css/common.css">
	<script src="https://kit.fontawesome.com/3d124ab517.js" crossorigin="anonymous"></script>
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Secular+One&display=swap');
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
		* {
			font-family: 'Nanum Gothic' ;
			box-sizing: border-box;
		}
		body {
			background-color: #f5f6f7;
			font-size: 12px;
		}

		.header_content_logo_img {
		 	max-width: 135px;
		 	display: block;
		 	margin: auto;
		}
		
		.sh_group {
			min-height: 185px;
			margin: 35px auto;
			padding: 32px 29px 30px;
			text-align: center;
			border: 1px solid #dadada;
			border-radius: 2px;
			background: #fff;
			width: 1000px;
			height: 500px;
		}
		
		.sh_header {
			position: relative;
			display: block;
		}

		h2 {
			font-size: 25px;
			line-height: 22px;
			padding-bottom: 2px;
			color: #333;
			text-align: center;
		}

		.sh_content {
			min-height: 131px;
			padding-top: 9px;
		}
		
		.sh_lst {
			position: relative;
			min-height: 80px;
			margin-top: -1px;
			padding-bottom: 8px;
			display: flex;
			justify-content: space-around;
			align-items: flex-start;
		}

		.sh_lst{
			font-size: 20px;
			font-weight: 700;
			color: #333;
		}

		.blind {
			position: absolute;
			clip: rect(0 0 0 0);
			width: 1px;
			height: 1px;
			margin: -1px;
			overflow: hidden;
			border: 1px solid #34495e;
		}

		.pic_desc {
			position: absolute;
			top: 20px;
			left: 111px;
			width: 150px;
			height: 150px;
		}
		
		.sh_lst {
			overflow: hidden;
			word-wrap: break-word;
			word-break: keep-all;
		}

		.pic_desc a {
			display: block;
			overflow: hidden;
			width: 150px;
			height: 150px;
		}

		a {
			text-decoration: none;
		}
		
		img {
			border: 0;
			width: 150px;
			height: 136px;
		}

		.img_frame {
			position: absolute;
			top: 0;
			left: 0;
			width: 150px;
			height: 150px;
			background-position: 0 0;
		}

		.intro_desc {
			font-size: 14px;
			font-weight: 700;
			line-height: 21px;
			padding: 15px 0 0 40%;
			color: #666;
		}
		
		.btn_area_btm {
			font-size: 0;
			padding: 17px 0 0 1px;
		} 

		.btn_model:first-child {
			margin-left: 0;
		}

		.btn_model {
			font-size: 12px;
			line-height: 14px;
			vertical-align: top;
			text-decoration: none!important;
		}

		.btn2 {
			color: #333;
			cursor: pointer;
			width: 184px;
			height: 54px;
			padding: 5px 12px 0;
			font-size: 18px;
			border-radius: 4px;
			margin: 10px 30px 0 0;
			font-weight: bold;
			color: white;
			background-color: #95A5C3;

		}

		.btn_model b {
			display: inline-block;
			overflow: hidden;
			text-align: center;
			vertical-align: top;
			letter-spacing: -1px;
			margin: 0 21px 0;
		}

		.mypage_txt {
			text-align: start;
		}
		
		.content_txt {
			display: flex;
			align-items: center;
			font-size: 18px;
			line-height: 30px;
			color: #333;
			margin: 24px -31px 1px 0;

		}

		.content_txt > * {
			display: inline-block;

		}

		.desc_sub {
			padding: 0 0 0 50px;
		}

	</style>
</head>
<body>
	<div class="header_content_logo">
		<a href="#">
			<img class="header_content_logo_img" src="../../img/logo_transparent.png" alt="로고이미지">
			<span class="header_content_logo_text"></span>
		</a>
	</div>
	<div class="sh_header">
		<h2>내 정보</h2>
	</div>
	<div class="sh_group">
		<div class="sh_content">
			<dl class="sh_lst">
				<dt class="blind"></dt>
				<div class="default_img">
					<dd class="pic_desc">
						<a href="#" onclick="changeImage();clickcr(this,'imn.prfmodify','','',event);">
							<img src="../../img/default.png" width="80" height="80" alt>
							<span class="spimg img_frame"></span>
						</a>
					</dd>
				</div>
				<div class="mypage_txt">
					<div class="content_txt">
						<span class="txt_sub">아이디</span>
						<span class="desc_sub">icon94</span>
					</div>
					<div class="content_txt">
						<span class="txt_sub">이름</span>
						<span class="desc_sub" style="padding: 0 0 0 66px;">왕콘치</span>
					</div>
					<div class="content_txt">
						<span class="txt_sub">전화번호</span>
						<span class="desc_sub" style="padding: 0 0 0 33px;">010-1234-5678</span>
					</div>
					<div class="content_txt">
						<span class="txt_sub">이메일</span>
						<span class="desc_sub">icon94@naer.com</span>
					</div>
					<div class="content_txt">
						<span class="txt_sub" style="padding: 0 16px 0 0;">주소</span>
						<span class="desc_sub">광주광역시 북구 설죽로 389번길 70 행복빌딩 1층</span>
			 		</div>
				</div>
			</dl>
		</div>
		<span class=" btn_area_btm">
			<div class="btn_model">
				<button type="button" class="btn2">정보수정</button>
				<button type="button" class="btn2">비밀번호변경</button>
				<button type="button" class="button.btn-agree btn2">회원탈퇴</button>
			</div>
		</span>
	</div>
</body>
</html>