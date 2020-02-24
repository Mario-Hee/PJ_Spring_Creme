<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크렘므: 탈퇴 경고창</title>
<style type="text/css">	
		.modal_close {
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.modal_close > button {
			color: rgb(142, 142, 142);
			border: none;
			background: white;
			font-size: 30px;
			cursor: pointer;
			outline: none;
		}
		.modal_close > button:hover {
			color: #EBA444;
		}
		.modal_wrap {
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
		.modal_on {
			display: block;
		}
		.modal_content {
			position: relative;
			width: 460px;
			height: 258px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
				0 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			overflow: hidden;
		}	
		.modal_p {
			text-align: center;
			margin: 34px 0 0;
			font-size: 25px;
			font-weight: bold;
			color: #1b1b1b;
		}
		.modal_span {
			display: block;	
			text-align: center;
			font-size: 20px;
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
			margin: 0 auto 25px;
		}
	</style>
</head>
<body>
<div class="modal_wrap">
		<div class="modal_content">
			<div class="modal_close">
				<button><i class="fas fa-times"></i></button>
			</div>
			<p class="modal_p">회원님</p>
			<span class="modal_span">탈퇴 하시겠습니까?</span>
			<div class="modal_x">확인</div>
			<div class="modal_back"></div>
		</div>		
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	// 탈퇴버튼 클릭시 Modal창 Open
	$(document).on('click', '.out', function(){
		$('.modal_wrap').css('display', 'flex');
	});

	//MODAL창의 X버튼을 클릭하면 Modal창 Close
	$(document).on('click', '.modal_close', function(){
		$('.modal_wrap').css('display', 'none');		
	});
</script>
</html>