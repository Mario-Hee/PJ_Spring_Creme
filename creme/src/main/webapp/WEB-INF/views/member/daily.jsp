<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check: 출석체크</title>
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>
<style type="text/css">
	.daily_wrap {
		width: 1400px;
		padding: 15px;
		margin: 0 auto;
		border-top: 3px solid  #34495e;
	}
	.content_menu_title {
	    font-size: 25px;
	    padding-top: 20px;
	    padding-bottom: 5px;
		margin: 0 auto;
		width: 1400px;
	}
	.daily_wrap_inner {
		padding: 15px;
		border: 1px solid rgba(20,23,28,.1);
		border-radius: 2px;
		box-shadow: 0 0 1px 1px rgba(20,23,28,.1), 0 3px 1px 0 rgba(20,23,28,.1);
	}
	.dailycheck_write_wrap {
		display: flex;
		align-items: center;
		justify-content: space-between;
		height: 53px;
	}
	.input_daily_wrap {
		border: 1px solid rgba(20,23,28,.1);
		display: inline-block;
		height: 52px;
		position: relative;
		border-radius: 2px;
		width: 1100px;
	}
	.input_daily {
		background-color: #f5f6f7;
	}
	.btn_which {
		position: absolute;
		top: 0px;
		right: 0px;
	}
	.today_time {
		font-size: 17px;
		padding: 0 15px;
	}
	.dailycheck_view_wrap {
		border-top: 1px solid rgba(20,23,28,.1);
	}
	.dailycheck_view_line {
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-size: 17px;
		padding: 15px;
		border-bottom: 1px solid rgba(20,23,28,.1);
	}
	.daily_view_writer {
		color: #007791;
	}
	.dailycheck_view_wrap {
		margin: 15px 0;
	}
</style>
</head>
<body>
<div class="category_wrap">
  <jsp:useBean id="now" class="java.util.Date"/>
  <fmt:formatDate value="${now}" pattern="yyyy년MM월dd일 HH시mm분" var="today"/>
  <div class="content_menu_title">출석체크</div>
  <div class="category_menu daily_wrap">
    <div class="daily_wrap_inner">
      <div class="dailycheck_write_wrap">
        <div class="input_daily_wrap">
          <input type="text" placeholder="" name="dailyContent" class="input_search input_daily">
          <button type="button" id="btn_daily" class="btn btn_search btn_which"><i class="fas fa-search"></i></button>
        </div>
        <div class="today_time"><span>${today}</span></div>
      </div>
      <div class="dailycheck_view_wrap">
        <div class="dailycheck_view_line">
          <div class="daily_view_content">안녕하세요:)</div><div class="daily_view_writer">체리링</div>
        </div>
        <div class="dailycheck_view_line">
          <div class="daily_view_content">크크크</div><div class="daily_view_writer">제리링</div>
        </div>
        <div class="dailycheck_view_line">
          <div class="daily_view_content">안녕하세요 오늘 하루도 수공!</div><div class="daily_view_writer">초롱이</div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">

	$(document).on('click', '#btn_daily', function(){
		// alert('ㅋㅋㅋ');
		var content = $('.input_daily').val();
		var writer = '${name}';
		
		if(writer == '') {
			$('.modal_wrap2').css('display', 'flex');
			$('#login_id').focus();
			$('.err_content').css('display', 'block')
					  		 .text('로그인이 필요한 기능입니다.');
			
			return false;
		}
		
		// alert(content);
		if(content = '' || content.length == 0) {
			alert('값을 입력해주세요.')
			// err 메세지 출력!!!
			return false;
		}
		location.href='${path}/member/daily/create?content='+content+'&writer='+writer;
	});
</script>
</html>