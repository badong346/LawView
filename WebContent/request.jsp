<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<script src="https://kit.fontawesome.com/a207991562.js"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
	text-align: center;
}
/* 추가 : 폰트 설정 */
@font-face {
	font-family: "barunGothic";
	src: url("NanumBarunGothic.ttf") format("truetype");
	font-style: normal;
	font-weight: normal;
}

* {
	font-family: "barunGothic";
	font-size: 14px;
}
/* 전체 틀3개 설정 (header, contents, footer영역) */
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
.container {
	width: 100%;
}

.container>div {
	padding-top: 10px;
}

.table-wrapper .row>div {
	padding-left: 0px;
	padding-right: 0px;
}

.table-wrapper .row {
	padding: 10px;
}

.top-btn>.row>div {
	padding-left: 0px;
	padding-right: 0px;
}

.search>div {
	padding-left: 0px;
	padding-right: 0px;
}

.text-right>div {
	padding-left: 0px;
	padding-right: 0px;
}

.contents>div {
	padding-top: 30px;
}

.page-link {
	color: #f56a6a;
} /* 색상 설정 */
.btn {
	background-color: #f56a6a;
}

.search .btn {
	width: 100%;
}

.table-wrapper .row {
	border-bottom: 1px solid #dddddd;
}

.table-wrapper .row>div {
	padding: 8px;
}

.left {
	border-bottom: 1px solid #dddddd;
	border-right: 1px solid #dddddd;
	border-left: 1px solid #dddddd;
}

.right {
	border-bottom: 1px solid #dddddd;
}

.fa-pen-nib {
	color: #f56a6a;
}

.top-btn>.row {
	padding: 10px;
	border-bottom: 1px solid #dddddd;
	margin: 10px;
}

.toWrite {
	background-color: white;
	border: 0px;
}

.toWrite h4 {
	margin-bottom: 0px;
}

.toWrite:hover {
	border-bottom: 1px solid #f56a6a;
}

button.sortOption {
	display: inline;
	border: 0px;
	background-color: white;
}

button.sortOption:hover {
	cursor: pointer;
	border-bottom: 1px solid #333;
}

.sort {
	position: relative;
}

.sort .sortbox {
	position: absolute;
	bottom: 5px;
}

.sort button.active {
	border-bottom: 1px solid #333;
}

.sortContents {
	display: none;
}

#board_category {
	font-size: 8pt;
}

#board_title a b {
	font-size: 12pt;
	text-decoration: none;
	color: black;
}
</style>
<script>
            $(function(){
              $("#newRequest").css('display', 'block');
              if($("#whatsort").text()=="view"){
                 $(".sortOption:eq(1)").addClass("active");
                 selected = $(".sortOption.active").index();
                 $(".sortContents").each(function(index, item){
                    if(index != selected)
                       $(item).css('display','none');
                    else
                       $(item).css('display','block');
                 })
              }else{
                 $(".sortOption:eq(0)").addClass("active");             
              }
               $("#sort").text($(".sortOption.active").val());
              $(".sortOption").on("click",function(event){
                 selectedIndex = $(this).index();
                 $(".sortContents").each(function(index, item){
                    if(index != selectedIndex)
                       $(item).css('display','none');
                    else
                       $(item).css('display','block');
                 })
                 $(".sortOption").each(function(index, item){
                    if(index != selectedIndex)
                       $(item).removeClass('active');
                    else
                       $(this).addClass("active");
                 })
                 $("#sort").text($(".sortOption.active").val());
                   $('.page-link').each(function(index, item){ 
                       var oldUrl = $(this).attr("href"); // Get current url
                       var newUrl = oldUrl.replace(/sort=(.+)/, "sort="+$("#sort").text()); // Create new url
                       $(this).attr("href", newUrl); // Set herf value
                       console.log(newUrl);
                   });
              })
                $("#q_menu_btn").on("click", function(){
                    $("#quickmenu").css("transform", "translate(100%, 0px)");
                })
                $("#q_back").on("click", function(){
                    $(this).parent().css("transform", "translate(-100%, 0px)");
                    $(this).parent().css("transition-duration", "1s");
                })
                $("#writeform").on("submit",function(){
                   var result = false;
                   if($("#lawyerId").text() != ""){
                      alert("당신은 변호사입니다. 상담글은 의뢰인만 작성 가능합니다.");
                   }else if($("#clientId").text() != ""){
                      result = true;
                   }else {
                      alert("의뢰인으로 로그인하세요.");
                   }
                   return result;
                })
                $("#delete").on("click",function(){
                   var checkboxes = $(".delete")
                })
            $("#deleteform").on("submit",function(){
               var result = true;
               if($("input:checkbox[name=deleteSeq]:checked").length==0){
                  alert("삭제할 글을 선택해주세요.");
                  result = false;
               }else{
                  var con = confirm("정말 삭제하시겠습니까?");
                  if(!con){
                     result = false;
                  }
               }
               return result;
            })
            /* $("#searchform").on("submit",function(){
               var result = true;
               if($("#category").val() == ""){
                  alert("카테고리를 선택해주세요.");
                  result = false;
               }else if($("#keyword").val() == ""){
                  alert("키워드를 입력해주세요.");
                  result = false;
               }
               return result;
            }) */
            $("#search").on("click",function(){
               var result = true;
               if($("#category").val()==""){
                  alert("카테고리를 선택해주세요.");
                  result = false;
               }else if($("#keyword").val()==""){
                  alert("키워드를 입력해주세요.");
                  result = false;
               }
               if(result){
                  $.ajax({
                     url:"search.req",
                     type:"get",
                     data:{
                        category:$("#category").val(),
                        keyword:$("#keyword").val()
                     }
                  }).done(function(resp){
                     location.href = "board.req"+resp;
                  })
               }
            })
            })
        </script>
</head>
<body>
	<div id="clientId" style="display: none;">${sessionScope.clientInfo}</div>
	<div id="lawyerId" style="display: none;">${sessionScope.lawyerInfo}</div>
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
					<c:when test="${not empty sessionScope.clientInfo}">
						<li><a href="logout.login">로그아웃</a>
						<div class=q_m_line></div></li>
						<li><a href=mypage.jsp>마이페이지</a></li>
					</c:when>
					<c:when test="${not empty sessionScope.lawyerInfo}">
						<li><a href="logout.login">로그아웃</a>
						<div class=q_m_line></div></li>
						<li><a href=mypage.jsp>마이페이지</a></li>
					</c:when>
					<c:otherwise>
						<li><a href=login.jsp>로그인</a>
						<div class=q_m_line></div></li>
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
						<c:when test="${not empty sessionScope.clientInfo}">
							<a class="nav-link" href=logout.login>Logout</a>
						</c:when>
						<c:when test="${not empty sessionScope.lawyerInfo}">
							<a class="nav-link" href=logout.login>Logout</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link" href=login.jsp>Login</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>

	</div>
	<div class="container">
		<!-- contents 영역 (여기에 각자 컨텐츠들 넣으시면 되요) -->
		<div class=contents>
			<div id="results"></div>
			<h2 class="text-left">검색하세요.</h2>
			<h3 class="text-left">나와 비슷한 문제에 대한 해답이 있습니다.</h3>
			<!-- <form action="search.req" method="get" id="searchform"> -->
			<div class="row search">
				<div class="col-4 col-sm-3 col-lg-2 category">
					<select class="custom-select" name="category" id="category">
						<option selected value="">카테고리</option>
						<option value="이혼">이혼</option>
						<option value="교통사고">교통사고</option>
						<option value="형사">형사</option>
					</select>
				</div>
				<div class="col-7 col-sm-8 col-lg-9 search-box">
					<input type="text" class="form-control input" name="keyword"
						id="keyword" placeholder="키워드를 입력하세요."
						aria-label="Recipient's username" aria-describedby="button-addon2">
				</div>
				<div class="col-1 col-sm-1 col-lg-1 button-box">
					<button type="button" class="btn btn-danger" id="search">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<!-- </form> -->
			<!-- 의뢰글 리스트 테이블 -->
			<!-- choose - test 수정 예정 : 관리자 계정으로 로그인 시 -->
			<div class="row">
				<div class="col-12 col-md-8 order-2 left">
					<div class="table-wrapper">
						<c:choose>
							<c:when test="${empty list}">
								<div class="row">
									<div class="col-12" align=center>글이 없습니다.</div>
								</div>
							</c:when>
							<c:otherwise>
								<form action="delete.req" method="post" id="deleteform">
									<div class="row">
										<c:choose>
											<c:when test="${not empty sessionScope.adminInfo}">
												<div class="col-8 text-left sort">
													<div class="sortbox">
														<button type=button class="sortOption" value="newRequest">최신
															질문순</button>
														·
														<button type=button class="sortOption" value="view">조회순</button>
													</div>
												</div>
												<div class="col-4 text-right">
													<button type="submit" class="btn btn-danger" id="delete">체크한
														글 삭제</button>
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-12 text-left sort">
													<button type=button class="sortOption">최신 질문순</button>
													<button type=button class="sortOption">조회순</button>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="sortContents" id="newRequest">
										<c:forEach var="dto" items="${list}">
											<div class="row">
												<div class="col-12 text-left" id="board_category">${dto.category}</div>
												<div class="col-6 text-left" id="board_title">
													<a href="contents.req?seq=${dto.seq}"><b>${dto.title}</b></a>
												</div>
												<c:choose>
													<c:when test="${not empty sessionScope.adminInfo }">
														<div class="col-6 text-right">
															<input type="checkbox" class="delete" name="deleteSeq"
																value="${dto.seq}">
														</div>
													</c:when>
													<c:otherwise>
														<div class="col-6 text-right"></div>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${empty cmtList[dto.seq]}">
														<div class="col-12 text-left" id="no_comment">답변 없음</div>
														<div class="col-12 text-left" id="board_view">조회수
															${dto.view_count}</div>
													</c:when>
													<c:otherwise>
														<div class="col-12 text-left" id="cmt_writer">답변
															${cmtList[dto.seq][0].writer} 변호사</div>
														<div class="col-12 text-left" id="cmt_contents">${cmtList[dto.seq][0].contents}</div>
														<div class="col-12 text-left" id="cmt_count">다른 변호사
															답변 ${cmtList[dto.seq].size()-1} 개</div>
														<div class="col-6 text-left" id="board_view">조회수
															${dto.view_count}</div>
														<div class="col-6 text-right" id="cmt_sdate">답변 작성
															${dto.sdate}</div>
													</c:otherwise>
												</c:choose>
											</div>
										</c:forEach>
									</div>
									<div class="sortContents" id="sortByView">
										<c:forEach var="dto" items="${listByView}">
											<div class="row">
												<div class="col-12 text-left" id="board_category">${dto.category}</div>
												<div class="col-6 text-left" id="board_title">
													<a href="contents.req?seq=${dto.seq}"><b>${dto.title}</b></a>
												</div>
												<c:choose>
													<c:when test="${not empty sessionScope.adminInfo }">
														<div class="col-6 text-right">
															<input type="checkbox" class="delete" name="deleteSeq"
																value="${dto.seq}">
														</div>
													</c:when>
													<c:otherwise>
														<div class="col-6 text-right"></div>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${empty cmtList[dto.seq]}">
														<div class="col-12 text-left" id="no_comment">답변 없음</div>
														<div class="col-12 text-left" id="board_view">조회수
															${dto.view_count}</div>
													</c:when>
													<c:otherwise>
														<div class="col-12 text-left" id="cmt_writer">답변
															${cmtList[dto.seq][0].writer} 변호사</div>
														<div class="col-12 text-left" id="cmt_contents">${cmtList[dto.seq][0].contents}</div>
														<div class="col-12 text-left" id="cmt_count">다른 변호사
															답변 ${cmtList[dto.seq].size()-1} 개</div>
														<div class="col-6 text-left" id="board_view">조회수
															${dto.view_count}</div>
														<div class="col-6 text-right" id="cmt_sdate">답변 작성
															${dto.sdate}</div>
													</c:otherwise>
												</c:choose>
											</div>
										</c:forEach>
									</div>
								</form>
							</c:otherwise>
						</c:choose>
						<div class="col-12">
							<nav aria-label="...">
								<ul class="pagination justify-content-center">${navi}
								</ul>
							</nav>
						</div>
						<div id="sort" style="display: none;"></div>
					</div>
				</div>
				<div class="col-12 col-md-4 order-1 right">
					<form action="request_write.jsp" method="post" id="writeform">
						<div class="top-btn">
							<div class="row">
								<div class="col-12">
									<i class="fas fa-pen-nib fa-2x"></i><br> 상담글 작성하고<br>
									무료로 변호사의 답변 받는<br>
									<button type="submit" class="toWrite text-right" id="toWrite">
										<h4>
											상담글 작성하기 <i class='fas fa-chevron-right'></i>
										</h4>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<c:choose>
				<c:when test="${sort eq 'view'}">
					<div id="whatsort" style="display: none;">view</div>
				</c:when>
				<c:otherwise>
					<div id="whatsort" style="display: none;">newRequest</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
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