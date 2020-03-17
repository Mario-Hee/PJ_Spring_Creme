<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>board</title>
	<!-- 서치박스 스크립트 -->
	<script src="https://kit.fontawesome.com/1aa6bb9bc2.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="../css/common.css">

<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap');	
	* {
		font-family: 'Nanum Gothic' ;
		box-sizing: border-box;
	}
	body {
		background: #f5f6f7;
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
		width: 900px;
		height: 800px;
		margin: 30px auto;
	}
/*■■■■ 모든버튼 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.hover_btn {
		background-color: #95A5C3; 
		color: white;
		outline: none; 
		border-radius: 5px;
		font-weight: bold;

	}
	.hover_btn:hover {
		background-color:  #34495e;
		color: white;
		outline: none; 
	}




/*■■■■ 최신순 조회순 댓글순 추천순 div영역 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.orderby_row a {
		padding: 8px 10px;
		margin-right: 9px;
		}
	.orderby_row{
		display: flex;
		justify-content: space-between;  
		align-items: center;	         
		box-sizing: border-box;
		border-top: 2px solid  #34495e;
		border-bottom: 2px solid  #34495e;
		/*background-color: #e1e1e1;*/
		padding: 9px 0 9px 0;
		}
		.orderby_hover_btn {
			font-weight: bold;
		}

/*■■■■ 테이블 스타일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.board_table{
		margin: 15px 20px;
	    width: 850px;
		border-color: red;
		border-spacing: 0px;
		text-align: center;
				
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
		border: 1px solid #95A5C3; 
		font-size: 15px;
		}


/*■■■■ 페이지 영역 (버튼 < 1 2 3 4 >) ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
	.page{
		text-align: center;
	    padding: 10px 5px;
	    /*background-color: #eaeaea;*/
	    border-top: 2px solid #34495e;
	}
	.page_btn{
		padding: 10px 15px;
		border: 1px solid #95A5C3; 
		color: white;
		outline: none;
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
			background-color: #34495e;
			color: white;
			outline: none;
		}
		.header_content_search {}
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

		@keyframes twinkle{
			0% {opacity: 0;}
			100% {opacity: 1;}

			/* from {opacity: 0;}
			to {opacity: 1;} */
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
</style>
</head>
<body>
		<div class="board_wrap">
		<h1>자유게시판</h1>
		
		<div class="orderby_row">
			<div class="orderby_hover_btn">
				<a href="#" class="hover_btn">최신순</a>
				<a href="#" class="hover_btn">조회순</a>
				<a href="#" class="hover_btn">댓글순</a>
				<a href="#" class="hover_btn">추천순</a>
			</div>


	<!-- 검색창 -->
	<div>
		<div class="header_content_search">
			<form name="frm_search" action="" method="GET">
				<div class="header_content_search_group">
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" class="header_content_search_input">
					<button type="button" class="header_content_search_btn">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</div>

			<div>
				<button type="button" class="insert_btn hover_btn">글쓰기</button>
			</div>
		</div><!-- orderby_row -->

		<table class="board_table">
			<tr class="txt_list">
				<td style="width: 10%">게시글</td>
				<td style="width: 60%">제목</td>
				<td style="width: 10%">작성자</td>
				<td style="width: 10%">등록일</td>
				<td style="width: 10%">조회수</td>
			</tr>

			<tr>
				<td>1111</td>
				<td><a href="#" class="txt_conn">제목<b lass="new">new</b></a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>1</td>
			</tr>

			<tr>
				<td>2222</td>
				<td><a href="#" class="txt_conn">제목<b lass="new">new</b></a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>

			<tr>
				<td>3333</td>
				<td><a href="#" class="txt_conn">제목<b lass="new">new</b></a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>

			<tr>
				<td>4444</td>
				<td><a href="#" class="txt_conn">제목<b lass="new">new</b></a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>

			<tr>
				<td>5555</td>
				<td><a href="#" class="txt_conn">제목<b lass="new">new</b></a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>

			<tr>
				<td>6666</td>
				<td><a href="#" class="txt_conn">제목<b lass="new">new</b></a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>

			<tr>
				<td>7777</td>
				<td><a href="#" class="txt_conn">제목</a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>

			<tr>
				<td>8888</td>
				<td><a href="#" class="txt_conn">제목</a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>

			<tr>
				<td>9999</td>
				<td><a href="#" class="txt_conn">제목</a></td>
				<td>작성자</td>
				<td>20.03.17</td>
				<td>0</td>
			</tr>		
		</table>

<!-- 		<div class="search">
			<span>제목+내용</span>
			<input type="text" placeholder="검색어" name="" class="">
			<button>검색</button>
		</div> -->


		
		<div class="page">
			<button class="page_btn hover_btn"><</button>	
				<a href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
			<button class="page_btn hover_btn">></button>	
		</div>

</body>
</html>