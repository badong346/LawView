<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>


<style>
* {
	font-weight: 100;
	box-sizing: border-box;
}

/* 전체 틀 설정 (header, contents, footer영역) */
.container {
	width: 100%;
	margin: auto;
}

.header { /*맨위 고정메뉴*/
	position: fixed;
	width: 100%;
	z-index: 5;
	background-color: white;
	margin: 0px;
	width: 100%;
	line-height: 70px;
	padding: 10px;
}

.contents {
	position: relative;
	top: 100px;
	margin: auto;
}

.footer {
	position: relative;
	top: 170px;
	width: 100%;
	margin: auto;
}

/* header 영역 설정 */
.q_menu_btn {
	text-align: left;
	padding-top: 10px;
} /*퀵메뉴 버튼*/
.quickBtn {
	border: 0px solid white;
	background-color: white;
	width: 50px;
	height: 50px;
}

.quickLine {
	border-bottom: 3px solid #f56a6a;
	padding: 3px;
}

.logo {
	width: 150px;
}

.navi {
	padding: 0px;
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
	color: #f9a5a5;
}

/* 검색창 영역 */
.input-group {
	height: 50px;
	margin-bottom: 0;
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

.drop_btn {
	width: 25px;
	height: 25px;
	position: absolute;
	z-index: 10;
	right: 80px;
	top: 12px;
	border: 0px;
	background-color: white;
	color: #f56a6a;
}

.d1 {
	display: block;
}

.d2 {
	display: none;
}

/* 검색조건 영역 */
.list-group-flush {
	display: none;
	position: absolute;
	width: 85%;
	z-index: 20;
	border: 2px solid lightgray;
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
	color: black;
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
	margin: auto;
}

.board>.list-group>li>a {
	text-decoration: none;
	color: black;
	text-align: left;
}

.badge {
	background-color: #f56a6a;
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
.footer {
	padding: 0;
}

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

.q_b_line { /*메뉴,로그인 나누는 굵은 회색줄*/
	border: 1px solid lightgray;
	width: 200px;
	position: relative;
	left: 20px;
	top: 30px;
	display: none;
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

.quick_menu>li>a:hover {
	color: darkgray;
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

/* 메인 이미지 영역 */
.main_text1 {
	text-align: left;
	font-size: 45px;
	font-weight: 600;
	position: absolute;
	padding-top: 100px;
	padding-left: 50px;
	z-index: 1;
}

.main_text2 {
	text-align: left;
	font-size: 20px;
	position: absolute;
	padding-top: 260px;
	padding-left: 50px;
	z-index: 1;
}

.main_img {
	width: 100%;
}

.input-group {
	margin-top: 50px;
}

.search {
	margin-bottom: 30px;
	text-align: left;
}

body {
	background: #f4f7f7;
}

.keyword-list, .law-list, .prec-list {
	background: white;
	padding: 40px;
	border-radius: 20px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.navi {
	text-align: center;
}

.list-navi {
	width: 100%;
	text-align: center;
	margin-top: 50px;
}

.list-navi>ul {
	padding: 0px;
}

.list-navi li {
	display: inline-block;
	list-style: none;
	padding: 15px;
	padding-bottom: 5px;
	font-size: 30px;
	font-weight: 100;
	font-size: 30px;
}

.list-navi li>button {
	background: none;
	border: none;
}

.keyword, .law, .prec {
	text-align: center;
}

.keyword-list>.col, .law-list>.col, .prec-list>.col {
	margin-top: 10px;
}
</style>
<script>
	function fnMove(section) {
		var offset = $("." + section).offset();
		$('html, body').animate({
			scrollTop : offset.top
		}, 400);
	}
	
	$(function(){
		
		$(".navi").on("click", function(){
			
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
			<!--   quickmenu 넣기-->
			<button class=quickBtn>
				<div class=quickLine></div>
				<div class=quickLine></div>
				<div class=quickLine></div>
			</button>

		</div>

		<!-- quick menu -->
		<div class="quickmenu" id="quickmenu">
			<div id=q_back>
				<img src="resources/image/back.png" id=back_arrow>
			</div>

			<div class=quick_title>
				Menu
				<div class=q_line></div>
			</div>
			<div class=quick_menu>
				<li><a href=search.jsp>법률검색</a>
					<div class=q_m_line></div></li>
				<li><a href=board.req>의뢰하기</a>
					<div class=q_m_line></div></li>
				<li><a href=toProfileList.profile>변호사</a>
					<div class=q_m_line></div></li>
				<li><a href=faqlist.question>Q&A</a></li>
			</div>
			<div class=q_b_line></div>
			<div class=quick_title>
				Login
				<div class=q_line></div>
			</div>
			<div class=quick_menu>
				<li><a href=login.jsp>로그인</a>
					<div class=q_m_line></div></li>
				<li><a href=mypage.jsp>마이페이지</a></li>
			</div>
		</div>

		<div class="logo col-2 col-md-3 col-lg-2">
			<a href=main.jsp><img src="resources/image/logo2.png"
				class="logo"></a>
		</div>

		<div class="navi col-9 col-lg-10 d-md-block d-none">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active" href=search.jsp>법률
						검색</a></li>
				<li class="nav-item"><a class="nav-link" href=board.req>의뢰하기</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href=toProfileList.profile>변호사</a></li>
				<li class="nav-item"><a class="nav-link"
					href="faqlist.question">Q&A</a></li>
				<li class="nav-item"><a class="nav-link" href=login.jsp>Login</a>
				</li>
			</ul>
		</div>

	</div>

	<div class=container>

		<!-- contents 영역 (여기에 각자 컨텐츠들 넣으시면 되요) -->
		<div class=contents>

			<div class="row search-list">

				<c:if test="${searchKeyword }">

					<div class="list-navi keyword-section">
						<ul>
							<c:if test="${searchKeyword }">
								<li><button style="border-bottom: 2px solid #f56a6a;">키워드
										관련</button></li>
							</c:if>
							<c:if test="${searchLaw}">
								<li><button onclick="fnMove('law-section')">이름 내
										검색</button></li>
							</c:if>
							<c:if test="${searchPrec}">
								<li><button onclick="fnMove('prec-section')">판례</button></li>
							</c:if>
						</ul>
					</div>

					<div class="row keyword-list">

						<c:choose>
							<c:when test="${keywordTotal ne '0'}">
								<div class="col col-12 keywordtotal">
									총<b> ${keywordTotal } 건</b>
								</div>

								<c:forEach var="i" items="${categories }">
									<div class="col col-12 category">
										<b>${i.key }</b>
									</div>
									<c:forEach var="j" items="${i.value }">
										<div class="col col-12 caption">${j.key }</div>
										<c:forEach var="law" items="${j.value }">
											<div class="col col-12 col-lg-8 lawname">
												<a href="loading.search?lawId=${law.lawId }">${law.lawName }</a>
											</div>
											<div
												class="col d-none d-lg-block col-4 col-xl-2 keyword lawtype">${law.lawType }</div>
											<div class="col d-none d-xl-block col-1 keyword lawdate">${law.lawDate }</div>
											<div class="col d-none d-xl-block col-1 keyword lawactdate">${law.lawActDate }</div>
										</c:forEach>
									</c:forEach>

								</c:forEach>

							</c:when>

							<c:otherwise>
								<div class="col col-12 prectotal">
									<b>검색 결과 없음</b>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</c:if>


				<c:if test="${searchLaw}">

					<div class="list-navi law-section">
						<ul>
							<c:if test="${searchKeyword}">
								<li><button onclick="fnMove('keyword-section')">키워드
										관련</button></li>
							</c:if>
							<c:if test="${searchLaw}">
								<li><button style="border-bottom: 2px solid #f56a6a;"
										onclick="fnMove('law-section')">이름 내 검색</button></li>
							</c:if>
							<c:if test="${searchPrec}">
								<li><button onclick="fnMove('prec-section')">판례</button></li>
							</c:if>
						</ul>
					</div>



					<div class="row law-list">



						<c:choose>
							<c:when test="${lawTotal ne '0'}">

								<div class="col col-12 lawtotal">
									총<b> ${lawTotal } 건</b>
								</div>

								<div class="col col-8 col-lg-6 law lawname">
									<b>법령 이름</b>
								</div>
								<div class="col col-4 col-lg-2 law lawtype">
									<b>법령 종류</b>
								</div>
								<div class="col d-none d-lg-block col-2 law lawdate">
									<b>공포일자</b>
								</div>
								<div class="col d-none d-lg-block col-2 law lawactdate">
									<b>시행일자</b>
								</div>

								<c:forEach var="i" items="${lawlist }">
									<!-- <div class="col col-1 lawno">${i.lawNo }</div> -->
									<div class="col col-8 col-lg-6 lawname">
										<a href="readLaw.search?lawId=${i.lawId }">${i.lawName }</a>
									</div>
									<div class="col col-4 col-lg-2 law lawtype">${i.lawType }</div>
									<div class="col col-2 d-none d-lg-block law lawdate">${i.lawDate }</div>
									<div class="col col-2 d-none d-lg-block law lawactdate">${i.lawActDate }</div>
								</c:forEach>

								<div class="col col-12 navi">${lawNavi }</div>
							</c:when>

							<c:otherwise>
								<div class="col col-12 lawtotal">
									<b>검색 결과 없음</b>
								</div>
							</c:otherwise>
						</c:choose>
					</div>


				</c:if>


				<c:if test="${searchPrec }">

					<div class="list-navi prec-section">
						<ul>
							<c:if test="${searchKeyword}">
								<li><button onclick="fnMove('keyword-section')">키워드
										관련</button></li>
							</c:if>
							<c:if test="${searchLaw}">
								<li><button onclick="fnMove('law-section')">이름 내
										검색</button></li>
							</c:if>
							<c:if test="${searchPrec}">
								<li><button style="border-bottom: 2px solid #f56a6a;"
										onclick="fnMove('prec-section')">판례</button></li>
							</c:if>
						</ul>
					</div>



					<div class="row prec-list">

						<c:choose>
							<c:when test="${precTotal ne '0'}">

								<div class="col col-12 prectotal">
									총<b> ${precTotal } 건</b>
								</div>
								<!--  <div class="col col-1 precno">
						<b>번호</b>
					</div>-->
								<div class="col col-6 prec precname">
									<b>판례 제목</b>
								</div>
								<div class="col col-3 col-md-2 prec preccourt">
									<b>법원명</b>
								</div>
								<div class="col col-3 col-md-2 prec prectype">
									<b>사건 유형</b>
								</div>
								<div class="col d-none d-md-block col-2 prec precdate">
									<b>선고일</b>
								</div>

								<c:forEach var="i" items="${preclist }">
									<!-- <div class="col col-1 precno">${i.precNo }</div> -->
									<div class="col col-6 precname">
										<a href="readPrec.search?precId=${i.precId}">${i.precName }</a>
									</div>
									<div class="col col-3 col-md-2 prec preccourt">${i.precCourt }</div>
									<div class="col col-3 col-md-2 prec prectype">${i.precType }</div>
									<div class="col d-none d-md-block col-2 prec precdate">${i.precDate }</div>
								</c:forEach>

								<div class="col col-12 navi">${precNavi }</div>
							</c:when>
							<c:otherwise>
								<div class="col col-12 lawtotal">
									<b>검색 결과 없음</b>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

				</c:if>

			</div>
		</div>
	</div>
</body>
</html>