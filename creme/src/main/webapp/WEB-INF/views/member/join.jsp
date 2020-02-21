<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Secular+One&display=swap');
		* {
			font-family: Dotum,'돋움',Helvetica,sans-self;
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
			background-color: #34495e;
		}
		#uemail {
			margin-right: 87px;
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
		<form name="frm_join" action="" method="POST">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id">
								<input type="text" id="uid" name="uid" class="int" placeholder="아이디를 입력해 주세요">	
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd1">비밀번호</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="upw" name="upw" class="int" placeholder="비밀번호를 입력해 주세요">
								<span class="step_url"><span class="pw_lock"></span></span>
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd2">비밀번호 재확인</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="urpw" name="urpw" class="int" placeholder="비밀번호 재확인">
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
								<input type="text" id="uname" name="uname" class="int" placeholder="이름을 입력해 주세요">
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
				
						<div class="join_row">
							<h3 class="join_title">
								<label for="email">본인 확인 이메일<span class="choice">(선택)</span></label>
							</h3>
							<span class="ps_box">
								<input type="text" id="uemail" name="uemail" class="int" placeholder="이메일을 입력해주세요">
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
								<input type="tel" id="uphone" name="uphone" class="int" placeholder="-없이 입력 예)01012345678">
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="addr">주소</label>
							</h3>
							<span class="ps_box">
								<input type="text" id="sample6_postcode" class="int addr_only" placeholder="우편번호" readonly value="1234">
								<input type="button" id=btn_post onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							</span>
							<span class="ps_box">
								<input type="text" id="sample6_address" class="int addr_only" placeholder="주소" readonly value="광주광역시 북구 중흥동"><br>
							</span>
							<span class="ps_box">
								<input type="text" id="sample6_detailAddress" class="int" placeholder="상세주소">
							</span>
							<span class="error_next_box">필수 정보입니다.</span>
						</div>
					</div>
					<div class="btn_double_area">
						<span><button type="button" id="btn_join" class="btn_type">가입하기</button></span>
					</div>
				</div>
			</div>
		</form>
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
					<span>
						<a href="http://www.naver.com">
							<img id="addr_logo" src="../img/naver/naver_logo.png">
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



		// 아이디 유효성체크:
		// >> #uid인 input태그의 값을 가져와서 체크
		$('#uid').keyup(function(){
			// 사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
			var id = $(this).val().trim(); // 사용자가 입력한 값
			// validation.js의 checkId로 유효성체크를 실행 후 
			// 결과를 result에 담음(code, desc)
			
			var result = joinValidate.checkId(id);

			if(result.code == 0) {
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
			var result = joinValidate.checkPw(pw, rpw);
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
			var result = joinValidate.checkName(name);

			if(result.code == 0) {
				checkArr[2] = true;
			} else {
				checkArr[2] = false;
			}
			// printcheckArr(checkArr);

			ckDesign(result.code, result.desc, 3, 3);
		});
		// 전화번호 유효성체크
		$('#uphone').keyup(function(){
			var phone = $.trim($(this).val());
			var result = joinValidate.checkPhone(phone);
			// console.log(phone);

			if(result.code == 0) {
				checkArr[3] = true;
			} else {
				checkArr[3] = false;
			}
			// printcheckArr(checkArr);

			ckDesign(result.code, result.desc, 5, 5);
		});

		// 이메일 유효성체크
		$('#uemail').keyup(function(){
			var emailId = $.trim($(this).val());
			var url = $('#selemail').val();
			if (url == 'No'){
				$('.ps_box:eq(4)').css('border', '2px solid #f46665');
				$('.error_next_box:eq(4)').css('visibility', 'visible')
									   .text('이메일을 선택해주세요.')
									   .css('color', '#f46665');
				return false; 
			}
			var email = emailId + '@' +url;
			var result = joinValidate.checkEmail(email, emailId);

			if(result.code == 0) {
				checkArr[4] = true;
			} else {
				checkArr[4] = false;
			}
			// printcheckArr(checkArr);

			 // console.log(email);
			ckDesign(result.code, result.desc, 4, 4);
		});

		$('#selemail').change(function(){
			// alert('test');
			var url = $('#selemail').val();
			if (url != 'No') {
				var emailId = $.trim($(this).val());
				if (emailId != '' || emailId.length != 0) {
				var email = emailId + '@' +url;
				var result = joinValidate.checkEmail(email, emailId);					
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
			var addrDtail = $.trim($(this).val());
			var addrPost = $('#sample6_postcode').val();
			// console.log('우편번호: '+ addrPost+', 상세주소: '+addrDtail); //테스트 창
			var result = joinValidate.checkAddr(addrDtail, addrPost);
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
			printcheckArr(checkArr);
		});

		// 버튼 활성화!
		$('.int').keyup(function(){
			var checkAll = true;
			
			for (var i = 0; i < checkArr.length; i++) {
				if(!checkArr[i]) {
					checkAll = false;
				}
			}

			if(checkAll) {
				$('.btn_type').addClass('btn_agree');
				//$('#btn_join').prop('disabled', false);
				$('.btn_type').css('cursor', 'pointer');
			} else {
				$('.btn_type').removeClass('btn_agree');
				// $('#btn_join').prop('disabled', true);
				$('.btn_type').css('cursor', 'no-drop');
			}
		});



		// 회원가입 버튼 클릭!
		$('#btn_join').click(function(){
			// alert('test');
			var invalidAll = true;
			for(var i = 0; i <checkArr.length; i++) {
				if (!checkArr[i]) {
			$('.error_next_box:eq('+msg+')').css('visibility', 'visible')
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
				alert('회원가입 성공!');
			} else { 
				alert('유효성체크를 진행해주세요!');
			}

		});
	});

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


	// 개발시 사용: 유효성체크 전체여부를 출력해주는 함수(true, false)
	function printcheckArr(checkArr) {
		for(var i=0; i < checkArr.length; i++) {
			console.log(i +'번지: ' + checkArr[i]);
		}
	}
</script>
</html>