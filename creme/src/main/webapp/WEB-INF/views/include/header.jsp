<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크렘므</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">    
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap');
		@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding&display=swap');
		@import url('https://fonts.googleapis.com/css?family=Arimo&display=swap');
		div.header_wrap {
			width: 100%;
			background color: white;
			box-shadow: 0 0 1px 1px rgba(20,23,28,.1), 0 3px 1px 0 rgba(20,23,28,.1);
			z-index: 999;
		}
		div.header_content {
			width: 1400px;
			margin: 0 auto;
			height: 103px;
			box-sizing: border-box;
			border-left: 1px;
			border-right: 1px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		.header_content_search {
			padding-top: 13px;
		}
		.header_content_search_group {
			display: flex;
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
		}
		.header_content_search_input {
			background-color: transparent;
			border-color: transparent;
			width: 220px;
			height: 30px;
			font-size: 17px;
			border-radius: 2px;
			padding: 10px 12px;
			outline: none; /* input 태그 focus시 파란테두리*/
		}
		.header_content_search_btn {
			border-color: transparent;
			background-color: transparent;
			width: 44px;
			height: 44px;
			cursor: pointer;
			color: #1D292C;
			border-top-right-radius: 2px;
			border-bottom-right-radius: 2px;
		}
		.header_content_search_btn:hover {
			background-color: #95A5C3;
			color: white;
		}
		.header_content_nav {
			display: flex;
			align-items: center;
			justify-content: space-between;
			width: 350px;
		}
		.header_content_nav > div {
			border: 1px;
		}
		.header_content_member {
			/* width: 160px; */
			display: flex;
			align-items: center;
			justify-content: space-between; 
			flex-direction: row;/* default(생략가능)*/
		}
		.header_content_member > div {
			padding: 10px 0px 10px 3px;
		}
		.header_content_dropdown_group {
			position: relative;
		}
		.header_content_dropdown_wrap:hover .header_dropdown {
			display: block;
		}
		.header_content_dropdown_group > a {
			display: inline-block;
			padding: 12px 15px;
			font-weight: 400;
			font-size: 20px;

			border-radius: 2px;
			height: 45px;
			color: #506763;
			line-height: 19px;
		}
		.header_content_dropdown_wrap:hover > div > a,
		.header_content_member_bag:hover > a {
			background-color: rgba(20, 23, 28, .05);
			border-color: rgba(20, 23, 28, .05);
		}
		.header_content_member_bag > a {
			display: inline-block;
			width: 45px;
			height: 45px;
			border-radius: 50%;
			color: #506763;
			border: 1px solid transparent;
			text-align: center;
			padding: 12px;
			line-height: 19px;
		}
		.header_content_logo_img {
			max-width: 114px;
			height: 97px;
			vertical-align: middle;
		}
		.header_content_logo_text {
			font-size: 35px;
			font-weight: bold;
			vertical-align: middle;
		}
		.header_dropdown_menu {
			border-bottom-left-radius: 2px;
			border-bottom-right-radius: 2px;
			box-shadow: 0 4px 16px rgba(20, 23, 28, .25);
			background-color: #f2f3f5;
			padding: 10px 0;
		}
		.header_dropdown_menu a {
			display: inline-block;
			font-size: 16px;
			color: #505763;
			text-align: center;
			padding: 5px 15px;
			font-weight: 400;
			width: 130px;
			position: relative;
			z-index: 100;
		}
		.header_dropdown_menu a:hover {
			color: red;
			background-color: #f2f3f5;
		}
		.header_dropdown {
			position: absolute;
			top: 53px;
			left: 0;
			display: none;
		}
		.arrow {
			position: absolute;
			top: -4px;
			left: 13px;
			width: 15px;
			height: 15px;
			transform: rotate(45deg);
			background-color: #f2f3f5;
			border-color: transparent transparent #fff transparent;
			z-index: 99;
		}
		.header_content_nav > div {
			padding: 10px 0;
		}


		/* 모달 로그인 창 */
		.modal_wrap2 {
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			display: none;
		}
		.modal_content {
			position: relative;
			width: 580px;
			height: 550px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
				0 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			overflow: hidden;
			margin-bottom: 1px;
		}
		.member {
			width: 600px;
			margin: 0 auto;
			padding: 19px 18 30px 18;
			letter-spacing: -0.5px;
		}
		h2 {
			color: #1D292C;
			width: 600px;
			height: 30px;
			margin: 30px -20px 0;
			font-size: 60px;
			text-align: center;
			font-family: 'Arimo', sans-serif;
		}
		.member #tabs ul {
			padding: 72px 0 0;
			text-align: center;
		}
		ul {
			padding: 55px 0 0;
		}
		ul, li {
			margin: 0;
			padding: 0;
			list-style: none;
		}
		.member #tabs li {
			display: inline-block;
			font-size: 18px;
			padding: 0 40px;
		}
		.member #tabs li a.selected {
			color: #1D292C;
			border-bottom: 1px solid #1D292C;
		}
		.member #tabs li a {
			display: inline-block;
			line-height: 20px;
			color: #1D292C;
			border-bottom: 1px solid #1D292C;
		}
		a {
			color: #1D292C;
			text-decoration: none;
		}	
		input, select {
			outline: none;
			font-family: 'Nanum Gothic Coding', monospace;
			color: #1D292C;
			width: 245px;
			height: 48px;
			line-height: 48px;
			padding: 0 0;
			text-align: center;
			border: 0;
			font-size: 16px;
			font-weight: bold;
		}
		.login {
			width: 335px;
			margin: 19px auto 0;
			overflow: hidden;
		}
		.input-info div {
			position: relative;
			margin: 10px 0 0;
		}
		.inp_login {
			position: relative;
			padding-left: 44px;
			border: 2px solid #8f8f8f;
			color: #333333;
			margin: 10px 0 0;
			padding: 0 0 0 14px;
			height: 60px;
		}
	
		.member .box .login .input-info div .icon {
			position: absolute;
			top: 13px;
			left: 12px;
		}
		.icon {
			display: inline-block;
			vertical-align: middle;
		}
		img {
			border: none;
			vertical-align: top;
		}

		input.text, input.password, input.edit {
			padding: 0 5px;
			outline: none;
			font-size: 17px;
			right: 0px;
		}
		.save {
			width: 335px;
			margin-left: auto;
			margin-right: auto;
			position: relative;
			min-height: 20px;
			margin: 20px 0 0;

		}
		.checkbox {
			visibility: hidden;
			position: absolute;
			top: 0;
			left: 0;
			z-index: -1;
			width: 13px;
			height: 13px;
			vertical-align: top;
		}
		.save label {
			display: inline-block;
			height: 22px;
			padding: 3px 0 0 27px;
			color: #8f8f8f;	
			background: url(${path}/resources/img/icons8-tick-box-off.png) no-repeat;
		}
		 .save input:checked+label {
			background-image: url(${path}/resources/img/icons8-tick-box-on.png);
		}
		label {
			cursor: pointer;
			vertical-align: top;
		}
		.skinbtn.point1.l-confirm, .member .skinbtn.point2.l-login {
			width: 100%;
			height: 55px;
			line-height: 55px;
			font-size: 25px;
		}
		.member .box .login button {
			margin: 20px 0 0;
		}
		.skinbtn.point1.l-confirm, .member .skinbtn.point2{
			background: #34495e;
			border: 1px solid #34495e;
			color: #fff;
			font-weight: bold;
		}
		.skinbtn * {
			font-size: 100%;
		}
		button em {
			font-family: 'Nanum Gothic Coding', monospace;
		}
		em {
			font-style: normal;
			font-size: 1px;
		}
		.login_menu {
			text-align: center;
			width: 335px;
			height: 39px;
		}

		.login_menu button {
			margin-left: 5px;
			margin-right: 5px;
		}
		.login button {
			margin: 20px 0 0;
		}
		.skinbtn {
			width: auto;
			height: auto;
			color: #8f8f8f;
			font-size: 13px;
			font-family: 'Nanum Gothic Coding', monospace;
		}
		button {
			cursor: pointer;
			background: none;
			border: none;
			outline: none;
		}
		.skin + .skinbtn {
			position: relative;
			margin-left: 8px;
			padding-left: 8px;
		}
		.skinbtn + .skinbtn:after {
			position: absolute;
			display: block;
			width: 1px;
			height: 10px;
			margin-top: -12px;
			margin-left: -8px;
			background: #8f8f8f;
			content: '';
		}
		button#btnFindPwd.skinbtn::after {
			background: #8f8f8f;
			margin: -12px -7px 0;
		}
		button#btnFindPwd.skinbtn {
			margin: 20px 4px 0;
			padding: 0 5px 0 2px;
		}
		.form#formLogin {
			font-size: 14px;
		}
		.login_close {
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.login_close > button {
			color: rgb(142, 142, 142);
			border: none;
			background: white;
			font-size: 30px;
			cursor: pointer;
			outline: none;]
		}
		.login_close > button:hover {
			color: #EBA444;
		}
		.pw_eye {
			position: absolute;
			color: #AAA;
			font-size: 17px;
			top: 0px;
			right: 7px;
			cursor: pointer;
			height: 43px;
			line-height: 45px;
			width: 30px;
			text-align: center;
			display: flex;
			align-items: center;
		}
		
		.err_content {
			text-align: center;
			background: none;
			display: none;
			color: #f46665;
			padding-top: 13px;
		}
	</style>
</head>
<body>
<div class="modal_wrap2">
		<div class="modal_content">
			<div class="login_close">
				<button><i class="fas fa-times"></i></button>
			</div>
			<div class="member">
				<h2>Login</h2>
				<div class="box">
					<div id="tabs">
			<div id="ntab01">
				<ul>
					<li>
						<a href="#" class="selected">회원</a>
					</li>
					<li>
						<a href="#">비회원</a>
					</li>
				</ul>
				<div class="err_content">
					로그인 중 문제가 발생했습니다.
					아이디 및 비밀번호를 확인해주세요.
				</div>
				<form id="formLogin" method="post" action="" onsubmit="return false">
					<input type="hidden" id="mode" name="mode" value="login">
					<input type="hidden" id="returnUr1" name="returnUr1" value="#">
						<div class="login" >
							<div class="input_info" >
								<div>
									<div class="inp_login">
										<span class="icon">
										</span>
										<input type="text" class="text" id="login_id" name="login_id" value placeholder="아이디" required>
									</div>
								</div>
								<div>
									<div class="inp_login" >
										<span class="icon">
										</span>
										<input type="password" class="text" id="login_pw" name="login_pw" value placeholder="비밀번호" required minlength="6" maxlength="18">
										<span class="pw_eye">
											<i class="fas fa-eye-slash"></i>
										</span>
									</div>
								</div>
							</div>
								<div class="save">
									<input type="checkbox" class="checkbox" id="saveId" name="saveId" value="y" checked="">
									<label for="saveId" class="label">아이디 저장</label>
								</div>
									<button type="submit" class="skinbtn point2 l-login" id="btn_login">
										<em>로그인</em>
									</button>
									<div class="login_menu">
										<button type="button" class="skinbtn" id="btnJoinMember">
											<em>회원가입</em>
										</button>
										<button type="button" class="skinbtn" id="btnFindId">
											<em>아이디 찾기</em>
										</button>
										<button type="button" class="skinbtn" id="btnFindPwd">
											<em>비밀번호 찾기</em>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<header>
		<div class="header_wrap">
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#">
						<img class="header_content_logo_img" src="${path}/resources/img/logo_transparent.png" alt="로고이미지">
						<span class="header_content_logo_text"></span>
					</a>
				</div>
				<div class="header_content_nav">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">OUR STORY</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">BRANDSTORY</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">SHOP</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">NEW</a></li>
									<li><a href="#">WOMAN</a></li>
									<li><a href="#">MAN</a></li>
									<li><a href="#">PERFUME</a></li>
									
								</ul>
							</div>
						</div>
					</div>
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#" class="magicline">REVIEW</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="header_content_search">
					<form name="fre_search" action="" method="GET">
						<div class="header_content_search_group">
							<input type="text" placeholder="검색해주세요" name="keyword" class="header_content_search_input">
							<button type="button" class="header_content_search_btn"><i class="fas fa-search"></i></button>
						</div>
					</form>
				</div>
				<div class="header_content_member">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
							<a href="#"><i class="fas fa-user"></i>&nbsp;My Page</a>
							<div class="header_dropdown">
								<div class="arrow"></div>
								<ul class="header_dropdown_menu">
									<li><a href="#">WISHLIST</a></li>
									<li><a href="#">회원정보수정</a></li>
									<li><a href="#">고객센터</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div>
						<div class="header_content_member_bag">
							<a href="#"><i class="fas fa-shopping-bag"></i></a>
						</div>
					</div>
					<c:choose>
						<c:when test="${empty sessionScope.userid}">
					<div><button type="button" class="btn btn-basic login_open">로그인</button></div>
					<div><button type="button" id="header_btn_join" class="btn btn-primary">가입하기</button></div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					<c:if test="${empty sessionScope.userid}">
					<div><button type="button" class="btn btn-basic logout_open" id="header-bo">로그아웃</button></div>
					</c:if>
				</div>
			</div>
		</div>
	</header>
</body>
<script type="text/javascript">
	// jQuery 문법
	//$('선택자').옵션();
	//$('test').css('color', 'green');
	//$ = jquery
	//('#test') = 선택자(id가 test)
	// .css() =옵션(글자색을 녹색);

	//jQuery 이벤트 문법(클릭, 포커스, 블러 등)
	//$(document).on('이벤트', '선택자', function({
	// 			이벤트 발생시 동작할 내용들...	
	// }))
	//$(document).on('click', '#test', function({
	//			$(this).css('color', 'blue');
	// }))
	//$(document).on() =문서 전체에서~
	//('clik')		   =클릭 이벤트가 발생하면
	//('#test')		   =아이디가 test인
	//function() {}    =익명함수(이름 없는 함수)
	//$(this)          =나 자신(여기서는 #test)
	//해석: 문서 전체에서 id가 test인 태그가 클릭되면
	//	    나를(#test) 글자색을 blue로 변경해라!

	//로그인 input(id, pw)에 focus 되면 테두리색 변경
	$(document).on('focus', '#login_bx', function(){
		$(this).parent().css('border', '2.0px solid #3885ca');
	});
	$(document).on('blur', '#login_bx', function(){
		$(this).parent().css('border', '2.0px solid #8f8f8f');
	});

	// LOGIN버튼 클릭시 Modal창 Open
	$(document).on('click', '.login_open', function(){
		$('.modal_wrap2').css('display', 'flex');
		$('#login_id').focus();
	});

	//MODAL창의 X버튼을 클릭하면 Modal창 Close
	$(document).on('click', '.login_close', function(){
		$('.modal_wrap2').css('display', 'none');
		$('#formLogin')[0].reset();
		$('.pw_eye').prev().attr('type', 'password');
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
				    .css('color', '#AAA');
	});


		// 값을 가져오는 방법
		//<span class="aaa">동토리</span>
		//<input type="text" class="dobby">동비</input>
		//
		//
		//input태그 값 가져오는 방법
		//$('.dobby').vall('메롱');

		// input 태그 이외의 값 가져오는 방법
		//$('.aaa').text();
		//input 태그 이외의 값 넣는 방법
		//$('.aaa').text('뭐시여??');

		// 태그의 옵션(attribute)을 가져오고 싶을 때
		//$('.dobby').attr('type');
		//$('.dobby').attr('class');


	// LOGIN Modal창 암호 보이기 or 숨기기
	$(document).on('click', '.pw_eye', function(){
		var code = $(this).prev().attr('type');

		if(code == 'password') {
			$(this).prev().attr('type', 'text');
			$(this).html('<i class="fas fa-eye"></i>')
				    .css('color', '#666');
		} else {
			$(this).prev().attr('type', 'password');
			$(this).html('<i class="fas fa-eye-slash"></i>')
				    .css('color', '#aaa');
		}
		
	});
	
	// LOGIN 버튼 클릭시 AJAX 동작
	$(document).on('click', '#btn_login', function(){
		/* alert('zzz'); */
		// id와 pw값 받아와서 null값이면 작동하지 않는다.
		var id = $('#login_id').val();
		var pw = $('#login_pw').val();
		
		// 유효성 체크(id, pw) Null체크
		if(id != '' && pw != '' && id.length != 0 && pw.length != 0) {
			/* alert(id + ', ' + pw); */
			$.ajax({
				url: '${path}/login/in',
				type: 'POST',
				data: 'id='+id+'&pw='+pw,
				success: function(data) {
					/* alert('System Success:)'); */
					console.log(data);
					
					if(data == 0 || data == 3) {
						$('.err_content').css('display', 'block')
						.text('로그인 중 문제가 발생했습니다.' <br> '아이디 및 비밀번호를 확인하거나 계정을 생성하십시오.');
					} else if(data == 1) {
						console.log('로그인 성공');
						location.reload(); //새로고침
						
					} else if(data == 2) {
						$('.err_content').css('display', 'block')
						.text('이메일 인증 후 로그인 할 수 있습니다.');
					}
	
				},
				error: function() {
					alert('System Error:/');
				}
			});
		}
		
		
	});
	
	/* Header 가입하기 버튼 클릭시 동의 페이지 이동 */
	$(document).on('click', '#header_btn_join', function(){
		location.href="${path}/member/constract";
	});
	

</script>
</html>