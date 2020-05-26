<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

<style>
* {
	box-sizing: border-box;
	text-align: center;
}

/* 전체 틀3개 설정 (header, contents, footer영역) */
.header { /* 맨위 고정메뉴 */
	position: fixed;
	width: 100%;
	z-index: 5;
	background-color: white;
	margin: 0px;
}

.contents {
	text-align: center;
	position: relative;
	top: 120px;
	margin: auto;
}

.footer {
	position: relative;
	top: 170px;
}

/* header 영역 설정 */
.q_menu_btn {
	text-align: left;
	padding-top: 10px;
}

.quickBtn {
	border: 0px solid white;
	background-color: white;
	width: 50px;
	height: 50px;
}

.quickLine {
	border-bottom: 3px solid black;
	padding: 3px;
}

.logo {
	width: 200px;
	padding-top: 10px;
}

.nav {
	height: 100%;
}

.nav-item {
	line-height: 60px;
}

.nav-link {
	font-size: 18px;
	font-weight: 600;
	color: #f56a6a;
}

.nav-link:hover {
	color: lightsalmon;
}

/* 검색조건 영역 */
.input-group {
	height: 50px;
}

.input {
	text-align: left;
	height: 100%;
	border: 2px solid #f56a6a;
}

#button-addon2 {
	background-color: #f56a6a;
	color: white;
	border: none;
}

.input:active>.list-group-flush {
	display: block;
}

.list-group-item {
	text-align: left;
}

.list-title {
	font-weight: 600;
}

/* contents영역 설정들 */
.head { /* 컨텐츠 각 레이아웃 제목 */
	font-size: 20px;
	font-weight: 600;
	color: #5D007D;
}

.title_redbar { /* 컨텐츠 각 레이아웃 제목 빨간 밑줄*/
	border-bottom: 5px solid #f56a6a;
	width: 150px;
	height: 50px;
	margin: auto;
	font-weight: 600;
	font-size: 20px;
	line-height: 50px;
}

/* contents - 카테고리 영역*/
.categories {
	margin: auto;
}

.title {
	font-size: 20px;
	font-weight: 600;
	color: #1a1943;
}

.category {
	width: 130px;
}

.text_category {
	font-size: 20px;
	font-weight: 600;
	height: 50px;
	line-height: 50px;
}

/* contents - 의뢰게시판 */
.advice {
	width: 550px;
	margin: auto;
}

.board>.list-group>li>a {
	text-decoration: none;
	color: black;
	text-align: left;
}

.badge {
	background-color: hotpink;
	color: white;
} /* new게시글 뱃지*/

/* contents - 변호사 프로필 카드 */
.card {
	margin: auto;
	width: 400px;
}

.card-title {
	font-weight: 600;
	text-align: left;
}

.card-text {
	font-size: 15px;
	text-align: left;
}

.card-img {
	width: 120px;
}

/* footer 영역 */
.sponser {
	border: 1px solid lightgray;
}

.info1, .info3 {
	text-align: left;
}

.info2, .info4 {
	text-align: right;
}

.doosancompany {
	width: 100px;
}

.linklogo {
	width: 30px;
}

.infotext {
	font-size: 13px;
	color: gray;
}

.info2>a {
	color: black;
}

/* 여기부터 퀵메뉴 사이드바 설정 */
.quickmenu {
	width: 230px;
	height: 100%;
	background-color: #f5f5f5;
	text-align: center;
	position: fixed;
	z-index: 10;
	top: 0px;
	left: -230px; /*퀵메뉴 위치*/
	transition-duration: 0.5s;
}

.quick_title { /*사이드바 Menu title 부분*/
	color: black;
	font-size: 20px;
	font-weight: 600;
	text-align: left;
	padding-top: 70px;
	padding-left: 30px;
}

.q_line { /* Menu 밑에 빨간줄 */
	border-bottom: 3px solid #f56a6a;
	width: 60px;
}

.quick_menu {
	padding-top: 10px;
}

.quick_menu>li {
	position: relative;
	width: 100%;
	height: 50px;
	list-style-type: none;
	padding-left: 30px;
}

.q_m_line { /*사이드메뉴 나누는 회색줄*/
	border: 0.5px solid lightgray;
	width: 150px;
}

.quick_menu>li>a { /* 사이드바 메뉴 글씨 */
	position: relative;
	text-decoration: none;
	color: dimgray;
	display: block;
	width: 100%;
	height: 100%;
	line-height: 50px;
	text-align: left;
}

#q_back:hover {
	cursor: pointer;
} /* 사이드바 닫는 화살표 */
#q_back {
	margin-left: 170px;
	margin-top: 10px;
	font-size: 30px;
	font-weight: 600;
	width: 50px;
	height: 50px;
	position: fixed;
}

#back_arrow {
	width: 30px;
	height: 30px;
	z-index: 20;
} /*화살표 이미지설정*/
</style>


<script>
            $(function(){
                $("#q_menu_btn").on("click", function(){
                    $("#quickmenu").css("transform", "translate(100%, 0px)");
                })
                $("#q_back").on("click", function(){
                    $(this).parent().css("transform", "translate(-100%, 0px)");
                    $(this).parent().css("transition-duration", "1s");
                })
                
            })
        </script>
</head>



<body>

	<!-- header 영역 (맨위에 메뉴바) -->
	<div class="row header">

		<!-- quick menu 버튼 -->
		<div class="q_menu_btn col-2 col-sm-1 col-md-0 d-md-none d-block"
			id=q_menu_btn>
			<!--                quickmenu 넣기-->
			<button class=quickBtn>
				<div class=quickLine></div>
				<div class=quickLine></div>
				<div class=quickLine></div>
			</button>

		</div>

		<!-- quick menu -->
		<div class="quickmenu" id="quickmenu">
			<div id=q_back>
				<img src="back.png" id=back_arrow>
			</div>

			<div class=quick_title>
				Menu
				<div class=q_line></div>
			</div>
			<div class=quick_menu>
				<li><a href=#>법률검색</a>
				<div class=q_m_line></div></li>
				<li><a href=#>의뢰하기</a>
				<div class=q_m_line></div></li>
				<li><a href=#>변호사</a></li>
			</div>
		</div>

		<div class="logo col-2 col-md-3 col-lg-2">
			<img src="lawview.jpg" class="logo">
		</div>

		<div class="navi col-9 col-lg-10 d-md-block d-none">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active" href="#">법률
						검색</a></li>
				<li class="nav-item"><a class="nav-link" href="#">의뢰하기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">변호사</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
			</ul>
		</div>

	</div>



	<!-- contents 영역 (여기에 각자 컨텐츠들 넣으시면 되요) -->
	<div class=contents>


		<!--  검색창 영역  -->
		<form action="list.search" method=get>
			<div class="row search">
				<div class=col-2></div>
				<div class=col-8>
					<div class="input-group mb-3">
						<input type="text" class="form-control input"
							placeholder="키워드를 입력하세요." aria-label="Recipient's username"
							aria-describedby="button-addon2" name="query">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2">Search</button>
						</div>
					</div>
					<!--검색조건 부분 주석처리 해놓음-->
					
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item list-title">검색 조건</li>
                        <li class="list-group-item"><input type="checkbox" name="checkSection" value="check-keyword"> 키워드 관련 검색</li>
                        <li class="list-group-item"><input type="checkbox" name="checkSection" value="check-law"> 이름 내 검색</li>
                        <li class="list-group-item"><input type="checkbox" name="checkSection" value="check-prec"> 판례</li>
                        <li class="list-group-item">
                        	<input type="checkbox" name="check" value="check-date"> 법령 공포 일자
                        	<input type="date" name="dates"> ~
                        	<input type="date" name="dates">
                        	<span>  미 선택 시, 전체 날짜로 검색</span>
                        </li>
                        <li class="list-group-item">
                        	<input type="checkbox" name="check" value="check-actdate"> 법령 시행 일자
                        	<input type="date" name="actdates"> ~
                        	<input type="date" name="actdates">
                        	<span>  미 선택 시, 전체 날짜로 검색</span>
                        </li>
                        <li class="list-group-item">
                        	<input type="checkbox" name="check" value="check-actdate"> 판례 선고 일자
                        	<input type="date" name="sendates"> ~
                        	<input type="date" name="sendates">
                        	<span>  미 선택 시, 전체 날짜로 검색</span>
                        </li>	
                    </ul>

				</div>
				<div class=col-lg-2></div>
			</div>
		</form>


		<!--    main 슬라이드 그림     -->
		<div class=row>
			<br>
			<br>
			<br>
			<div class=col-0></div>
			<!-- 양옆 공백 (일단 0)-->
			<div class=col-12>
				<div id="carouselExampleCaptions" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleCaptions" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="메인캡처.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="메인캡처.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="메인캡처.png" class="d-block w-100" alt="...">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleCaptions"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
					<div class=col-12>
						<br>
					</div>
					<!-- 밑에쪽에 <br> 공백 -->
				</div>
			</div>
			<div class=col-0></div>
			<!-- 양옆 공백 (일단 0)-->
		</div>


		<!--  카테고리 영역-->
		<div class="title_redbar">카테고리</div>
		<div class="row categories">
			<div class="col-12">
				<br>
			</div>

			<div class="col-3">
				<img src="heart.png" class=category>
				<div class="text_category">이혼</div>
			</div>
			<div class="col-3">
				<img src="heart.png" class=category>
				<div class="text_category">교통사고</div>
			</div>
			<div class="col-3">
				<img src="heart.png" class=category>
				<div class="text_category">폭행</div>
			</div>
			<div class="col-3">
				<img src="heart.png" class=category>
				<div class="text_category">금융</div>
			</div>

			<div class="col-sm-12 col-md-12 col-lg-12 text">
				<!-- 아래쪽에 <br>공백 -->
				<br>
				<br>
				<br>
				<br>
			</div>
		</div>


		<!--  게시판 영역-->
		<div class="row">

			<!--   의뢰 게시판  -->
			<div class="col-sm-12 col-md-6 col-lg-6 one board layout">
				<div class=head>
					<br>의뢰게시판
				</div>
				<br>

				<ul class="list-group advice">
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href=# class=newses>이혼했어요. 어떻게 해야 하죠?</a> <span class="badge">new</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href=#>교통사고가 났어요. 처리하는 방법</a> <span class="badge">new</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href=#>폭행 시비에 휘말렸어요. 도와주세요.</a>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href=#>이혼했어요. 어떻게 해야 하죠?</a>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href=#>교통사고가 났어요. 처리하는 방법</a>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						<a href=#>폭행 시비에 휘말렸어요. 도와주세요.</a>
					</li>
				</ul>
			</div>

			<!--     변호사 게시판    -->
			<div class="col-sm-12 col-md-6 col-lg-6 one news layout">
				<div class=head>
					<br>변호사
				</div>
				<br>

				<div class="card mb-3" style="max-width: 540px;">
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="lawer1.jpg" class="card-img" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">김이나 변호사</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
							</div>
						</div>
					</div>
				</div>

				<div class="card mb-3" style="max-width: 540px;">
					<div class="row no-gutters">
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">최충연 변호사</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
							</div>
						</div>
						<div class="col-md-4">
							<img src="lawer2.jpg" class="card-img" alt="...">
						</div>

					</div>
				</div>

			</div>

			<div class=col-12>
				<br>
				<br>
				<br>
				<br>
			</div>
			<!-- 아래쪽에 <br>공백 -->

		</div>
		<!--       컨텐츠 영역 끝        -->



		<!--    슬라이드 그림     -->
		<div class=row>
			<div class=col-1></div>
			<div class=col-9>
				<div id="carouselExampleCaptions" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleCaptions" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="로톡캡처.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="로톡캡처.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="로톡캡처.png" class="d-block w-100" alt="...">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleCaptions"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
					<div class=col-12>
						<br>
						<br>
						<br>
						<br>
					</div>
				</div>
			</div>
			<div class=col-1></div>
		</div>


	</div>






	<!--     footer 영역      -->
	<div class="row footer">
		<div class="col-12 sponser"></div>
		<div class="col-12 col-md-5 info1 infotext">
			<br>Copyrightⓒ 2019 Doosan Bears Inc. All Rights Reserved.
		</div>
		<div class="col-12 col-md-7 info2 infotext">
			<br> <a href=#>이용약관 </a>| <a href=#> 개인정보처리방침 </a>| <a href=#>
				이메일주소 무단수집 거부 </a>| <a href=#> 정도경영 사이버신문고 </a>| <a href=#> 영상정보처리기기
				운영관리 방침 </a>|
		</div>
		<div class="col-12 col-md-6 info3 infotext">
			<br> <img src="lawview.jpg" class="doosancompany">
			DOOSANBEARS is operated by DOOSAN BEARS Inc.<br>
			<br> <a href=#><img src="facebook.jpg" class="linklogo"></a>
			<a href=#><img src="twitter.jpg" class="linklogo"></a> <a
				href=#><img src="instagram.png" class="linklogo"></a> <a
				href=#><img src="youtube.png" class="linklogo"></a>
		</div>
		<div class="col-12 col-md-6 info4 infotext">
			<br>사업자 등록번호 : 107-81-13241 대표자 성명 : 전풍<br> 사업자주소 : 서울특별시
			송파구 올림픽로 25 잠실야구장내 두산베어스<br> 연락처 : 02-2240-1777 통신판매허가번호 : 서울시
			송파구청 제 1775호
		</div>
	</div>



</body>
</html>