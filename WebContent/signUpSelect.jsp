<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
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
<script src="https://kit.fontawesome.com/d2a27edcf3.js"
	crossorigin="anonymous"></script>

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

/*            contents영역*/
.container {
	width: 800px;
	padding: 0;
}

.container .contentsHeader {
	height: 140px;
	background-color: #f56a6a;
	margin-left: 24px;
	margin-right: 24px;
	color: white;
}

.container .contents {
	margin: 0
}

.container .footer {
	height: 160px;
	line-height: 160px;
}

.contents .fas {
	font-size: 200px;
}

.container .customer, .lawyer {
	margin-top: 50px;
	margin-bottom: 50px;
}

.container .backcolor {
	padding-top: 40px;
	padding-bottom: 40px;
	margin-left: 10px;
	margin-right: 10px;
	background-color: gainsboro
}

.container .button {
	font-size: 20px;
	background-color: #f56a6a;
	border: 0;
	color: white
}

.container .button:hover {
	background-color: white;
	color: black
}
</style>


<script>
	$(function() {
		$("#q_menu_btn").on("click", function() {
			$("#quickmenu").css("transform", "translate(100%, 0px)");
		})
		$("#q_back").on("click", function() {
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
		<form action="signUpSelect.signUp" method="post">
			<div class="container">
				<div class="header-container">
					<div class="contentsHeader">
						<br>
						<h5>LawView</h5>
						<br>회원가입
					</div>
				</div>
				<div class="contents row">
					<div class="user col-12 col-md-6">
						<div class="customer">
							<div class="backcolor">
								<i class="fas fa-user-alt"></i><br>
								<br>
								<br> <input type="submit" name="signUpSelectB" value="의뢰인 회원가입" class="button">
							</div>
						</div>
					</div>
					<div class="user col-12 col-md-6">
						<div class="lawyer">
							<div class="backcolor">
								<i class="fas fa-balance-scale lawyer-icon"></i><br>
								<br>
								<br> <input type="submit" name="signUpSelectB" value="변호사 회원가입" class="button">
							</div>
						</div>
					</div>
				</div>
				<div class="footer">
					<a href="#">로그인</a> | <a href="#">변호사 가입안내</a>
				</div>
			</div>
		</form>

		<div class=col-12>
			<br>
			<br>
			<br>
			<br>
		</div>
		<!-- 아래쪽에 <br>공백 -->

	</div>
	<!--       컨텐츠 영역 끝        -->






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