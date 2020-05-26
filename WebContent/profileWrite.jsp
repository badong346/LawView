<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  
<style>
* {
	box-sizing: border-box;
	text-align: center;
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
}

.contents {
	text-align: center;
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
	width: 200px;
	padding-top: 10px;
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

/* 퀵메뉴 사이드바 설정 */
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

/* 여기서부터 담당 페이지 스타일 추가하시면 됩니다. */
input[type=button], input[type=submit] {
	border: 1px;
	border-radius: 4px;
	background-color: #f56a6a;
	color: #f4f5f9;
	height: 25px;
	margin-top: 20px;
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

		//여기서부터 담당 페이지 스크립트 새로 추가하시면 됩니다!
		$("#back").on("click", function() {
			location.href = 'toProfileList.profile'
		});
		
		
		//공백 체크
        $("#frm").submit(function(){
        	var result = true;
            if($("#title").val() == ""){
                result = false;
                alert("타이틀을 입력하세요");
            }
            if($("#education").val() == ""){
                result = false;
                alert("교육 사항을 입력하세요");
            }

            return result;
        });
		
        $('#education').summernote({
            placeholder: '교육 사항을 입력해주세요',
            tabsize: 2,
            height: 100
          });

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
				<li class="nav-item"><c:choose>
						<c:when
							test="${empty sessionScope.clientInfo && empty sessionScope.lawyerInfo}">
							<a class="nav-link" href=login.jsp>Login</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link" href=logout.login>Logout</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>

	</div>
	<!--      전체 컨테이너 (헤더,푸터 제외)    -->
	<div class=container>

		<!-- contents 영역 (여기에 각자 컨텐츠들 넣으시면 돼요) -->
		<div class=contents>



			<form action=write.profile method="post"
				enctype="multipart/form-data" id="frm">
				<div class="container">


<h3>프로필의 제목을 입력하세요</h3><br>
					<div class="form-group row">
						<div class="col-sm">
							<input id="title" name="title" class="form-control-plaintext"
								type="text" placeholder="제목을 입력하세요.">
						</div>
					</div>

					<div class="form-group">
  <hr class="my-4">
						<h3>전문분야</h3><br>
					

						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='이혼'
								class="custom-control-input" id="customControlValidation1"
								> <label class="custom-control-label"
								for="customControlValidation1">이혼</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='손해배상'
								class="custom-control-input" id="customControlValidation2"
								> <label class="custom-control-label"
								for="customControlValidation2">손해배상</label>
						</div>

						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='폭행/협박'
								class="custom-control-input" id="customControlValidation3"
								> <label class="custom-control-label"
								for="customControlValidation3">폭행/협박 </label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='가사기타'
								class="custom-control-input" id="customControlValidation4"
								> <label class="custom-control-label"
								for="customControlValidation4">가사기타 </label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='성범죄'
								class="custom-control-input" id="customControlValidation5"
								> <label class="custom-control-label"
								for="customControlValidation5">성범죄</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='재산범죄'
								class="custom-control-input" id="customControlValidation6"
								> <label class="custom-control-label"
								for="customControlValidation6">재산범죄</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='수사'
								class="custom-control-input" id="customControlValidation7"
								> <label class="custom-control-label"
								for="customControlValidation7">수사</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='민사기타'
								class="custom-control-input" id="customControlValidation8"
								> <label class="custom-control-label"
								for="customControlValidation8">민사기타</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='친족'
								class="custom-control-input" id="customControlValidation9"
								> <label class="custom-control-label"
								for="customControlValidation9">친족</label>
						</div>

						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='채권추심'
								class="custom-control-input" id="customControlValidation10"
								> <label class="custom-control-label"
								for="customControlValidation10">채권추심</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='민사소송절차'
								class="custom-control-input" id="customControlValidation11"
								> <label class="custom-control-label"
								for="customControlValidation11">민사소송절차</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='상속'
								class="custom-control-input" id="customControlValidation12"
								> <label class="custom-control-label"
								for="customControlValidation12">상속</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='형사기타'
								class="custom-control-input" id="customControlValidation13"
								> <label class="custom-control-label"
								for="customControlValidation13">형사기타</label>
						</div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" name='specialty' value='기타법률서비스'
								class="custom-control-input" id="customControlValidation14"
								> <label class="custom-control-label"
								for="customControlValidation14">기타법률서비스</label>
						</div>



					</div>
					  <hr class="my-4">
	<h3>교육 사항</h3><br>
					<div class="form-group">
						<textarea class="form-control" name="education"
							id="education" rows="10"
							placeholder="education를 입력하세요."></textarea>
					</div>
					  <hr class="my-4">
	<h3>프로필 사진</h3><br>
					<div class="form-group">
						<input type=file name="file">
					</div>

					  <hr class="my-4">

					<div id="writeBtn">
						<input type="submit" id="write" value="작성 완료"> <input
							type="button" id="back" value="목록으로">
					</div>

				</div>
			</form>



		</div>
		<!-- contents 영역 끝 -->

	</div>
	<!--container 끝-->



	<!--     footer 영역      -->
	<div class="row footer">
		<div class="col-12 sponser" style="padding: 0"></div>
		<div class="col-12 col-md-5 info1 infotext">
			<br>Copyrightⓒ 2020 Law View Inc. All Rights Reserved.
		</div>
		<div class="col-12 col-md-7 info2 infotext">
			<br> <a href=#>이용약관 </a>| <a href=#> 개인정보처리방침 </a>| <a href=#>
				이메일주소 무단수집 거부 </a>| <a href=#> 정도경영 사이버신문고 </a>| <a href=#> 영상정보처리기기
				운영관리 방침 </a>|
		</div>
		<div class="col-12 col-md-6 info3 infotext">
			<br> <a href=main.jsp><img src="resources/image/lawview.jpg"
				class="doosancompany"></a> Law View is operated by LAW VIEW Inc.<br>
			<br> <a href=#><img src="resources/image/facebook.jpg"
				class="linklogo"></a> <a href=#><img
				src="resources/image/twitter.jpg" class="linklogo"></a> <a href=#><img
				src="resources/image/instagram.png" class="linklogo"></a> <a
				href=#><img src="resources/image/youtube.png" class="linklogo"></a>
		</div>
		<div class="col-12 col-md-6 info4 infotext">
			<br>사업자 등록번호 : 851-87-00622 대표자 성명 : 박정수<br> 사업자주소 : 서울특별시
			중구 남대문로 120 대일빌딩 2F, 3F<br> 연락처 : 02-722-0858 개인정보관리책임자 : 김영재
		</div>
	</div>

</body>
</html>