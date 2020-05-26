<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>clientMyPage</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
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
.row_footer {
	width: 100%;
}

.sponser {
	border: 1px solid lightgray;
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
}

#back_arrow {
	width: 30px;
	height: 30px;
	z-index: 20;
} /*화살표 이미지설정*/

/*게시판 부분 디자인*/
.container2 {
	border-radius: 3px;
	background-color: #f4f5f9;
	color: #252c41;
	text-align: center;
	border: 1px solid #dddfe6;
	width: 70%;
	margin: auto;
	position: relative;
	margin-top: 50px;
}

.cboard {
	border-top: 1px solid #8F94A6;
	padding: 0;
	margin: 0;
}

/* 예지수정 */
.pop-menu {
	position: absolute;
	right: 20px;
	display: none;
}

.my-item:hover .pop-menu {
	display: block;
}

#left {
	width: 5%
}

#right {
	width: 95%
}

.maincon {
	float: left
}

.side_menu>li {
	width: 120px;
}

/* 창현수정 */
.sidebar {
	margin-left: 150px;
	margin-top: 150px;
	width: 150px;
	height: 150px;
	background-color: white;
	float: left;
	position: absolute;
}

.sidebar>div {
	text-align: center;
	width: 100%;
	height: 25%;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #777;
}

.sidebar>div>a {
	line-height: 35px;
	text-decoration: none;
	display: block;
	width: 100%;
	height: 100%;
	color: #777;
}

.sidebar>div>a:hover {
	color: black;
	font-size: 17px;
}

.sidebar>div>a>span:hover {
	color: black;
}

span {
	color: #777;
	font-size: 12px;
	bottom: 68px;
}

.main {
	height: 700px;
	width: 1000px;
	margin: auto;
	margin-top: 100px;
}

.bar {
	border: 1px solid black;
}

table {
	width: 100%;
	height: 200px;
	color: #777;
	font-size: 12px;
	margin: auto;
}

.A {
	width: 20%;
	background-color: #F6F6F6;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: darkgray;
	text-align: center;
}

.contents {
	text-align: left;
	position: relative;
	top: 120px;
	margin: auto;
}

.footer {
	position: relative;
	top: 170px;
}

#buttons {
	text-align: center;
}
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

                    $(".drop_btn").on("click", function(){
                        $(".list-group-flush").css("display", "block");
                        $(".d1").css("display", "none");
                        $(".d2").css("display", "block");
                    })
                    $(".list-group-flush").focusout(function(){
                        $(".list-group-flush").css("display", "none");
                        $(".d1").css("display", "block");
                        $(".d2").css("display", "none");
                    })
                    $(".d2").on("click", function(){
                        $(".list-group-flush").css("display", "none");
                        $(".d1").css("display", "block");
                        $(".d2").css("display", "none");
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
				<c:choose>
					<c:when
						test="${empty sessionScope.clientInfo && empty sessionScope.lawyerInfo}">
						<li><a href=login.jsp>로그인</a>
							<div class=q_m_line></div></li>
					</c:when>
					<c:otherwise>
						<li><a href="logout.login">로그아웃</a>
							<div class=q_m_line></div></li>
						<li><a href="go.mypage">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="logo col-2 col-md-3 col-lg-2">
			<a href=main.jsp><img src="resources/image/lawview.jpg"
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
				<!-- 예지수정 ( 클래스명 추가 )  -->
				<li class="nav-item my-item"><a class="nav-link" href="#">
						My </a>
					<div class='pop-menu'>
						<c:choose>
							<c:when
								test="${empty sessionScope.clientInfo && empty sessionScope.lawyerInfo}">
								<a class='nav-link' href="login.jsp">login</a>
							</c:when>
							<c:otherwise>
								<a class='nav-link' href="logout.login">logout</a>
								<a class='nav-link' href="go.mypage">MyPage</a>
							</c:otherwise>
						</c:choose>
					</div></li>
			</ul>
		</div>

	</div>



	<!-- contents 영역 (여기에 각자 컨텐츠들 넣으시면 되요) -->
	<!-- 창현 수정-->
	<div class=contents>
		<div class="sidebar col-md- d-none d-md-block">
			<div style="border-bottom-width: 2px;">
				<a href="#"><b>마이페이지</b></a>
			</div>
			<br>
			<div>
				<a href="#"><span>내정보</span></a>
			</div>
			<div>
				<a href="#"><span>내가 쓴 의뢰글</span></a>
			</div>
			<div>
				<a href="#"><span>예약신청 목록</span></a>
			</div>
		</div>

		<div id='right' class='maincon'>
			<div id="signUp">
				<!-- 수정부분 메인 회원정보-->
				<form action="clientModidel.mypage" method="post" id="frm">
					<div class="main">
						<div class="subject">
							<div style="font-size: 30px;">
								<b>마이페이지</b>
							</div>
						</div>
						<br>
						<p class="subject_comment" style="font-size: 13px; color: #777;">반갑습니다.
							LAW VIEW에 오신걸 환영합니다</p>
						<div style="font-size: 12px; color: #777;">로그인한 회원아이디</div>
						<br>
						<div id="mypage">
							<br>

							<p class="sub_title" style="font-size: 18px;">
								<b>기본회원정보</b>
							</p>

							<div class="bar"></div>

							<br> <br>
							<table class="btw">
								<tr class="form-group">
									<td class="A">이름:</td>
									<td class="B"><input type="text" class="form-control"
										id="name" name="name" aria-describedby="nameHelp"
										placeholder="한글" readonly value="${cdto.name}"> <small
										id="nameHelp" class="form-text text-muted regex"></small></td>

								</tr>
								<tr class="form-group">
									<td class="A">이메일 :</td>
									<td class="B"><input type="email" class="form-control"
										id="email" name="email" aria-describedby="emailHelp"
										placeholder="name@example.com" readonly value="${cdto.email}">
										<small id="emailHelp" class="form-text text-muted regex"></small>
									</td>

								</tr>
								<tr class="form-group">
									<td class="A">전화번호 :</td>
									<td class="B"><input type="text" class="form-control"
										id="phone" name="phone" aria-describedby="phoneHelp"
										placeholder="-제외한 숫자 9~11 자리수" readonly value="${cdto.phone}">
										<small id="phoneHelp" class="form-text text-muted regex"></small>
									</td>

								</tr>
								<tr class="form-group">
									<td class="A">생년월일:</td>
									<td class="B"><input type="text" class="form-control"
										id="birth" name="birth" aria-describedby="birthHelp"
										placeholder="8 자리수 ex)20200514" readonly value="${cdto.birth}">
										<small id="birthHelp" class="form-text text-muted regex"></small>
									</td>

								</tr>
								<tr class="form-group pwform">
									<td class="A">비밀번호 :</td>
									<td class="B"><input type="text" class="form-control"
										id="pw" name="pw" placeholder="8~16자 단어(영대문자 숫자 언더바 포함)"
										readonly></td>
								</tr>
								<tr class="form-group pwform">
									<td class="A">비밀번호 확인 :</td>
									<td class="B"><input type="text" class="form-control"
										id="pwConfirm" name="poConfirm"></td>
								</tr>



							</table>
							<!-- 수정부분 메인 회원정보-->
							<br> <br> <br> <br> <br>



						</div>
						<div id="buttons">
							<input type="button" id="clientModify" class="btn btn-primary"
								value="정보수정"> <input type="submit" id='modi_del'
								name="modi_del" class="btn btn-primary" value="정보수정 완료">
							<input type="button" id="delete" name="modi_del"
								class="btn btn-primary" value="회원탈퇴">
						</div>

					</div>
				</form>
				<!-- 수정부분 게시판-->
			</div>

			<div class=col-12>

				<br>
			</div>

			<div class="container2">
				<div class="row">
					<div class="col-12" align=center>
						<b class=p-10>내가 쓴 의뢰글</b>
					</div>
				</div>
				<div class="row">
					<div class="col-md-1 col-sm-2 col-2 reqlist">
						<b>No</b>
					</div>
					<div class="col-md-8 col-sm-8 col-8 reqlist">
						<b>Title</b>
					</div>
					<div class="col-md-2 col-sm-2 col-2 reqlist">
						<b>Date</b>
					</div>
					<div class="col-md-1 d-none d-md-block reqlist">
						<b>View</b>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty clist}">
						<div class="row cboard">
							<div class="col-12" align=center>글이 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" items="${clist}">
							<div class="row cboard">
								<div class="col-md-1 col-sm-2 col-2 reqlist">${i.seq}</div>
								<div class="col-md-8 col-sm-8 col-8 reqlist" align=center>
									<a href="">${i.title}</a>
								</div>
								<div class="col-md-2 col-sm-2 col-2 reqlist" align=center>${i.sdate}</div>
								<div class="col-md-1 d-none d-md-block reqlist" align=center>${i.view_count}</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="container2">
				<div class="row">
					<div class="col-12" align=center>
						<b class=p-10>예약 신청 목록</b>
					</div>
				</div>
				<div class="row">
					<div class="col-4 R_list">
						<b>날짜</b>
					</div>
					<div class="col-4 R_list">
						<b>시간</b>
					</div>
					<div class="col-4 R_list">
						<b>변호사 이름</b>
					</div>
					<div class="col-4 R_list">
						<b>승인여부</b>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty reserveList}">
						<div class="row cboard">
							<div class="col-12" align=center>예약이 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" items="${reserveList}">
							<div class="row cboard">
								<div class="col-4 R_list">${i.date}</div>
								<div class="col-4 R_list" align=center>
									<a href="">${i.time}</a>
								</div>
								<div class="col-4 R_list" align=center>${i.sdate}</div>
								<div class="col-4 R_list" align=center>
									<c:choose>
										<c:when test="${i.approved == 'true'} ">
											<span class="badge badge-primary">승인</span>
										</c:when>
										<c:otherwise>
											<span class="badge badge-secondary">미승인</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<!-- 수정부분 게시판-->

			</div>
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>

		<!-- footer 영역 -->
		<div class="row_footer">

			<div class="col-12 col-md-5 info1 infotext">
				<br>Copyrightⓒ 2019 Doosan Bears Inc. All Rights Reserved.
			</div>
			<div class="col-12 col-md-7 info2 infotext">
				<br> <a href=#>이용약관 </a>| <a href=#> 개인정보처리방침 </a>| <a href=#>
					이메일주소 무단수집 거부 </a>| <a href=#> 정도경영 사이버신문고 </a>| <a href=#>
					영상정보처리기기 운영관리 방침 </a>|
			</div>
			<div class="col-12 col-md-6 info3 infotext">
				<br> <img src="lawview.jpg" class="doosancompany">
				DOOSANBEARS is operated by DOOSAN BEARS Inc.<br> <br> <a
					href=#><img src="facebook.jpg" class="linklogo"></a> <a
					href=#><img src="twitter.jpg" class="linklogo"></a> <a href=#><img
					src="instagram.png" class="linklogo"></a> <a href=#><img
					src="youtube.png" class="linklogo"></a>
			</div>
			<div class="col-12 col-md-6 info4 infotext">
				<br>사업자 등록번호 : 107-81-13241 대표자 성명 : 전풍<br> 사업자주소 : 서울특별시
				송파구 올림픽로 25 잠실야구장내 두산베어스<br> 연락처 : 02-2240-1777 통신판매허가번호 : 서울시
				송파구청 제 1775호
			</div>
		</div>




	</div>




	<!--       컨텐츠 영역 끝        -->
	<script>
        	$(function(){
        		$("#delete").on("click", function(){        			
        			location.href="clientDelete.mypage";	
        		})
        	})
        	
        	$(function(){
        		$("#clientModify").on("click",function(){
        			window.open("cpwDuplCheckview.jsp","","width=500, height=500");
        		})
        	})
        <script>
        //id체크
        	$(function(){
                    $("#idDuplCheck").on("click",function(){
                    	$.ajax({
            				url : "idDuplCheck.signUp",
            				type : "post",
            				data : {id : $('#id').val()}
            			}).done(function(resp){
            				console.log(resp);
            				if(resp == 'use'){
            					$("#idHelp").text("이미 사용하고 있는 아이디 입니다.");
            					$("#id").val("");
            				}else if(resp == 'nouse'){
            					$("#idHelp2").text("사용 가능한 아이디 입니다.");
            				}
            			})
                    })
                })
        </script>
	<script>
        //정규표현식
            window.onload = function(){
                document.getElementById("id").onfocusout = function(){

                    //ID
                    var msgid = document.getElementById("id").value;
                    var idregex = /^[a-zA-Z]\w{4,19}$/;
                    var result = idregex.test(msgid);

                    if(!result){
                        document.getElementById("idHelp").innerHTML = "영대소문자로 시작하는 5 ~ 20자 단어(숫자,언더바 포함)" 
                    }else{
                        document.getElementById("idHelp").innerHTML = "";
                    }
                }

                document.getElementById("pw").onfocusout = function(){

                    //ID
                    var msgpw = document.getElementById("pw").value;
                    var pwregex = /\w{8,16}$/;
                    var result = pwregex.test(msgpw);

                    if(!result){
                        document.getElementById("pwHelp").innerHTML = "8~16자 단어(영대문자 숫자 언더바 포함)" 
                    }else{
                        document.getElementById("pwHelp").innerHTML = "";
                    }
                }

                document.getElementById("pwConfirm").onfocusout = function(){

                    //ID
                    var msgpw = document.getElementById("pw").value;
                    var msgpwc = document.getElementById("pwConfirm").value;

                    if(msgpw == ""){
                        document.getElementById("pwConfirmHelp").innerHTML = "비밀번호를 입력하지 않았습니다.";
                        document.getElementById("pwConfirm").value = "";
                    }else if(msgpw != msgpwc){
                        document.getElementById("pwConfirmHelp").innerHTML = "비밀번호가 일치하지 않습니다.";
                        document.getElementById("pwConfirm").value = "";
                    }else if(msgpw == msgpwc){
                        document.getElementById("pwConfirmHelp").innerHTML = "" ;
                    }
                }

                document.getElementById("name").onfocusout = function(){

                    //ID
                    var msgid = document.getElementById("name").value;
                    var idregex = /^[가-힣]{2,6}$/;
                    var result = idregex.test(msgid);

                    if(!result){
                        document.getElementById("nameHelp").innerHTML = "한글 2~6자" 
                    }else{
                        document.getElementById("nameHelp").innerHTML = "";
                    }
                }

                document.getElementById("email").onfocusout = function(){

                    //ID
                    var msgEmail = document.getElementById("email").value;
                    var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
                    var result = emailRegex.test(msgEmail);

                    if(!result){
                        document.getElementById("emailHelp").innerHTML = "이메일 형식만 가능 ex)name@example.com"; 
                    }else{
                        document.getElementById("emailHelp").innerHTML = "";
                    }
                }

                document.getElementById("phone").onfocusout = function(){

                    //ID
                    var msgPhone = document.getElementById("phone").value;
                    var phoneRegex = /^[0-9]{9,11}$/;
                    var result = phoneRegex.test(msgPhone);

                    if(!result){
                        document.getElementById("phoneHelp").innerHTML = "-제외한 숫자 9~11 자리수" ;
                    }else{
                        document.getElementById("phoneHelp").innerHTML = "";
                    }
                }

                document.getElementById("office_name").onfocusout = function(){

                    //ID
                    var msgOffice_name = document.getElementById("office_name").value;
                    var office_nameRegex = /^[가-힣a-zA-Z0-9]+$/;
                    var result = idregex.test(msgid);

                    if(!result){
                        document.getElementById("office_nameHelp").innerHTML = "한글,영어,숫자 1자 이상" 
                    }else{
                        document.getElementById("office_nameHelp").innerHTML = "";
                    }
                }

                document.getElementById("office_phone").onfocusout = function(){

                    //ID
                    var msgOffice_phone = document.getElementById("office_phone").value;
                    var office_phoneRegex = /^[0-9]{9,11}$/;
                    var result = office_phoneRegex.test(msgOffice_phone);

                    if(!result){
                        document.getElementById("office_phoneHelp").innerHTML = "-제외한 숫자 9~11 자리수" ;
                    }else{
                        document.getElementById("office_phoneHelp").innerHTML = "";
                    }
                }

                document.getElementById("birth").onfocusout = function(){

                    //ID
                    var msgBirth = document.getElementById("birth").value;
                    var birthRegex = /^[0-9]{8,8}$/;
                    var result = birthRegex.test(msgBirth);

                    if(!result){
                        document.getElementById("birthHelp").innerHTML = "8 자리수 ex)20200514" ;
                    }else{
                        document.getElementById("birthHelp").innerHTML = "";
                    }
                }
            }
	//값이 비어있으면 false
            $(function(){
                $("#frm").submit(function(){
                    if($("#id").val() == ""){
                        result = false;
                        $("#idHelp").text("아이디를 입력해주세요");
                    }
                    if($("#pw").val() == ""){
                        result = false;
                        $("#pwHelp").text("비밀번호를 입력해주세요");
                    }
                    if($("#pwConfirm").val() == ""){
                        result = false;
                        $("#pwConfirmHelp").text("비밀번호를 한번 더 입력해주세요");
                    }
                    if($("#name").val() == ""){
                        result = false;
                        $("#nameHelp").text("이름를 입력해주세요");
                    }
                    if($("#email").val() == ""){
                        result = false;
                        $("#emailHelp").text("이메일을 입력해주세요");
                    }
                    if($("#phone").val() == ""){
                        result = false;
                        $("#phoneHelp").text("전화번호를 입력해주세요");
                    }
                    if($("#office_name").val() == ""){
                        result = false;
                        $("#office_nameHelp").text("사무소 이름를 입력해주세요");
                    }
                    if($("#office_phone").val() == ""){
                        result = false;
                        $("#office_phoneHelp").text("사무소 전화번호를 입력해주세요");
                    }
                    if($("#office_zipcode").val() == ""){
                        result = false;
                        $("#office_zipcodeHelp").text("사무소 주소를 입력해주세요");
                    }
                    if($("#test option:selected").val() == ""){
                        result = false;
                        $("#testHelp").text("출신 시험을 선택해주세요");
                    }
                    $("#test").on("click", function(){
                        $("#testHelp").text("");
                        result = true;
                    })

                    if($("#test_num option:selected").val() == ""){
                        result = false;
                        $("#test_numHelp").text("시험 회차를 선택해주세요");
                    }
                    $("#test_num").on("click", function(){
                        $("#test_numHelp").text("");
                        result = true;
                    })


                    return result;
                })
            })

        </script>


	<!--    슬라이드 그림     -->





</body>
</html>