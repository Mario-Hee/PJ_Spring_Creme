<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/3d124ab517.js" crossorigin="anonymous"></script>
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">
	<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
		* {
			font-family: 'Nanum Gothic' ;
			box-sizing: border-box;
		}
		body {
		background: #fff;
		}
		div {
			display: block;
		}
		#cremewrap {
			position: relative;
			width: 100%;
			height: 100%;
		}
	    body, div, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, input, button {
			margin: 0;
			padding: 0;
		}
		#cremehead {
			display: block;
			width: 100%;
			padding-top: 51px;
			border-bottom: 2px solid #34495e;
		}
		#cremehead .inner_head {
			width: 978px;
			height: 58px;
			margin: 0 auto;
		}
		#cremehead h1 {
			display: inline;
			float: left;
			margin-left: 4px;
			font-size: 24px;
			font-weight: bold;
			line-height: 28px;
			letter-spacing: -1px;
		}
		#cremeservicelogo {
			display: block;
			width: 78px;
			height: 29px;
			margin: 6px 40px 23px 0;
			background: url(${path}/resources/img/img_gnb_userinfo2014.gif) no-repeat;
		}
		a {
			color: #333;
			text-decoration: none;
		}
		a:active, a:hover {
			text-decoration: underline;
		}
		.gnb_with .on .link_gnb1 .gnb_with .on
		.link_gnb1:hover, .gnb_with .on .link_gnb1:focus {
			background-position: -408px -100px;
		}
		.ir_wa {
			display: block;
			position: relative;
			width: 100%;
			height: 100%;
			overflow: hidden;
			z-index: -1;
		}
		#cremeGnb {
			position: relative;
			float: left;
			width: 468px;
			height: 43px;
			background: url(${path}/resources/img/img_gnb_userinfo2014.gif) 0 -40px no-repeat;
		}
		.screen_out {
			display: block;
			position: absolute;
			left: -9999px;
			width: 1px;
			height: 1px;
			overflow: hidden;
			font-size: 0;
			line-height: 0;
			text-indent: -9999px;
		}
		#cremeGnb .gnb_comm {
			float: left;
		}
		dl, ul, ol, menu, li {
			list-style: none;
		}
		#cremeGnb li {
			float: left;
		}
		.gnb_comm .link_gnb1 {
			width: 66px;
			background-position: 0 -40px;
		}
		.gnb_comm .link_gnb, .gnb_with .link_gnb {
			display: block;
			height: 43px;
			/*background: url(${path}/resources/img/img_gnb_userinfo2014.gif) no-repeat;*/
			font-size: 14px;
			font-weight: bold;
			line-height: 43px;
			letter-spacing: -1px;
			text-align: center;
		}
		.ir_wa {
			display: block;
			position: relative;
			width: 100%;
			height: 100%;
			overflow: hidden;
			z-index: -1;
		}
		.gnb_comm .link_gnb2 {
			width: 79px;
			background-position: -85px -40px;
		}
		.gnb_comm .link_gnb3 {
			width: 81px;
			background-position: -183px -40px;
		}
		.gnb_comm .link_gnb4 {
			width: 94px;
			margin-right: 0;
			background-position: -283px -40px;
		}
		#cremeGnb .gnb_with {
			display: inline;
			float: left;
			margin-left: 31px;
		}
		#cremeGnb li {
			float: left;
		}
		.hide {
			display: none;
		}
		#cremecontent {
			width: 978px;
			overflow: hidden;
			margin: 0 auto;
		}
		#maticle {
			min-height: 574px;
		}
		element.style {
			display: none;
		}
		.dimmed_layer {
			position: fixed;
			z-index: 9999999;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: #000;
			opacity: .5;
		}
		.myinfo_intro {
			width: 100%;
			overflow: hidden;
			height: 147px;
		}
		.intro_out .bg_intro {
			width: 130px;
			background-position: -160px -600px;
		}
		.myinfo_intro .bg_intro {
			float: left;
			width: 154px;
			height: 147px;
		}
		.bg_intro {
			display: block;
			overflow: hidden;
			background: url("${path}/resources/img/bg_tit_150917.gif") 0 0 no-repeat;
		}
		.tit_comm {
			display: block;
			overflow: hidden;
			background: url("${path}/resources/img/tit_comm_160425.png") 0 0 no-repeat;
			text-indent: -9999px;
		}
		.intro_out .cont_intro {
			padding-top: 53px;
		}
		.myinfo_intro .cont_intro {
			float: left;
			padding-top: 37px;
		}
		.intro_out .tit_outagree {
			width: 622px;
			background-position: 0 -1565px;
		}
		.myinfo_intro .tit_comm {
			height: 26px;
			margin-bottom: 14px;
			padding: 20px 148px 63px 0;
		}
		.info_agree {
			padding: 42px 50px 29px;
			overflow: hidden;
			border-top: 1px solid #e1e1e1;
			border-bottom: 1px solid #e1e1e1;
			background-color: #fbfbfb;
		}
		.info_agree .info_user {
			position: relative;
			width: 793px;
			margin-bottom: 20px;
			padding: 27px 37px 40px 45px;
			overflow: hidden;
			border: 1px solid #1b1b1b;
			background-color: #fff;
			color: #444;
		}
		.info_user .txt_agree {
			display: block;
			margin-right: 30px;
			font-size: 13px;
			line-height: 24px;
			letter-spacing: -1px;
		}
		strong {
			font-weight: bold;
		}
		.info_user .tit_agree {
			display: block;
			padding-bottom: 13px;
			line-height: 22px;
		}
		.info_user .emph_g {
			color: #f46665;
			font-size: 13px;
			font-weight: bold;
		}
		.lab_check {
			display: block;
			background: url("${path}/resources/img/icons8-checked-40.png") no-repeat;
			width: 40px;
			height: 40px;
			padding-top: 40px;
			text-align: center;
		}
		.info_user > .check_notice {
			position: absolute;
			top: 0;
			right: 20px;
		}
		.check_notice {
			display: inline-block;
		}
		.tf_check:checked +label {
			background-image: url(${path}/resources/img/icons8-checked-checkbox-40.png);
		}
		.check_notice > input {
			visibility: hidden;
		}
		.info_detail .id, .pw {
			position: relative;
			padding-left: 10px;
			font-size: 15px;
			font-weight: bold;
		}
		.input_id {
			font-size: 15px;
			font-weight: bold;
			padding-left: 33px;
		}
		.input_pw {
			position: relative;
			left: 17px;
			font-size: 15px;
			padding-left: 16px;
		}
		.info_cremeid {
			padding-bottom: 13px;
		}
		.wrap_btn {
			width: 100%;
			padding: 20px 0 70px;
			text-align: center;
		}
		.btn_cancel {
			width: 104px;
			height: 46px;
			margin-right: 2px;
		}
		.btn_comm {
			display: inline-block;
			font-size: 0;
		}
		.btn_next {
			width: 97px;
			height: 46px;
			line-height: 0;
		}
		.cancel {
			display: inline-block;
			width: 100px;
			height: 45px;
			font-size: 14px;
			font-weight: bold;
			color: #34495e;
			line-height: 42px;
			background-color: #fff;
			border: 1px solid #D1D1D1;
			border-radius: 4px;
		}
		.out {
			display: inline-block;
			width: 100px;
			height: 45px;
			font-size: 14px;
			font-weight: 20px;
			font-weight: bold;
			color: #fff;
			line-height: 42px;
			background-color: #34495e;
			border: 1px solid #D1D1D1;
			border-radius: 4px;
		}
		.info_user > .tit_agree {
			font-size: 16px;
			font-weight: 800;
		}
		.info_user > .txt_agree {
			font-size: 13px;
		}
		#minicreme {
			position: absolute;
			top: -3px;
			left: 689px;
			width: 100%;
			height: 40px;
			letter-spacing: -1px;
		}
		#minicreme .minicreme_logo {
			display: inline;
			margin: 11px 12px 0 -226px;
		}
		strong {
			font-weight: bold;
		}
/*		.img_logo {
			display: block;
			overflow: hidden;
			padding-left: 0 0 0;
			width: 65px;
			height: 17px;
			background: url(../../img/logo_transparent2.png) no-repeat;
			background-size: 73px;
			text-indent: -9999px;
		}*/
		
		#minicreme a {
			color: #222;
			text-decoration: none;
			height: 57px;
		}
		#footer {
			padding: 15px 0;
		}
		#footer > ul {
			margin: 0 auto 9px;
			text-align: center;
		}
		#footer * {
			font-size: 11px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer > ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li a:hover {
			color: #2db400;
			text-decoration: underline;
		}
		#footer ul li:first-child {
			/* first-cjild는  footer안에 있는 모든 ul태그 중에서 li태그 중에서 첫번째 자식만,
			last-cjild는 마지막 자식만 */
			border-left: 0px!important;
			/* !imprtant는 제일 높은 순위이다. 자주 사용하지말아야한다. 웬만하면 안쓰는걸 추천한다. */
		}
		#addr_logo {
			width: 63px;
			height: 11px;
		}
		#address {
			margin: 0 auto;
			text-align: center;
		}
		#adress * {
			font: 9px verdana;
		}
		#adress a {
			font-weight: bold;
		}
		#adress a:hover {
			color: #2db400;
		}
		
	</style>
</head>
<body>
<div id="cremehead" role="banner">
			<div class="inner_head">
				<div class="cremetop">
				<h1>
				  <a href="#" id="cremeservicelogo">
				  	<span class="ir_wa">내정보</span>
				  </a>  
				<div id="minicreme">
					<strong class="minicreme_logo">
					<a href="#" target="_top" class="img_logo"></a>
					</strong>
				<div id="minicreme_user" class="minicreme_login">
					<a href="#" target="_top" class="minicreme_nick" id=""></a>
			</div>
		</div>
				</h1>
			</div>
				<!-- pc 웹 내정보 GNB -->
				<div id="cremeGnb" role="navgation">
					<h2 class="screen_out">내정보 메인메뉴</h2>
					<ul class="gnb_comm">
						<li>
							<a href="#" class="link_gnb link_gnb1">
								<span class="ir_wa">내정보 홈</span>
							</a>
						</li>
						<li>
							<a href="#" class="link_gnb link_gnb2">
								<span class="ir_wa">내정보 관리</span>
							</a>
						</li>
						<li>
							<a href="#" class="link_gnb link_gnb3">
								<span class="ir_wa">내정보 보호</span>
							</a>
						</li>
						<li>
							<a href="#" class="link_gnb link_gnb4">
								<span class="ir_wa">비밀번호 변경</span>
							</a>
						</li>
					</ul>
					<ul class="gnb_with">
						<li class="on">
							<a href="#" class="link_gnb link_gnb1">
								<span class="ir_wa">회원탈퇴</span>
							</a>
						</li>
					</ul>
				</div>
			</div>	
		</div>
		<hr class="hide">
		<div id="cremecontent" role="main">
			<div id="cMain">
				<div id="maticle">
					<div class="dimmed_layer" style="display:none"></div>
					<h2 id="cremebody" class="screen_out">회원탈퇴 안내동의 본문</h2>
					<div class="myinfo_intro intro_out">
						<span class="bg_intro"></span>
						<div class="cont_intro">
							<h3 class="tit_comm tit_outagree"></h3>
						</div>
					</div>
					<form action="/withdraw.daum?action=agree-check" method="post">
						<div class="info_agree">
							<div class="info_user">
								<strong class="tit_agree">Creme 아이디는 재사용 및 복구 불가 안내</strong>
								<div class="txt_agree">
									회원 탈퇴 진행 시 본인을 포함한 타인 모두 
									<span class="emph_g">아이디 재사용이나 복구가 불가능 합니다.</span>
									<br>
									신중히 선택하신 후 결정해주세요.
								</div>
								<div class="check_notice">
									<input type="checkbox" id="idagree" name="idagree" class="tf_check">
								    <label for="idagree" class="lab_check">동의</label>	
								</div>
							</div>
							<div class="info_user">
								<strong class="tit_agree">내정보 삭제 안내</strong>
								<div class="txt_agree">
									내정보 및 개인형 서비스 이용기록이 모두 삭제되며
									<span class="emph_g">삭제된 데이터는 복구되지 않습니다.</span>
									<br>
									삭제되는 내정보를 확인하시고 결정해 주세요.
								</div>
								<div class="check_notice">
									<input type="checkbox" id="idagree2" name="idagree" class="tf_check">
								    <label for="idagree2" class="lab_check">동의</label>	
								</div>
							</div>
							<div class="info_user">
								<strong class="tit_agree">적립금 삭제 안내</strong>
								<div class="txt_agree">
									적립금이 삭제되어 사용할 수 없게 되며,
									<span class="emph_g">탈퇴 후에는 회원정보를 확인 할 수 있는 방법이 없습니다.</span>
									<br>
									신중히 선택하신 후 결정해주세요.
									</div>
								<div class="check_notice">
									<input type="checkbox" id="idagree3" name="idagree" class="tf_check">
								    <label for="idagree3" class="lab_check">동의</label>	
								</div>
							</div>
							<div class="info_user">
								<div class="info_comm">
									<div class="info_detail info_cremeid">
										<span class="id">아이디</span>
											<span class="input_id">mariohee</span>
									</div>
								<div class="info_detail info_pwreconfirm">
										<span class="pw">비밀번호</span>
										<input type="password" id="pw" class="input_pw" name="pw" placeholder="비밀번호">
								  </div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<form name="" method="" action="">
				<div class="wrap_btn">
					<a href="#" class="btn_comm btn_cancel">
					<span class="cancel">탈퇴 취소</span>
					</a>
					<a href="#" class="btn_comm btn_next">
					<span class="out">탈퇴</span>
					</a>
				</div>
			</form>
		</div>
			<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				<div id="address"> 
					<span>
						<a href="http://www.naver.com">
							<img id="addr_logo" src="${path}/resources/img/naver/naver_logo.png">
						</a>
					</span>
					<span>Copyright</span>
					<span>ⓒ</span>
					<span><strong><a href="#">NAVER Corp.</a></strong></span>
					<span>ALL Rights Reserved.</span>
				</div>			
			</div>
		</footer>
	</div>
</body>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(documnet)
</script>
</html>