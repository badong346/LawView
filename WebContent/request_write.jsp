<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
        <script src="https://kit.fontawesome.com/a207991562.js" crossorigin="anonymous"></script>
        <style>
            *{
                box-sizing: border-box;
                text-align: center;
            }
            /* 추가 : 폰트 설정 */
            @font-face{
                font-family:"barunGothic";
                src:url("NanumBarunGothic.ttf") format("truetype");
                font-style:normal;
                font-weight:normal;
            }
            *{font-family:"barunGothic";font-size:14px;}
			/* 전체 틀3개 설정 (header, contents, footer영역) */
            .header{   /*맨위 고정메뉴*/
                position: fixed; 
                width: 100%; 
                z-index: 5; 
                background-color: white; 
                margin: 0px;
                width: 100%;
            }
            .contents{text-align: center; position: relative; top: 100px; margin: auto;}
            .footer{position: relative; top: 170px; width: 100%; margin: auto;}
            .contents .row>div{padding-left: 0px;padding-right: 0px;}



            /* header 영역 설정 */
            .q_menu_btn{text-align: left; padding-top: 10px;}  /*퀵메뉴 버튼*/
            .quickBtn{border: 0px solid white; background-color: white; width: 50px; height: 50px;}
            .quickLine{border-bottom: 3px solid #f56a6a; padding: 3px;}
            .logo{width: 200px; padding-top: 10px;}

            .navi{padding: 0px;}
            .nav{height: 100%;}
            .nav-item{line-height: 60px;}
            .nav-link{font-size: 18px; font-weight: 600; color:#f56a6a;}
            .nav-link:hover{color: #f9a5a5;}

            /* footer 영역 */
            .footer {padding: 0;}
            .sponser{border:1px solid lightgray;}
            .info1,.info3{text-align: left;}
            .info2,.info4{text-align: right;}

            .doosancompany{width: 100px;}
            .linklogo{width: 30px;}
            .infotext{font-size: 13px; color: gray;}
            .info2>a{color: black;}

            /* 퀵메뉴 사이드바 설정 */
            .quickmenu{
                width: 230px; height: 100%;
                background-color: #f5f5f5;
                text-align: center;
                position: fixed;
                z-index: 10;
                top: 0px; left: -230px;  /*퀵메뉴 위치*/
                transition-duration: 0.5s;
            }
            .quick_title{  /*사이드바 Menu title 부분*/
                color: black; 
                font-size: 20px; 
                font-weight: 600;
                text-align: left;
                padding-top: 70px;
                padding-left: 30px;
            }
            .q_line{   /* Menu 밑에 빨간줄 */
                border-bottom: 3px solid #f56a6a;
                width: 60px;
            }
            .quick_menu{
                padding-top: 10px;
            }
            .quick_menu>li{
                position: relative;
                width: 100%; height: 50px;
                list-style-type: none;
                padding-left: 30px;
            }
            .q_m_line{   /*사이드메뉴 나누는 회색줄*/
                border: 0.5px solid lightgray; 
                width: 150px;
            }
            .q_b_line{  /*메뉴,로그인 나누는 굵은 회색줄*/
                border: 1px solid lightgray; 
                width: 200px;
                position: relative;
                left: 20px; top: 30px;
                display: none;
            }
            .quick_menu>li>a{  /* 사이드바 메뉴 글씨 */
                position: relative;
                text-decoration: none;
                color: dimgray;
                display: block;
                width: 100%; height: 100%;
                line-height: 50px;
                text-align: left;
            }
            .quick_menu>li>a:hover{color: darkgray;}
            #q_back:hover{cursor: pointer;}  /* 사이드바 닫는 화살표 */
            #q_back{
                margin-left: 170px; 
                margin-top: 10px;
                font-size: 30px; font-weight: 600; 
                width: 50px; height: 50px;
                position: fixed;
            }
            #back_arrow{width: 30px; height: 30px; z-index: 20;}  /*화살표 이미지설정*/
            
            
            
            /* 여기서부터 담당 페이지 스타일 추가하시면 됩니다. */


            .page-link{color:#f56a6a;}             /* 색상 설정 추가 */
            .btn{background-color:#f56a6a;}
            textarea {
                padding: 0.75em 1em; }
            body, input, select, textarea {
                color: #7f888f;
                font-family: "Open Sans", sans-serif;
                font-size: 13pt;
                font-weight: 400;
                line-height: 1.65; }
            @media screen and (max-width: 1680px) {
                body, input, select, textarea {
                    font-size: 11pt; } }
            @media screen and (max-width: 1280px) {
                body, input, select, textarea {
                    font-size: 10pt; } }
            @media screen and (max-width: 360px) {
                body, input, select, textarea {
                    font-size: 9pt; } }
            textarea {
                -moz-appearance: none;
                -webkit-appearance: none;
                -ms-appearance: none;
                appearance: none;
                background: #ffffff;
                border-radius: 0.375em;
                border: none;
                border: solid 1px rgba(210, 215, 217, 0.75);
                color: inherit;
                display: block;
                outline: 0;
                padding: 0 1em;
                text-decoration: none;
                width: 100%; }
            input[type="text"]:invalid,
            input[type="password"]:invalid,
            input[type="email"]:invalid,
            input[type="tel"]:invalid,
            input[type="search"]:invalid,
            input[type="url"]:invalid,
            select:invalid,
            textarea:invalid {
                box-shadow: none; }
            input[type="text"]:focus,
            input[type="password"]:focus,
            input[type="email"]:focus,
            input[type="tel"]:focus,
            input[type="search"]:focus,
            input[type="url"]:focus,
            select:focus,
            textarea:focus {
                border-color: #f56a6a;
                box-shadow: 0 0 0 1px #f56a6a; }

            /* contents - 카테고리 영역*/
            .categories{margin: auto;}
            .title{font-size: 20px; font-weight: 600; color: #1a1943;}
            .category{width: 130px;}
            .text_category{font-size: 20px; font-weight: 600; height: 50px; line-height: 50px;}

            /* contents - 의뢰게시판 */
            .advice{width: 550px; margin: auto;}
            .board>.list-group>li>a{
                text-decoration: none;
                color: black;
                text-align: left;
            }
            .badge{background-color: hotpink; color: white;}  /* new게시글 뱃지*/
            .contents .row>div{padding-top: 30px;}



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
				$("form").on("submit",function(){
					var title = $("#title").val();
					var contents = $("#contents").val();
					var option = $("#category option:selected").val();
					var result = true;
					if(option==""){
						alert("카테고리를 선택해주세요.");
						result = false;
					}else if(title==""){
						alert("제목을 입력해주세요.");
						result = false;
					}else if(contents==""){
						alert("내용을 작성해주세요.");
						result = false;
					}
					return result;
				})
				$("#clear").on("click",function(){
					$("#title").val("");
					$("#contents").val("");
					$("#category").val("");
				})
            })
        </script>
</head>
<body>
            <!-- header 영역 (맨위에 메뉴바) -->
            <div class="row header">

                <!-- quick menu 버튼 -->
                <div class="q_menu_btn col-2 col-sm-1 col-md-0 d-md-none d-block" id=q_menu_btn>
                    <!--   quickmenu 넣기-->
                    <button class=quickBtn>
                        <div class=quickLine></div>
                        <div class=quickLine></div>
                        <div class=quickLine></div>
                    </button>

                </div>

                <!-- quick menu -->           
                <div class="quickmenu" id="quickmenu">
                    <div id=q_back><img src="resources/image/back.png" id=back_arrow></div>

                    <div class=quick_title>
                        Menu
                        <div class=q_line></div>
                    </div>
                    <div class=quick_menu>
                        <li><a href=search.jsp>법률검색</a><div class=q_m_line></div></li>
                        <li><a href=board.req>의뢰하기</a><div class=q_m_line></div></li>
                        <li><a href=toProfileList.profile>변호사</a><div class=q_m_line></div></li>
                        <li><a href=faqlist.question>Q&A</a></li>
                    </div>
                    <div class=q_b_line></div>
                    <div class=quick_title>
                        Login
                        <div class=q_line></div>
                    </div>
                    <div class=quick_menu>
                    	<c:choose>
                    		<c:when test="${empty sessionScope.clientid}">
                    			<li><a href=login.jsp>로그인</a><div class=q_m_line></div></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li><a href="logout.login">로그아웃</a><div class=q_m_line></div></li>
                    		</c:otherwise>
                    	</c:choose>
                        <li><a href=mypage.jsp>마이페이지</a></li>
                    </div>
                </div>

                <div class="logo col-2 col-md-3 col-lg-2">
                    <a href=main.jsp><img src="resources/image/lawview.jpg" class="logo"></a>
                </div>

                <div class="navi col-9 col-lg-10 d-md-block d-none">
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link active" href=search.jsp>법률 검색</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href=board.req>의뢰하기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href=toProfileList.profile>변호사</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="faqlist.question">Q&A</a>
                        </li>
                        <li class="nav-item">
	                        <c:choose>
	                    		<c:when test="${empty sessionScope.clientid}">
	                    			<a class="nav-link" href=login.jsp>Login</a>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<a class="nav-link" href=logout.login>Logout</a>
	                    		</c:otherwise>
	                    	</c:choose>
                        </li>
                    </ul>
                </div>

            </div>
        <div class="container">
            <!-- contents 영역 (여기에 각자 컨텐츠들 넣으시면 되요) -->
            <div class=contents>
                <h3>의뢰 게시판</h3>
                <form action="write.req" method="post">
                    <div class="row top">
                        <div class="col-4 col-sm-3 category">
                            <select class="custom-select" name="category" id="category">
                                <option value="" selected>카테고리</option>
                                <option value="이혼">이혼</option>
                                <option value="교통사고">교통사고</option>
                                <option value="형사">형사</option>
                            </select>
                        </div>
                        <div class="col-8 col-sm-9 search-box">
                            <input type="text" id="title" name="title" class="form-control input" placeholder="질문을 작성해주세요." aria-label="Recipient's username" aria-describedby="button-addon2" maxlength="100">
                        </div>
                        <div class="col-12">
                            <textarea id="contents" name="contents" placeholder="내용을 작성해주세요." rows="14" maxlength="4000"></textarea>
                        </div>
                        <!-- Break -->
                        <div class="col-12 text-right">
                            <button type="submit" class="btn btn-danger text-right"><i class="fas fa-pen-nib"></i> 등록하기 </button>
                            <button type="button" id="clear" class="btn btn-danger text-right"><i class="fas fa-eraser"></i> 다시작성</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!--     footer 영역      -->
        <div class="row footer">
            <div class="col-12 sponser">

            </div>
            <div class="col-12 col-md-5 info1 infotext">
                <br>Copyrightⓒ 2019 Doosan Bears Inc. All Rights Reserved.
            </div>
            <div class="col-12 col-md-7 info2 infotext">
                <br>
                <a href=#>이용약관　</a>|
                <a href=#>　개인정보처리방침　</a>| 
                <a href=#>　이메일주소 무단수집 거부　</a>| 
                <a href=#>　정도경영 사이버신문고　</a>| 
                <a href=#>　영상정보처리기기 운영관리 방침　</a>| 
            </div>
            <div class="col-12 col-md-6 info3 infotext">
                <br>
                <img src="lawview.jpg" class="doosancompany">
                DOOSANBEARS is operated by DOOSAN BEARS Inc.<br><br>
                <a href=#><img src="facebook.jpg" class="linklogo"></a>
                <a href=#><img src="twitter.jpg" class="linklogo"></a>
                <a href=#><img src="instagram.png" class="linklogo"></a>
                <a href=#><img src="youtube.png" class="linklogo"></a>
            </div>
            <div class="col-12 col-md-6 info4 infotext">
                <br>사업자 등록번호 : 107-81-13241　　대표자 성명 : 전풍<br>
                사업자주소 : 서울특별시 송파구 올림픽로 25 잠실야구장내 두산베어스<br>
                연락처 : 02-2240-1777　　통신판매허가번호 : 서울시 송파구청 제 1775호
            </div>
        </div>
</body>
</html>