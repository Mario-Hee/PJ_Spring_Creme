<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
	<title>크렘므: 회원가입</title>
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<script src="https://kit.fontawesome.com/3d124ab517.js" crossorigin="anonymous"></script>
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Secular+One&display=swap');
		@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
		* {
			font-family: 'Nanum Gothic' ;
			box-sizing: border-box;
		}
		body {
		background: #f5f6f7;
		}
		.header_join {
			display: block;
			text-align: center;
		}
		.join_txt {
			font-size: 30px;
			color: #34495e;
			font-weight: bold;
			text-shadow: 1px 1px 0 #34495e;
			position: relative;
			top: 37px;
		}
		.header_content_logo_img {
			max-width: 135px;
			display: block;
			margin: auto;
		}
		.join_content {
			width: 460px;
			margin: 0 auto;
			position: relative;
			right: 50px;
		}
		.row_group {
			overflow: hidden;
			width: 570px;
			padding: 70px 0 0 0;
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
			width: 570px;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			background: #fff;
			vertical-align: top;
			margin-bottom: 2px;
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

		/* 자물쇠모양 아이콘 */
/*		.pw_lock {
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
		}*/
		.btn_double_area {
			margin: 30px 0 9px;
		}
		.btn_type {
			display: block;
			width: 100%;
			padding: 23px 0 17px;
			font-size: 20px;
			font-weight: 700;
			color: #fff;
			text-align: center;
			cursor: no-drop;
			border: none;
			outline: none;
			position: relative;
			left: 50px;
			border-radius: 4px;
		}

	</style>
</head>
<body>
	<div class="header_content_logo">
		<a href="#">
			<img class="header_content_logo_img" src="${path}/resources/img/logo_transparent.png" alt="로고이미지">
			<span class="header_content_logo_text"></span>
		</a>
	</div>
	<div class="header_join">
		<span class="join_txt">새로운 비밀번호로 안전하게 관리해주세요!</span>
	</div>
	
	 <form:form id="frm_member" modelAttribute="memberDTO" autocomplete="on" name="frm_join">
		<div class="container">
			<div class="join_content">
				<div class="row_group">
					<div class="join_row">
						<h3 class="join_title">
							<label for="pwd1">현재 비밀번호</label>
						</h3>
						<span class="ps_box int_pass">
							<input type="password" id="nowpw" name="upw" class="int join_info_box_input" placeholder="현재 비밀번호를 입력해주세요">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="error_next_box">필수 정보입니다.</span>
					</div>
					<div class="join_row">
						<h3 class="join_title">
							<label for="pwd2">수정할 비밀번호</label>
						</h3>
						<span class="ps_box int_pass">
							<input type="password" id="upw" name="pw" class="int join_info_box_input" placeholder="비밀번호(8~16자리)">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="error_next_box">필수 정보입니다.</span>
					</div>
					<div class="join_row">
						<h3 class="join_title">
							<label for="pwd3">수정할 비밀번호 재확인</label> 
						</h3>
						<span class="ps_box int_pass">
							<input type="password" id="urpw" name="rpw" class="int join_info_box_input" placeholder="비밀번호 재입력">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="error_next_box">필수 정보입니다.</span>
					</div>
				</div>
				<div class="btn_double_area">
					<span><button type="button" id="btn_join" class="btn_type btn-agree">비밀번호 수정하기</button></span>
				</div>
			</div>		
		</div>
	</form:form>
</body>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
 
	
	  //$(document).on('keyup', '#nowpw', function(){ 특히 $(document)가 있으면 값도 교환하지 않고 독단으로 혼자 동작한다.
	  //$('#upw').keyup(function(){ 전역변수를 공유해서 쓸건지 안쓸건지
	  //$(document).ready(function){ 안에 있어야 사용할 수 있다.
	$(function(){
		var pwFlag = false;
		
		var checkArr = new Array(2).fill(false);
		
		$('#nowpw').keyup('keyup', function(){
			var nowpw = $(this).val();
			//console.log('입력:'+nowpw);
			//나에게 올 수 있는 code : 1, 2, 6, 100
			var result = joinValidate.checkNowpw(nowpw);
			console.log("code: "+result.code);
			ckDesign(result.code, result.desc, 0, 0); // 이 결과에 따라 성공유무가 나타난다.
			
			if(result.code == 100) {
				checkArr[0] = true;
			} else {
				checkArr[0] = false;
			}
			
		});
		
		
		 $('#upw').keyup(function(){
			var nowpw = $.trim($('#nowpw').val());  //현재비밀번호 확인
			var pw = $.trim($('#upw').val()); 		//새비밀번호
			var rpw = $.trim($('#urpw').val()); 	//새비밀번호 재확인

			var result = joinValidate.checkPw(nowpw, pw, rpw);
			
			if(result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}
			ckDesign(result.code, result.desc, 1, 1);
			
			if(result.code == 10) {
				checkArr[1] = true;
				$('.ps_box:eq(2)').css('border', '2px solid #3885ca');
				$('.error_next_box:eq(2)').css('visibility', 'visible')
									   .text(result.desc)
									   .css('color', '#3885ca');
			} else {
				checkArr[1] = false;
			}
		});
		
		$('#urpw').keyup(function(){
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			ckDesign(result.code, result.desc, 2, 2);
			
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
		});
		
		$('.int').keyup(function(){
			printcheckArr(checkArr);
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

		$('#btn_join').click(function(){
			var invalidAll = true;
			for(var i = 0; i < checkArr.length; i++) { //checkArr는 2이므로 0, 1을 반복한다.
				if(!checkArr[i]) {
					invalidAll = false;
					$('.join_err_msg:eq('+i+')').css('visibility', 'visible')
												.css('color', '#d95339');
				}	
			}
			if(invalidAll) {
				$('#frm_member').submit();
			} else {
				alert('유효성체크를 진행해주세요!');
			}
		});
	});
	
	// 에러메세지 출력(function은 함수기 때문에 document 안에 넣지 말고 따로 두어야한다.)
	function ckDesign(code, desc, line, msg) {
		if (code == 0 || code == 10 || code == 100) { // 통과 o
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