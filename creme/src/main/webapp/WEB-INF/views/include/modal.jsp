<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크렘므: </title>
<script src="https://kit.fontawesome.com/3d124ab517.js" crossorigin="anonymous"></script>
<style type="text/css">	
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');
		a {
			font-family: 'Nanum Gothic' ;
		}
		
		body {
			background: #fff;
		}
		.modal_msg_close {
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.modal_msg_close > button {
			color: rgb(142, 142, 142);
			border: none;
			background: white;
			font-size: 30px;
			cursor: pointer;
			outline: none;
		}
		.modal_msg_close > button:hover {
			color: #EBA444;
		}
		.modal_msg_wrap {
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: none;
			justify-content: center;
			align-items: center;
			
		}
		.modal_on {
			display: block;
		}
		.modal_contents {
			position: relative;
			width: 460px;
			height: 258px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
				0 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			overflow: hidden;
		}	
		#modal_msg_main_txt {
			text-align: center;
			margin: 54px 0 0;
			font-size: 20px;
			font-weight: bold;
			color: #1b1b1b;
		}
		#modal_msg_sub_txt {
			display: block;	
			text-align: center;
			font-size: 18px;
			margin: 20 0 0;
			color: #1b1b1b;
			font-weight: bold;
			padding-bottom: 32px;
			margin: 36px 0 0;
		}
		.modal_x {
			width: 120px;
			height: 45px;
			background-color: #34495e;
			border-radius: 4px;
			border: 1px solid #D1D1D1;
			color: #fff;
			font-weight: bold;
			text-align: center;
			line-height: 40px;
		}
		.modal_O {
			width: 120px;
			height: 45px;
			background-color: #34495e;
			border-radius: 4px;
			border: 1px solid #D1D1D1;
			color: #fff;
			font-weight: bold;
			text-align: center;
			line-height: 40px;
			margin-left: 30px;
		}
		.madal_box{
			padding-left: 101px;
		}
		
		.modal_msg_btn_wrap {
			display: flex;
			align-items: center;
			justify-content: center;
		}
	</style>
</head>
<body>
<div class="modal_msg_wrap">
	<div class="modal_contents">
		<div class="modal_msg_close">
			<button><i class="fas fa-times"></i></button>
		</div>
		<div id="modal_msg_main_txt">
		</div>
		<div id="modal_msg_sub_txt">
		</div>
		<div class="modal_msg_btn_wrap">
			<div class="modal_x" id="modal_msg_cancle">취소</div>
			<div class="modal_O" id="modal_msg_yes">확인</div>
		</div>
		<div class="modal_back"></div>
	</div>		
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var id='${id}';
		var email='${email}';
		var key='${key}';
		
		var join_main_txt = id+'님 회원가입을 축하드립니다.';
		var join_sub_txt = email+'으로 인증메일을 보냈습니다.  인증하셔야만 사이트 활동이 가능합니다.';
		var auth_main_txt = id+'님 이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다.';
		var drop_main_txt = '${userid}님 정말 탈퇴하시겠습니까?';
		var dropResult_main_txt = id+'님 탈퇴되셨습니다.';
		var dropResult_sub_txt = '그동안 CREME를 이용해주셔서 감사합니다.';
		
		
		if(key == 'join') { // 회원가입
			$('#modal_msg_main_txt').text(join_main_txt);	// 메인 텍스트
			$('#modal_msg_sub_txt').text(join_sub_txt);		// 서브 텍스트
			$('#modal_msg_yes').css('display', 'none');  	// 확인버튼 제거
			$('#modal_msg_cancle').text('확 인');
			$('.modal_msg_wrap').css('display', 'flex');	// 모달창 출력
			
		} else if(key == 'auth') { // 이메일 인증
			$('#modal_msg_main_txt').text(auth_main_txt);
			$('#modal_msg_sub_txt').text(auth_sub_txt);		
			$('#modal_msg_yes').css('display', 'none');
			$('#modal_msg_cancle').text('확 인');
			$('.modal_msg_wrap').css('display', 'flex');
			
	
		} else if(key == 'drop') { //회원 탈퇴 인증
			$('#modal_msg_main_txt').text(drop_main_txt);
	
		} else if(key == 'dropResult') {
			$('#modal_msg_main_txt').text(dropResult_main_txt);
			$('#modal_msg_sub_txt').text(dropResult_sub_txt);
			$('#modal_msg_yes').css('display', 'none');
			$('#modal_msg_cancle').text('확 인');
			$('.modal_msg_wrap').css('display', 'flex');
		}
		
		
		
		$('.modal_msg_close').on('click', function(){     // 모달창 x버튼
			$('.modal_msg_wrap').css('display', 'none');
		});
		
		$('#modal_msg_cancle').on('click', function(){    // 모달창 취소 버튼
			$('.modal_msg_wrap').css('display', 'none');
		});
		
	});
</script>
</html>