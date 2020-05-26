<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Document</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="135679517622-k6b7app001aefrn7qjas1h3ddsar8309.apps.googleusercontent.com">
<link rel="stylesheet" href="style.css">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<style>
.logo_main {
	position: relative;
	width: 200px;
	height: 35px;
	position: relative;
	top: 25px;
}

.snslogin {
	border: 1px solid white;
	position: relative;
	right: 110px;
}

#naver_id_login:hover {
	color: white;
}
</style>
</head>

<body class="is-preload">
	<!-- Wrapper -->
	<div class="map">
		<div id="wrapper" class="container-fluid" style="text-align: center;">
			<img src="lawview.jpg" class="logo_main">
			<!-- Main login-->

			<div id="main">
				<div class="inner">

					<div class="wrap">

						<div class="form-wrap">

							<div class="button-wrap">
								<div id="btn"></div>
								<button type="button" class="togglebtn" onclick="login()">
									의뢰인</button>
								<button type="button" class="togglebtn" onclick="register()">
									변호사</button>
							</div>
							<!-- 의뢰자로그인-->

							<form id="login" action="clientlogin.login" method="post"
								class="input-group">
								<input type="text" class="input-field" placeholder="User ID"
									name="id" required> <input type="password"
									class="input-field" placeholder="Enter Password" name="pw"
									required> <input type="checkbox" class="checkbox">
								<span>아이디기억하기</span>
								<button class="submit" name='login' value='clogin'
									style="color: white" type="submit">로그인</button>
								<br>
								<button class="submit" type="button" id="signUp"
									style="color: white">회원가입</button>
								<br> <span>SNS 계정으로 로그인</span> <br> <br>
								<div id="google" class="g-signin2" data-onsuccess="onSignIn"
									style="width: 180px; margin-left: 50px;"></div>
								<br>
								<div id="naver_id_login" style="text-align: center;"></div>


							</form>
							<!-- 변호사 로그인-->
							<form id="register" action="lawyerlogin.login" method="get"
								class="input-group">
								<input type="text" class="input-field" placeholder="User ID"
									name="law_id" required> <input type="password"
									class="input-field" placeholder="Enter Password" name="law_pw"
									required> <input type="checkbox" class="checkbox"><span>아이디기억하기</span>
								<button class="submit" name='login' value='llogin'
									style="color: white" type="submit">로그인</button>
								<br>

								<button class="submit" type="button" id="lawsignUp"
									style="color: white">변호사 회원가입</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>






	<script>
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			console.log("ID: " + profile.getId());
			console.log('Full Name: ' + profile.getName());
			console.log("Image URL: " + profile.getImageUrl());
			console.log("Email: " + profile.getEmail());

			//test주소
			//location.href = "signUp.login";

		}
	</script>
	<script type="text/javascript">
		var clientId = "GfbNdPqiUYCInN3HJTVq";
		var callbackUrl = "http://localhost/law_login/login.jsp";
		var naver_id_login = new naver_id_login(clientId, callbackUrl);
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3, 40);
		//로그인완료 되는 페이지로 이동  //law_login > 에서 완성페이지

		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>




	<script>
		//의뢰인 컨트롤러 통해 회원가입 이동
		$("#signUp").on("click", function() {
			location.href = "signUp.login";
		})
		//변호사 컨트롤러 통해 회원가입 이동
		$("#lawsignUp").on("click", function() {
			location.href = "lawsignUp.login";
		})
	</script>

	<script>
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";

		}
	</script>















</body>
</html>