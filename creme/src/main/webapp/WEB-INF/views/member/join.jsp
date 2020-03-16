<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Secular+One&display=swap');
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
		* {
			font-family:font-family: 'Nanum Gothic' ;
			box-sizing: border-box;
		}
		body, h1, h2, h3, h4, h5, h6, ul, p {
			margin: 0;
			padding: 0;
		}
		body {
			background-color: #f5f6f7;
			font-size: 12px;
		}
		ul {
			list-style: none;
		}
		a {
			text-decoration: none;
			color: inherit;
		}
		.wrap {
			width: 768px;
			margin: 0 auto;
		}
		.header {
			padding: 31px 0px 15px;
			position: relative;
		}
		.n_logo {
			display: block;
			font-family: 'Secular One', sans-serif;
			font-size: 46px;
			font-weight: 700;
			width: 76px;
			height: 48px;
			margin: auto;
		}
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.row_group {
			overflow: hidden;
			width: 100%;
		}
		.join_title {
			margin: 19px 0 8px;
			font-size: 14px;
			font-weight: 700;
			color: #333;
		}
		.ps_box {
			display: flex;
			align-items: center;
			position: relative;
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			background: #fff;
			vertical-align: top;
			margin-bottom: 2px;
		}
		.int_id {
			padding-right: 110px;
		}
		.int_pass {
			padding-right: 40px;
		}
		.int {
			display: block;
			position: relative;
			width: 100%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}
		.step_url {
			position: absolute;
			right: 13px;
			font-size: 15px;
			color: #8e8e8e;
		}
		.error_next_box {
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: #f46665;
			height: 15px;
			visibility: hidden;
		}
		.pw_lock {
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
		}
		.repw_lock {
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
			background-position: -27px 0;			
		}
		.bir_wrap {
			display: table;
			width: 100%;
		}
		.bir_mm, .bir_dd {
			padding-left: 10px;
		}
		.bir_yy, .bir_mm, .bir_dd {
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.sel {
			background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
			background-size: 20px 8px;
			width: 100%;
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none;
		}
		.choice {
			font-size: 12px;
			font-weight: 400;
			color: #8e8e8e;
		}
		.btn_double_area {
			margin: 30px 0 9px;
		}
		.btn_type {
			display: block;
			width: 100%;
			padding: 21px 0 17px;
			font-size: 20px;
			font-weight: 700;
			color: #fff;
			text-align: center;
			cursor: no-drop;
			border: none;
			outline: none;
		}
		#uemail {
			margin-right: 87px;
		}
		
		.email_box {
			display: none;
		}

		#back {
			position: fixed;
			z-index: 1200;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			display: none;
			align-items: center;
			justify-content: center;
		}
		.loading_img {
			animation: ani_loading 1.5s infinite linear;
			font-size: 70px;
		}
		@keyframes ani_loading {
			from {-webkit-transform: rotate(0deg);}
			to {-webkit-transform: rotate(359deg);}
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
		table <= display: table;
		td    <= display: table-cell;
		div   <= display: block;
		

	</style>
</head>
<body>
	<div class="wrap">
	<header><div class="header">
		<h1 class="naver_logo"><a href="#" class="n_logo">JOIN</a></h1>
	</div></header>

	<section>
		<!-- <form name="frm_join" action="${path}/member/join" method="POST"> -->
		<form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id">
								<input type="text" id="uid" name="id" class="int" placeholder="아이디를 입력해 주세요"  value="${user.id}">	
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd1">비밀번호</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="upw" name="pw" class="int" placeholder="비밀번호를 입력해 주세요">
								<span class="step_url"><span class="pw_lock"></span></span>
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd2">비밀번호 재확인</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="urpw" name="rpw" class="int" placeholder="비밀번호 재확인">
								<span class="step_url"><span class="repw_lock"></span></span>
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
					</div>
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="ps_box">
								<input type="text" id="uname" name="name" class="int" placeholder="이름을 입력해 주세요" value='${user.name}'>
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
				
						<div class="join_row">
							<h3 class="join_title">
								<label for="email">본인 확인 이메일<span class="choice">(선택)</span></label>
							</h3>
							<span class="ps_box email_box2">
								<input type="text" id="uemail" name="email" class="int" placeholder="이메일을 입력해주세요" value="${user.email}">
								<select class="sel" id="selemail">
									<option value="No" selected="selected">Email 선택</option>
									<option value="naver.com">@naver.com(네이버)</option>
									<option value="daum.net">@daum.net(다음)</option>
									<option value="gmail.com">@gmail.com(구글)</option>
								</select>	
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
						<div class="join_row">
							<h3 class="join_title">
								<label for="phone">휴대전화</label>
							</h3>
							<span class="ps_box">
								<input type="tel" id="uphone" name="phone" class="int" placeholder="-없이 입력 예)01012345678" value='${user.phone}'>
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="addr">주소</label>
							</h3>
							<span class="ps_box">
								<input type="text" id="sample6_postcode" name="postcode" class="int addr_only" placeholder="우편번호" readonly value="${user.postcode}">
								<input type="button" id=btn_post onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							</span>
							<span class="ps_box">
								<input type="text" id="sample6_address" name="addr1" class="int addr_only" placeholder="주소" readonly value="${user.addr1}" ><br>
							</span>
							<span class="ps_box">
								<input type="text" id="sample6_detailAddress" name="addr2" class="int" placeholder="상세주소" value="${user.addr2}">
								<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
					</div>
					<div class="btn_double_area">
						<span><button type="button" id="btn_join" class="btn_type btn-agree">가입하기</button></span>
					</div>
				</div>
			</div>
		</form:form>
		<!--</form>-->
	</section>
	<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				<div id="address"> 
					<span>Copyright</span>
					<span>ⓒ</span>
					<span><strong><a href="#">Creme Corp.</a></strong></span>
					<span>ALL Rights Reserved.</span>
				</div>			
			</div>
		</footer>
	</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 비밀번호가 유효한 값인지 체크해주는 Flag값 
		// 기본값 false
		// checkPw를 5번까지 통과하면 true
		var pwFlag = false;

		// 유효성체크 여부를 알려주는 배열
		var checkArr = new Array(6).fill(false);
		// printcheckArr(checkArr);
		// 7개 모두가 true일 때만 통과한다.

		// 유효성체크 모두 통과 or 불통 여부를 알려주는 변수
		// 7개에서 하나라도 false가 나오면 
		var checkAll = true;
		//alert('user: '+'${user}');
		
		if('${user}' != '') {
			// 회원정보수정 디자인 변경
			
			// →버튼 텍스트가 수정하기로 바뀐다
			$('#btn_join').text('수정하기');
			
			// →비밀번호 제거
			$('.join_row:eq(1)').css('visibility', 'hidden')
								.css('height', '0')
								.css('margin-top', '-17px');
			
			// →비밀번호 재설정 제거
			$('.join_row:eq(2)').css('visibility', 'hidden')
								.css('height', '0')
								.css('margin-top', '-17px');
			
			// →id에 readonly 효과를 줘서 입력이 불가능
			// id=#id를 제거해서 우리가 입력한 유효성체크 동작 불가능
			$('.join_info_box_input:eq(0)').attr('readonly', 'true')
										   .removeAttr('id');
			$('.email_box').css('display', 'flex');
			
			var name = '${user.name}';
			var phone = '${user.phone}';
			var email = '${user.email}';
			var postcode = '${user.postcode}';
			var addr1 = '${user.addr1}';
			var addr2 = '${user.addr2}';
			ckName(name); 
			ckPhone(phone);
			ckEmail(email);
			ckAddr(postcode, addr2);
			checkArr[0] = true;
			checkArr[1] = true;
			ckColorBtn();
			printcheckArr(checkArr);
				
		}
		
		// 에러메세지 출력
		function ckDesign(code, desc, line, msg) {
			if (code == 0 || code == 10) { // 통과 o
				$('.ps_box:eq('+line+')').css('border', '2px solid #3885ca');
				$('.error_next_box:eq('+msg+')').css('visibility', 'visible')
									   .text(desc)
									   .css('color', '#3885ca');
				return true;
	
			} else { // 통과 x
				$('.ps_box:eq('+line+')').css('border', '2px solid #f46665');
				$('.error_next_box:eq('+msg+')').css('visibility', 'visible')
									   .text(desc)
									   .css('color', '#f46665');
				return false; 
				}
			}

		// 비정상적인 접근인지 판단한다.
		// '${flag}' el태그로 받는다.
		// el태그를 쓸때는 따옴표를 붙여서 써야한다! 그렇지 않으면 오류!
		
	//	var flag = '${flag}';
	//	if (flag == 0) {
	//		location.href="${path}/member/constract";
	//	}
		
		// 아이디 유효성체크:
		// >> #uid인 input태그의 값을 가져와서 체크
		$('#uid').keyup(function(){
			// 사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
			var id = $(this).val().trim(); // 사용자가 입력한 값
			// validation.js의 checkId로 유효성체크를 실행 후 
			// 결과를 result에 담음(code, desc)
			
			var result = joinValidate.checkId(id);
			
			if(result.code == 0) {
				// 결과가 0이면 (0 == 통과)
				// 통과하면 checkArr 배열에 true가 들어간다.
				checkArr[0] = true;
			} else {
				checkAll[0] = false;
			}

			// 유효성체크 결과로 테두리색과 err메세지를 출력하는
			// 함수 실행
			console.log(result.code + " ," + result.desc);
			ckDesign(result.code, result.desc, 0, 0);
		});

		// 비밀번호 유효성체크
		$('#upw').keyup(function(){
			// 1. 사용자가 입력한 값 받기
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
			
			//  2. 유효성 체크 하기
			var result = joinValidate.checkPw("", pw, rpw);
			if(result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}
			if(result.code == 10) {
				checkArr[1] = true;
				$('.ps_box:eq(2)').css('border', '2px solid #3885ca');
				$('.error_next_box:eq(2)').css('visibility', 'visible')
									   .text(result.desc)
									   .css('color', '#3885ca');
			} else {
				checkArr[1] = false;
			}
			// printcheckArr(checkArr);

			// 3. 체크 결과에 따라 디자인하기
			ckDesign(result.code, result.desc, 1, 1);
		});
		// 비밀번호 재확인 유효성체크
		$('#urpw').keyup(function(){
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
			// console.log(pw+', '+rpw);

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			if(result.code == 10) {
				checkArr[1] = true;
				$('.ps_box:eq(1)').css('border', '2px solid #3885ca');
				$('.error_next_box:eq(1)').css('visibility', 'visible')
									   .text(result.desc)
									   .css('color', '#3885ca');
			} else if(result.code == 6) {
				checkArr[1] = false;
				 // $('.error_next_box:eq(1)').css('visibility', 'visible')
				 // 					   .text(result.desc)
				 // 					   .css('color', '#3885ca');
			} else {
				checkArr[1] = false;
			}
			// printcheckArr(checkArr);

			ckDesign(result.code, result.desc, 2, 2);
		});

		// 이름 유효성체크
		$('#uname').keyup(function(){
			var name = $.trim($(this).val());
			// console.log(name);
			ckName(name);
		});
		
		function ckName(name) {
			var result = joinValidate.checkName(name);
			ckDesign(result.code, result.desc, 3, 3);
			
			if(result.code == 0) {
				checkArr[2] = true;
			} else {
				checkArr[2] = false;
			}
		}
		// printcheckArr(checkArr);


	
		// 전화번호 유효성체크
		$('#uphone').keyup(function(){
			var phone = $.trim($(this).val());
			// console.log(phone);
			ckPhone(phone);
		});
		
		function ckPhone(phone){
			var result = joinValidate.checkPhone(phone);
			ckDesign(result.code, result.desc, 5, 5);
			
			if(result.code == 0) {
				checkArr[3] = true;
			} else {
				checkArr[3] = false;
			}
		}
		// printcheckArr(checkArr);

		
		
		// 이메일 유효성체크
		$('#uemail').keyup(function(){
			var emailId = $.trim($(this).val());
			var url = $('#selemail').val();
			var email = emailId + '@' +url;
			
			ckEmail(email);
		
		    if(emailId == '' || emailId.length == 0){
		    	$('.ps_box:eq(4)').css('border', '2px solid #f46665');
				$('.error_next_box:eq(4)').css('visibility', 'visible')
									   .text('아이디를 써주세요.')
									   .css('color', '#f46665');
		    }
			
			if (url == 'No'){
				$('.ps_box:eq(4)').css('border', '2px solid #f46665');
				$('.error_next_box:eq(4)').css('visibility', 'visible')
									   .text('이메일을 선택해주세요.')
									   .css('color', '#f46665');
				return false; 
			}
		});
		
		function ckEmail(email) {
			
			var result = joinValidate.checkEmail(email);
			ckDesign(result.code, result.desc, 4, 4);
			//var url = $('#selemail').val();

			if(result.code == 0) {
				checkArr[4] = true;
			} else {
				checkArr[4] = false;
			}
		}
			// printcheckArr(checkArr);

			 // console.log(email);
		

		$('#selemail').change(function(){
			// alert('test');
			var url = $('#selemail').val();
			if (url != 'No') {
				var emailId = $.trim($(this).val());
				if (emailId != '' || emailId.length != 0) {
					var email = emailId + '@' +url;
					var result = joinValidate.checkEmail(email);					
				}
				if(result.code == 0) {
					checkArr[4] = true;
				} else {
					checkArr[4] = false;
				}
				
			ckDesign(result.code, result.desc, 4, 4);
			} else {
				$('.ps_box:eq(4)').css('border', '2px solid #f46665');
				$('.error_next_box:eq(4)').css('visibility', 'visible')
									   .text('이메일을 선택해주세요.')
									   .css('color', '#f46665');
				return false; 
			}
		});
	
		$('.addr_only').click(function(){
			// 사용자가 우편번호 또는 주소 input을 클릭했을 때!
			$('#btn_post').click();
		});

		// 상세주소를 클릭하면
		$('#sample6_detailAddress').click(function(){
			var addrPost = $('#sample6_postcode').val();
			if(addrPost == '' || addrPost.length == 0) {
				// $('#btn_post').click();
			}
		});

		// 주소 유효성체크
		$('#sample6_detailAddress').keyup(function(){
			//var postcode = $.trim($('#sample6_detailAddress').val());
			var postcode = $('#sample6_postcode').val();
			var addr2 = $.trim($('#sample6_detailAddress').val());
			//console.log('우편번호: '+ addrPost+', 상세주소: '+addrDtail); //테스트 창
			ckAddr(postcode, addr2);
		});
			
		function ckAddr(postcode, addr2) {  
			var result = joinValidate.checkAddr(addr2, postcode);
			// console.log(result.code);
			
			if(result.code == 3) { // 우편번호 & 주소가 없다. 
				ckDesign(result.code, result.desc, 6, 6);
				ckDesign(result.code, result.desc, 7, 6);
				checkArr[5] = false;
			} else if (result.code == 0) { // 성공
				ckDesign(result.code, result.desc, 6, 6);
				ckDesign(result.code, result.desc, 7, 6);
				ckDesign(result.code, result.desc, 8, 6);
				checkArr[5] = true;
			} else { // 상세주소 통과 x한 모든 경우
				ckDesign(result.code, result.desc, 8, 6);
				checkArr[5] = false;
				}
			}
		//printcheckArr(checkArr);


		// 버튼 활성화!
		$('.int').keyup(function(){
			ckColorBtn();
		});
		
		function ckColorBtn() {
			var checkAll = true;
			
			for (var i = 0; i < checkArr.length; i++) {
				if(!checkArr[i]) {
					checkAll = false;
				}
			}

			if(checkAll) {
				$('.btn_type').removeClass('btn-agree')
				.addClass('btn-primary');
				//$('#btn_join').prop('disabled', false);
				$('.btn_type').css('cursor', 'pointer');
			} else {
				$('.btn_type').removeClass('btn-primary')
				.addClass('btn-agree');
				// $('#btn_join').prop('disabled', true);
				$('.btn_type').css('cursor', 'no-drop');
			}
		}


		// 회원가입 버튼 클릭!
		$('#btn_join').click(function(){
			// alert('test');
			var invalidAll = true;
			for(var i = 0; i <checkArr.length; i++) {
				if (!checkArr[i]) {
			$('.error_next_box:eq('+i+')').css('visibility', 'visible')
									   		.css('color', '#3885ca');
				}
			}
			for(var i = 0; i <checkArr.length; i++) {
				if (!checkArr[i]) {
					invalidAll = false;
					$('.error_next_box:eq('+i+')').css('visibility', 'visible')		
									 	  .css('color', '#f46665');
				}
			}
			printcheckArr(checkArr);
			
			
			if (invalidAll) {
				FunLoadingBarStart(); //로딩바생성
				var id = $('#uemail').val();
				var url = $('#selemail').val(); 
				console.log(id+", "+url);
				$('#uemail').val(id+'@'+url);
				alert('회원가입 성공!');
				// submit: form태그 안에 있는 데이터들을 서버단으로 전송
				// action: 목적지(MemberController '/join')
				// method: 방법(POST:숨겨서 보내기)
				$('#frm_member').submit();  
				//submit메서드는 사용자데이터를 보내겠다! form태그 먼저 찾기
			} else { 
				alert('유효성체크를 진행해주세요!');
			}

		});	
	});

		

	// 개발시 사용: 유효성체크 전체여부를 출력해주는 함수(true, false)
	function printcheckArr(checkArr) {
		for(var i=0; i < checkArr.length; i++) {
			console.log(i +'번지: ' + checkArr[i]);
		}
	}
			
	// 로딩바 출력
	function FunLoadingBarStart() {
		var loadingBarImage = ''; //가운데 띄워 줄 이미지
		loadingBarImage += "<div id='back'>";
		loadingBarImage += "<div id='loadingBar'>";
		loadingBarImage += "<img src='${path}/resources/img/icons8-loader-96.png' class='loading_img'>";
		loadingBarImage += "</div></div>";
		$('body').append(loadingBarImage);
		$('#back').css('display', 'flex');
		$('#loadingImg').show();
	}
</script>
</html>