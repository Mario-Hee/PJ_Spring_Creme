<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Gothic+A1&display=swap');

		div.content_wrap {
			width: 100%;
			background-color: white;
		}
		div.content {
			width: 1400px;
			margin: 0 auto;
			border: 1px solid red;
		}

		* {box-sizing: border-box;}
		body {font-family: Verdana, sans-serif;}
		.mySlides {display: none;}
		img {vertical-align: middle;}

		/* Slideshow container */
		.slideshow-container {
		  max-width: 1700px;
		  position: relative;
		  margin: auto;
		}

		/* Caption text */
		.text {
		  color: #000000;
		  font-size: 15px;
		  padding: 8px 12px;
		  position: absolute;
		  bottom: 8px;
		  width: 100%;
		  text-align: center;
		}

		/* Number text (1/3 etc) */
		.numbertext {
		  color: #f2f2f2;
		  font-size: 12px;
		  padding: 8px 12px;
		  position: absolute;
		  top: 0;
		}

		/* The dots/bullets/indicators */
		.dot {
		  height: 15px;
		  width: 15px;
		  margin: 0 2px;
		  background-color: #bbb;
		  border-radius: 50%;
		  display: inline-block;
		  transition: background-color 0.6s ease;
		}

		.active {
		  background-color: #717171;
		}

		/* Fading animation */
		.fade {
		  -webkit-animation-name: fade;
		  -webkit-animation-duration: 1.5s;
		  animation-name: fade;
		  animation-duration: 1.5s;
		}

		@-webkit-keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}

		@keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}

		/* On smaller screens, decrease text size */
		@media only screen and (max-width: 300px) {
		  .text {font-size: 11px}
		}
		
		.goods-content {
			padding: 25px;
		}

		.list {

			position: relative;

		}

		.list ul {

			font-size: 0;

		}

		.list li {

			display: inline-block;

		}

		.thumbnail {

			overflow: hidden;

			text-align: center;

			width: 310px;

		}

		.thumbnail a > img {

			border: 1px solid green;

		}

		.txt {

			padding: 10px 6px 0;

			padding-bottom: 5px;

			border-bottom: 1px solid blue;

			text-align: center;

		}

		.txt a {

			display: inline-block;

			margin: 4px 0 0;

		}

		a {

			color: #1c1c1c;

			text-decoration: none;

		}

		.txt a > strong {

			font-size: 12px;

			font-weight: normal;

			line-height: 20px;

			color: #333333;

		}

		.price {

			padding: 7px 6px 0;

			text-align: center;

		}

		.cost strong {

			color: #333;

			font-size: 13px;

		}

 

		#intro {

			background: url(${path}/resources/img/marrakech-735889_1920.jpg) 50% 0 no-repeat fixed;

			width: 1400px;

			min-width: 1280px;

			overflow: visible;

			z-index: 2;

			height: 400px;

			margin: 0;

			padding: 0;

			border: 1px solid green;

		}

		.Scroll {

			margin: 0;

			overflow: auto;

			width: 100%;

		}

		.Banner_Box {

			margin: 100px auto;

			text-align: center;

			font-size: 20px;

			overflow: auto;

			width: 100%;

		}

		#m1 {

			position: relative;

			width: 100%;

			height: 290px;

			margin: 50px auto 0;

			border: 1px solid red;

		}

 

		.main_ban {

			float: left;

			margin: 0 auto;

			padding: 0 0;

			border: 1px solid blue;

		}

		.main_ban a {

			display: block;

			width: 100%;

			transition: all 0.4s ease-in-out;

		}

		img {
			
			width: 450px;

			height: 288px;

			border: none;

			vertical-align: top;

		}

		.Scroll_txt {
			font-size: 20px;
			color: white;
			font-weight: 600;
		}

		.ban02 {

			margin-left: 19px;

		}

		.ban03 {

			margin-left: 19px;

		}

 		#main {
 			margin: 20px;
 		}

 		.aaa {
 			padding: 17px;
 		}

		.footer {

			padding-bottom: 53px;

		}

		footer {

			position: relative;

			width: 100%;

			margin: 0 auto;

			text-align: left;

			height: 350px;

			border-top: 1px solid red;
			
			margin-top: 50px;

		}

		footer h2 {

			position: relative;

			height: 100px;

			margin: 0 auto;

			padding-top: 40px;

			text-align: center;

			color: #717171;

		}

		.footlink {

			position: relative;

			width: 1200px;

			height: 26px;

			line-height: 26px;

			text-align: center;

			margin: 0 auto;

			font-weight: normal;

			color: #cccccc;

			border: 1px solid red;

		}

		.footlink a {

			color: black;

			padding: 10px 10px 0 10px;

			font-weight: bold;

		}

		.f2 {

			position: relative;

			width: 1200px;

			height: 120px;

			margin: 10px auto;

			text-align: center;

			border: 1px solid red;

		}

		.footcopy {

			position: relative;

			width: 1200px;

			height: 70px;

			padding: 10px 0px 0 0px;

			font-size: 12px;

			color: #848484;

			line-height: 20px;

			border: 1px solid red;

		}

		.f2 .ftop {

			display: none;

			position: fixed;

			width: 78px;

			height: 31px;

			bottom: 27px;

			right: 20px;

		}
		#footer_creme {
		width: 208px;
		height: 76px;
		margin: -40px;
		}
		
		.btn_bizinfo {
		width: 109px;
		height: 20px;
		}
		#gotop {
		width: 20px;
		height: 20px;
		}
	</style>
</head>
<body>
	<div class="content_wrap">
		<div class="content">
			<div class="slideshow-container">
			<div class="mySlides fade">
			  <div class="numbertext">1 / 3</div>
			  <img src="${path}/resources/img/PERFUME1.png" style="width:1400px;height: 770px;">
			  <!-- <div class="text">Caption One</div> -->
			</div>

			<div class="mySlides fade">
			  <div class="numbertext">2 / 3</div>
			  <img src="${path}/resources/img/PERFUME2.png" style="width:1400px;height: 770px;">
			  <!-- <div class="text">Caption Two</div> -->
			</div>

			<div class="mySlides fade">
			  <div class="numbertext">3 / 3</div>
			  <img src="${path}/resources/img/PERFUME3.png" style="width:1400px;height: 770px;">
			  <!-- <div class="text">Caption Three</div> -->
			</div>
			</div>
			<br>
			<div style="text-align:center">
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			</div>
					
					<div id="main"></div>
			
						<!-- 메인 상품 노출 -->

					<div class="goods-content">

						<div class="item-display">

							<div class="list">

								<ul>

									<li style="width: 25%">

										<div class="space" style="width: 282px;">

											<div class="thumbnail">

												<a href="#">

													<img src="${path}/resources/img/perfumelist1.png" style ="width: 289px; height: 335px;"  alt="FABULOUS131 70ml" title="FABULOUS131 70ml" class="middle">

												</a>

											</div>

											<div class="txt">

												<a href="#">

													<strong>FABULOUS131 70ml</strong>

												</a>

											</div>

											<div class="price">

												<span class="cost">

													<strong>117,000</strong>

												</span>

												<br>

											</div>

											<div class="display-field"></div>

										</div>

									</li>

 

									<li style="width: 25%" >

										<div class="space" style="width: 282px;">

											<div class="thumbnail">

												<a href="#">

													<img src="${path}/resources/img/perfumelist2.png"  style ="width: 289px; height: 335px;" alt="SECRET LOVE OF ACACIA 70ml" title="SECRET LOVE OF ACACIA 70ml" class="middle">

												</a>

											</div>

											<div class="txt">

												<a href="#">

													<strong>SECRET LOVE OF ACACIA 70ml</strong>

												</a>

											</div>

											<div class="price">

												<span class="cost">

													<strong>117,000</strong>

												</span>

												<br>

											</div>

											<div class="display-field"></div>

										</div>

									</li>

 

									<li style="width: 25%">

										<div class="space" style="width: 282px;">

											<div class="thumbnail">

												<a href="#">

													<img src="${path}/resources/img/perfumelist3.png"  style ="width: 289px; height: 335px;" alt="HER 70ml" title="HER 70ml" class="middle">

												</a>

											</div>

											<div class="txt">

												<a href="#">

													<strong>HER 70ml</strong>

												</a>

											</div>

											<div class="price">

												<span class="cost">

													<strong>105,000</strong>

												</span>

												<br>

											</div>

											<div class="display-field"></div>

										</div>

									</li>

 

									<li style="width: 25%">

										<div class="space" style="width: 282px;">

											<div class="thumbnail">

												<a href="#">

													<img src="${path}/resources/img/perfumelist4.png"  style ="width: 289px; height: 335px;" alt="SYEARS AGO 70ml" title="SYEARS AGO 70ml" class="middle">

												</a>

											</div>

											<div class="txt">

												<a href="#">

													<strong>SYEARS AGO 70ml</strong>

												</a>

											</div>

											<div class="price">

												<span class="cost">

													<strong>105,000</strong>

												</span>

												<br>

											</div>

											<div class="display-field"></div>

										</div>

									</li>

								</ul>

							</div>

						</div>

					</div>

 				<div class="aaa"></div>

				<!-- 스크롤 배너 -->

				<div id="intro">

					<div class="Scroll">

						<div class="Banner_box">

							<ul>

								<!-- 배너 시작 -->

								<li class="wow fadeInDown animated ns animated" style="visibility: visible;animation-delay: 0.5s;animation-name: fadeInDown;">

									<a href="#">

										<!-- <img src=""> -->

										<strong class="Scroll_txt">크렘므는 프래그런스 라이프 스타일 브랜드입니다. 당신의 일상을 풍요롭게 할 향기를 주제로 다양한 라이프 스타일 오브제를 만듭니다.</strong>

									</a>

								</li>

								<!-- 배너 끝 -->

							</ul>

						</div>

					</div>

				</div>

 

				<div id="m1">

					<div class="main_ban">

						<a href="#">

							<img src="${path}/resources/img/ezgif.com-video-to-gif.gif" alt="BRAND">

						</a>

					</div>

 

					<div class="main_ban ban02">

						<a href="#" target="_blank">

							<img src="${path}/resources/img/perfumeReview.png" alt="REVIRW" title="후기">

						</a>

					</div>

 

					<div class="main_ban ban03">

						<a href="#">

							<img src="${path}/resources/img/perfumeEvent.png" alt="NEW" title="이벤트">

						</a>

					</div>

				</div>

			</div>

		</div>

	</div>

	<!-- 본문 끝 -->

		</div>
		<div id="footer">

		<footer>

			<h2>

				<a href="#">

					<img src=""  id="footer_creme" alt="크렘므 로고">

				</a>

			</h2>

			<div class="f1">

				<div class="footlink">

					<a href="#">회사소개</a>

					<a href="#">이용안내</a>

					<a href="#">개인정보취급방침</a>

					<a href="#">이용약관</a>

					<a href="#">광고/제휴 문의</a>

					<a href="#">고객센터</a>

					<a href="#">모바일버전</a>

				</div>

			</div>

			<div class="f2">

				<div class="footcopy">

					<span>

						크렘므 향수  &nbsp; 대표 : Jonghee Kim  &nbsp; 주소:Gwang-ju in S.Korea&nbsp; 사업자등록번호 : 111-11-12345

						<img src="#" class="btn_bizinfo" alt="사업자정보확인">

					</span>

					<br>

					<span>

						통신판매업신고번호 : 2020-광주북구-1234 &nbsp; 개인정보관리자 : 김종희 / 메일 

						<button type="button" onclick="popup_email('icon94@naver.com');">

							icon94@naver.com</button>

							 &nbsp;  대표번호 : 

							<strong>070-1234-5678</strong> &nbsp; 

					</span>

					<br>

					<br>

					<span>

						 copyright (c) 

						<strong>creme.com</strong>

						 all right reserved.

					</span>

				</div>

				<a href="#" class="ftop gotop" style="display: block;">

					<img src="" id="gotop" alt="top">

				</a>

			</div>

			<div class="container">

				<div class="certify-mark">

					<span></span>

					<span></span>

				</div>

			</div>

		</footer>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}


	// video 플레이 이벤트
	$(document).ready(function() {

	    $("#playBtn").on("click", function() {

	        $("#myVideo").trigger("play");

	    });

	});

	// video 풀 스크린 
	$(document).ready(function() {

    $("#fullBtn").on("click", function() {

        var elem = document.getElementById("myVideo");

        if(elem.requestFullscreen) {

            elem.requestFullscreen();

        } else if(elem.mozRequestFullScreen) {

            elem.mozRequestFullScreen();

        } else if (elem.webkitRequestFullscreen) {

            elem.webkitRequestFullscreen();

        } else if (elem.msRequestFullscreen) {

            elem.msRequestFullscreen();

        }

    });

});



	</script>
</html>