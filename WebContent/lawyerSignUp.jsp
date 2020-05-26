<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script  src="https://code.jquery.com/jquery-3.5.1.js"  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

        <style>
            *{
                box-sizing: border-box;
                text-align: center;
            }

            /* 전체 틀3개 설정 (header, contents, footer영역) */
            .header{   /* 맨위 고정메뉴 */
                position: fixed; 
                width: 100%; 
                z-index: 5; 
                background-color: white; 
                margin: 0px;
            }
            .contents{text-align: center; position: relative; top: 120px; margin: auto;}
            .footer{position: relative; top: 170px;}



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


            /* 검색조건 영역 */
            .input-group{height: 50px;}
            .input{text-align: left; height: 100%; border: 2px solid #f56a6a;}
            #button-addon2{background-color: #f56a6a; color: white; border: none;}
            .input:active>.list-group-flush{display: block;}
            .list-group-item{text-align: left;}
            .list-title{font-weight: 600;}



            /* contents영역 설정들 */

            .head{    /* 컨텐츠 각 레이아웃 제목 */
                font-size: 20px;
                font-weight: 600; 
                color: #5D007D;
            }
            .title_redbar{   /* 컨텐츠 각 레이아웃 제목 빨간 밑줄*/
                border-bottom: 5px solid #f56a6a; 
                width: 150px; height: 50px; 
                margin: auto;
                font-weight: 600;
                font-size: 20px;
                line-height: 50px;
            }

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


            /* contents - 변호사 프로필 카드 */
            .card{margin: auto; width: 400px;}
            .card-title{font-weight: 600; text-align: left;}
            .card-text{font-size: 15px; text-align: left;}
            .card-img{width: 120px;}



            /* footer 영역 */
            .sponser{border:1px solid lightgray;}
            .info1,.info3{text-align: left;}
            .info2,.info4{text-align: right;}

            .doosancompany{width: 100px;}
            .linklogo{width: 30px;}
            .infotext{font-size: 13px; color: gray;}
            .info2>a{color: black;}



            /* 여기부터 퀵메뉴 사이드바 설정 */
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
            #q_back{
                margin-left: 170px; 
                margin-top: 10px;
                font-size: 30px; font-weight: 600; 
                width: 50px; height: 50px;
                position: fixed;
            }
            #back_arrow{width: 30px; height: 30px; z-index: 20;}  /*화살표 이미지설정*/

            
            /*            회원가입 부분 디자인*/
            .form-group,.form-control, .form-text{text-align: left}
            #signUp{width: 400px; margin: auto}
            .form-check{font-size: 20px}
            .addr{float: right}
            .regex{color: red !important}
            .necessary{color: red !important}
            #idHelp2{color: green !important}
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
                    		<c:when test="${empty sessionScope.clientInfo && empty sessionScope.lawyerInfo}">
                    			<li><a href=login.jsp>로그인</a><div class=q_m_line></div></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li><a href="logout.login">로그아웃</a><div class=q_m_line></div></li>
                    			<li><a href="go.mypage">마이페이지</a></li>
                    		</c:otherwise>
                    	</c:choose>                        
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
	                    		<c:when test="${empty sessionScope.clientInfo && empty sessionScope.lawyerInfo}">
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



        <!-- contents 영역 (여기에 각자 컨텐츠들 넣으시면 되요) -->
        <div class=contents>
            <div id="signUp">
               필수입력<b class="necessary">*</b>
                <form action="lawyerSignUp.signUp" method="post" id="frm">
                    <div class="form-group">
                        <b class="necessary">*</b><label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" aria-describedby="idHelp" placeholder="영대소문자로 시작하는 5 ~ 20자 단어(언더바 포함)"><button type="button" id="idDuplCheck" class="btn btn-primary">중복확인</button>
                        <small id="idHelp" class="form-text text-muted regex"></small><small id="idHelp2" class="form-text text-muted"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="pw">비밀번호</label>
                        <input type="password" class="form-control" id="pw" name="pw" aria-describedby="pwHelp" placeholder="8~16자 단어(영대문자 숫자 언더바 포함)">
                        <small id="pwHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="pwConfirm">비밀번호 확인</label>
                        <input type="password" class="form-control" id="pwConfirm" aria-describedby="pwConfirmHelp" placeholder="비밀번호를 한번 더 입력해주세요">
                        <small id="pwConfirmHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" aria-describedby="nameHelp" placeholder="한글">
                        <small id="nameHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="email">이메일</label>
                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="name@example.com">
                        <small id="emailHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="phone">전화번호</label>
                        <input type="text" class="form-control" id="phone" name="phone" aria-describedby="phoneHelp" placeholder="-제외한 숫자 9~11 자리수">
                        <small id="phoneHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="office_name">사무실 이름</label>
                        <input type="text" class="form-control" id="office_name" name="office_name" aria-describedby="office_nameHelp" placeholder="한글,영어,숫자 1자 이상">
                        <small id="office_nameHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="office_phone">사무실 전화번호</label>
                        <input type="text" class="form-control" id="office_phone" name="office_phone" aria-describedby="office_phoneHelp" placeholder="-제외한 숫자 9~11 자리수">
                        <small id="office_phoneHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="office_zipcode">사무실 우편번호</label><button type="button" class="btn btn-outline-primary addr" onclick="sample4_execDaumPostcode()">주소찾기</button>
                        <input type="text" class="form-control" id="office_zipcode" name="office_zipcode" aria-describedby="office_zipcodeHelp" placeholder="" readonly>
                        <small id="office_zipcodeHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="office_addr1">사무실 주소</label>
                        <input type="text" class="form-control" id="office_addr1" name="office_addr1" aria-describedby="office_addr1Help" placeholder="" readonly>
                        <small id="office_addr1Help" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="office_addr2">사무실 상세주소</label>
                        <input type="text" class="form-control" id="office_addr2" name="office_addr2" aria-describedby="office_addr2Help" placeholder="" readonly>
                        <small id="office_addr2Help" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="test">출신 시험</label>
                        <select id="test" name="test" class="form-control" aria-describedby="testHelp">
                            <option value="" hidden selected>시험 선택</option>
                            <option value="test1">사법시험</option>
                            <option value="test2">변호사시험</option>
                            <option value="test3">군법무관 임용시험</option>
                            <option value="test4">고등고시</option>
                        </select>
                        <small id="testHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <b class="necessary">*</b><label for="test_num">시험 횟수</label>
                        <select id="test_num" name="test_num" class="form-control" aria-describedby="test_numHelp">
                            <option value="" hidden selected>몇 회</option>
                            <option value="1">1회</option>
                            <option value="2">2회</option>
                            <option value="3">3회</option>
                            <option value="4">4회</option>
                            <option value="5">5회</option>
                            <option value="6">6회</option>
                            <option value="7">7회</option>
                            <option value="8">8회</option>
                        </select>
                        <small id="test_numHelp" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                       성별<br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                            <label class="form-check-label" for="male">남성</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                            <label class="form-check-label" for="female">여성</label>
                        </div>
                        <small id="gender" class="form-text text-muted regex"></small>
                    </div>
                    <div class="form-group">
                        <label for="birth">생년월일</label>
                        <input type="text" class="form-control" id="birth" name="birth" aria-describedby="birthHelp" placeholder="8 자리수 ex)20200514">
                        <small id="birthHelp" class="form-text text-muted regex"></small>
                    </div>
                    <button type="submit" class="btn btn-primary">회원가입</button>
                </form>
            </div>
            <div class=col-12><br><br><br><br></div>  <!-- 아래쪽에 <br>공백 -->
        </div>
        <!--       컨텐츠 영역 끝        -->
        <script>
        //id체크
        $(function() {
           $("#idDuplCheck").on("click", function() {
              if ($("#id").val() != "") {
                 $.ajax({
                    url : "idDuplCheck.login",
                    type : "post",
                    data : {
                       id : $('#id').val()
                    }
                 }).done(function(resp) {   
                    
                    var msgid = document.getElementById("id").value;
                    var idregex = /^[a-zA-Z]\w{4,19}$/;
                    var result = idregex.test(msgid);
                    
                    if (resp == 'use') {
                       $("#idHelp").text("이미 사용하고 있는 아이디 입니다.");
                       $("#id").val("");
                    } else if (resp == 'nouse') {
                       if(!result){
                          $("#idHelp2").text("");
                          $("#idHelp").text("영대소문자로 시작하는 5 ~ 20자 단어(숫자,언더바 포함)");
                       }else{
                          $("#idHelp").text("");
                          $("#idHelp2").text("사용 가능한 아이디 입니다.");                        
                       }
                       
                    }
                 })
              } else {
                 $("#idHelp").text("아이디를 입력해주세요");
              }
           })
        })


        </script>
        <script>
            //주소 스크립트
            function sample4_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 참고 항목 변수

                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraRoadAddr += data.bname;
                            }
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            if(extraRoadAddr !== ''){
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }
                            document.getElementById('office_zipcode').value = data.zonecode;
                            document.getElementById("office_addr1").value = roadAddr;

                            if(roadAddr !== ''){
                                document.getElementById("office_addr2").value = extraRoadAddr;
                            } else {
                                document.getElementById("office_addr2").value = '';
                            }

                        }
                    }).open();
                }       
            //정규화 스크립트
            window.onload = function(){
                document.getElementById("id").onfocusout = function(){

                    //ID
                    var msgid = document.getElementById("id").value;
                    var idregex = /^[a-zA-Z]\w{4,19}$/;
                    var result = idregex.test(msgid);

                    if(!result){
                        document.getElementById("idHelp").innerHTML = "영대문자로 시작하는 5 ~ 20자 단어(언더바 포함)" 
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
                    var birthRegex = /^[0-9]{8}$/;
                    var result = office_phoneRegex.test(msgOffice_phone);

                    if(!result){
                        document.getElementById("birthHelp").innerHTML = "8 자리수 ex)20200514" ;
                    }else{
                        document.getElementById("birthHelp").innerHTML = "";
                    }
                }
            }
            //null값 체크
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