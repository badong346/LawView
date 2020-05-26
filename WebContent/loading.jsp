<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style>
* {
	font-weight: 100;
	text-align: center;
}

.loading {
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	width: 300px;
	height: 300px;
}

.loading>img {
	width: 150px;
	height: 70px;
	animation-iteration-count: infinite;
}
</style>
<script>
	$(function(){
		location.href="readLaw.search?lawId=${lawId}";
		
	})
</script>


</head>
<body>
	<div class="loading">
		<img class="animate__animated animate__bounce"
			src="resources/image/logo2.png"><br>

		법령 또는 판례 내용을 불러오는 중입니다.......
	</div>
</body>
</html>