<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>board</title>
	<link rel="icon" type="image/png" href="${path}/resources/img/favicon.png">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<!-- 서치박스 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>

<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');	
	* {
		font-family: 'Nanum Gothic' ;
		box-sizing: border-box;
	}
	body {
		background: #fff;
		margin: 0 auto;
	}

	h1 {
		margin: 45px;
		font-size: 34px;
		text-align: center;
	}

	a {
		color: inherit;
		text-decoration: none;
	}

/* 	div, span, table, tr, td, a{
	border: 1px solid green
	} */

	

	.board_wrap {
		width: 950px;
		height: 800px;
		margin: 30px auto;
	}
/*■■■■ 모든버튼 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.hover_btn { 
		color: #333;
		outline: none; 
		border-radius: 5px;
		font-weight: bold;

	}
	.hover_btn:hover {
		color: tomato;
		outline: none; 
	}




/*■■■■ 최신순 조회순 댓글순 추천순 div영역 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.orderby_row a {
		padding: 10px 10px;
		}
	.orderby_row{
		display: flex;
		justify-content: space-between;  
		align-items: center;	         
		box-sizing: border-box;
		border-top: 3px solid  #34495e;
		border-bottom: 3px solid  #34495e;
		/*background-color: #e1e1e1;*/
		padding: 9px 0 9px 0;
		}
		.orderby_hover_btn {
			font-weight: bold;
		}

/*■■■■ 테이블 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_table{
		border-color: red;
		border-spacing: 0px;
		text-align: center;
		margin: 30px auto;
		width: -webkit-fill-available;
				
	}
	.board_table tr td {
		font-size: 16px;
		padding: 13px 0px;

	}




/*■■■■ 검색바 영역 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.search{
		text-align: center;
    	padding: 10px 5px;
	}
	.search input {
		outline: none;
		padding: 20px 20px;
	}



/*■■■■ 게시글 등록 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.insert_btn{
		padding: 8px 10px;
		border: 2px solid #34495e;
		font-size: 15px;
		}


/*■■■■ 페이지 영역 (버튼 < 1 2 3 4 >) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.page{
		text-align: center;
	    padding: 10px 5px;
	    /*background-color: #eaeaea;*/
	    border-top: 3px solid #34495e;
	}
	.page_btn{
		padding: 10px 15px;
		border: 1px solid #95A5C3; 
		background-color: #95A5C3; 
		color: white;
		outline: none;
	}
	
	.page_btn:hover {
		color: white;
	}

	.page > a { 	/* 페이지 넘버 */
		padding: 10px 10px;
		font-weight: bold;
		color: #1D292C;
	}
/*■■■■■■서치바,검색바■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
		.header_content_search_input {
			background-color: transparent;
			border-color: transparent;
			height: 44px;
			font-size: 13px;
			border-radius: 2px;
			padding: 10px 12px;
			outline: none;
			font-weight: bold;
		}
		.header_content_search_btn {
			border-color: transparent; 
			background-color: transparent; 
			width: 44px;
			height: 37px;
			cursor: pointer;
			color: black; 
			border-top-right-radius: 2px; 
			border-bottom-right-radius: 2px; 
			outline: none;
		}
		.header_content_search_btn:hover {
			background-color: #95A5C3;
			color: white;
			outline: none;
		}
		.header_content_search {
			position: relative;
			top: 3px;
		}
		.header_content_search_group {
			display: flex;  
			align-items: center;
			background-color: #E8E8E8;
			color: #1D292C;
			border-radius: 2px;
			height: 37px;
		}
		.txt_list {
			font-weight: bold;
			color: #1D292C;
		}
		 b{
		 	color: #f46665;
		 	font-weight: normal;
		 	/* 설정할 애니메이션 이름 */
			animation-name: twinkle;
			/* 애니메이션의 반복 횟수 */
			animation-iteration-count: infinite;
			/* 애니메이션의 실행 시간 */
			animation-duration: 1.8s;
		}

		.txt_conn {
			text-align: center;
		}

		td {
			text-align: left;
		}
				.footer {

			padding-bottom: 53px;
		}
		
		.twinkle_eff {
			animation-name: twinkle;
			animation-duration: 1.2s;
			animation-iteration-count: infinite;
		}
		@keyframes twinkle{
			0% {opacity: 0;}
			100% {opacity: 1;}
		}
		.new_color {
			border: 1px solid tomato;
			color: tomato;
			padding: 3px 5px;
			margin-left: 7px;
			font-weight: bold;
			font-size: 12px;
		}

		.header_content_logo_img {
			width: 114px;
    		display: block;
    		margin: auto;
    	}
    	
    	#check_color {
			background-color: transparent;
			color: tomato;
		}
		
    	.board_paging a.active {
    		background-color: black;
    		color: white;
    		border-radius: 3px;
    	}
    	
    	.fas {
    		color: black;
    	}
    	
    	.fa {
    		display: inline-block;
    		font-size: 12px;
    	}
    	.btn_warning {
			color: #f0ad4e;
    	}
		.searchcnt {
			font-size: 15px;
			font-weight: bold;
			padding-top: 15px;
		}
</style>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
		<div class="board_wrap">
		<h1>자유게시판</h1>
		
		<div class="orderby_row">
			<div class="orderby_hover_btn">
				<a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" id="sort_new" class="hover_btn">최신순</a>
				<a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt" class="hover_btn">조회순</a>
				<a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" id="sort_reply" class="hover_btn">댓글순</a>
				<a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" id="sort_good"  class="hover_btn">추천순</a>
			</div>


	<!-- 검색창 -->
	<div>
		<div class="header_content_search">
			<form name="keyword" action="${path}/board/list" method="GET">
				<div class="header_content_search_group">
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" class="header_content_search_input" value="${map.keyword}">
					<button type="submit" class="header_content_search_btn">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	
			<div>
				<a href="${path}/board/write" class="insert_btn hover_btn">글쓰기</a>
			</div>
		</div><!-- orderby_row 끝-->
		
		<c:if test="${not empty map.keyword}">
			<div class="searchcnt">
				<span>${map.keyword} 검색결과 ${map.count}건 검색되었습니다.</span>
				<a href="${path}/board/list" class="btn btn_warning"><i class="fa fa-times-circle"></i></a>
			</div>	
		</c:if>
			

		<table class="board_table">
			<tr class="txt_list">
				<td style="width: 10%">게시글</td>
				<td style="width: 50%">제목</td>
				<td style="width: 10%">작성자</td>
				<td style="width: 11%">등록일</td>
				<td style="width: 7%">조회</td>
				<td style="width: 8%">댓글</td>
				<td style="width: 10%">첨부</td>
			</tr>
			<c:forEach items="${map.list}" var="list">
				<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
					<tr>
						<td>${list.bno}</td>
						<td>
							<c:if test="${list.re_level != 0}">
								<c:forEach begin = "1" end = "${list.re_level}">
									<img class="empty_val" src="${path}/resources/img/icons8-curved-arrow-16.png">
								</c:forEach>
								RE:
							</c:if>	
						<a href="${path}/board/view/${list.bno}" class="txt_conn">${list.title} </a>
							<c:if test="${list.filecnt != 0}">
								<i class="fas fa-paperclip"></i>
							</c:if>
							<c:if test="${today == regdate}">
								<span class="new_color twinkle_eff">N</span>
								<span class=""></span>
							</c:if>
						</td>
						<td>${list.writer}</td>
						<td>
							<c:choose>
								<c:when test="${today == regdate}">
									<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>						
								</c:otherwise>
							</c:choose>
						</td>
						<td>${list.viewcnt}</td>
						<td>${list.replycnt}</td>
						<td>${list.filecnt}</td>
					</tr>
			</c:forEach>
	
		</table>
		
		<div class="page">
			
			
			<c:if test="${map.pager.curBlock > 1}">
				<a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_left"><button class="page_btn hover_btn"><</button></a>
				<a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}" class="">1</a>
				<span>...</span>
			</c:if>
		<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
		<c:choose>
			<c:when test="${num == map.pager.curPage}">	
				<a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="check_color">${num}</a>
			</c:when>
			<c:otherwise>
				<a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<span>...</span>
				<a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword"=${map.keysord}" class="">${map.pager.totPage}</a>
				<a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keysord}" class="page_right"><button class="page_btn hover_btn">></button></a>
			</c:if>	
			
		</div>
	</div>

</body>
</html>
<script type="text/javascript">

$(function(){
	
	var sort_option = '${map.sort_option}';
	if(sort_option != null) {
		$('#sort_' + sort_option).css('color', 'tomato;');
		$('#sort_' + sort_option).css('border-radius', '5px');
		$('#sort_' + sort_option).css('font-weight', 'bold');
	}

	$('.write_btn').click(function(){
		location.href="/creme/board/write";
	});
	
	// 검색어 입력시 치환
	var keyword = '';
	$('.list.title > a').replaceAll(keyword, '<span class="search_thema_box"></span>');
	
	
	// 검색어 입력시 치환
	/* var keyword = '';
	if(keyword != '') {
		var title = '';
		uTitle = title.replaceAll(keyword, '<span class="search_thema_box"></span>');
		$('.post_title').text(uTitle);
	} */
	
});
</script>