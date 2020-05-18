<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 프로필</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
@font-face {
	font-family: "barunGothic";
	src: url("NanumBarunGothic.ttf") format("truetype");
	font-style: normal;
	font-weight: normal;
}

* {
	font-family: "barunGothic";
	font-size: 12px;
	box-sizing: border-box;
}

.container {
	border-radius: 3px;
	width:750px;
	background-color: #f4f5f9;
	color: #252c41;
	margin: auto;
	border: 1px solid #dddfe6;
}

.row:first-child>.col-12 {
	border-radius: 3px;
	padding: 20px;
}

.row>div {
	margin-top: 1px;
	background-color: white;
	padding: 10px;
}

.comment {
	padding: 0px;
}

#box1 {
	width: 100%;
	border: 1px dotted black;
	height: 100%;
	float: left;
	overflow-y: auto;
}

#box2 {
	border-radius: 5px;
	height: 100%;
	text-align: center;
}

#send {
	border: 1px solid #ffffff;
	border-radius: 5px;
	color: #ffffff;
}

.list {
	border-radius: 10px;
	margin: auto;
	word-wrap: break-word;
	word-break: break-all;
}

input[type=button], input[type=submit] {
	border: 1px;
	border-radius: 4px;
	background-color: #f56a6a;
	color: #f4f5f9;
	height: 20px;
}

.cmt {
	postion: relative;
	padding: 15px;
	background-color: #f4f5f9;
}

.cmt>input {
	position: absolute;
	right: 10px;
	top: 10px;
	background-color: #252c41;
}
</style>
<script>
	$(function() {
		$("#back").on("click", function() {
			location.href = "toProfileList.profile";
		})

		$("#delete").on("click", function() {
			var result = confirm("정말 삭제하시겠습니까?");
			if (result) {
				location.href = "delete.profile?seq=" + ${dto.seq};
			}
		})

		$("#modify").on("click", function() {
			location.href = "toProfileModify.profile?seq=" + ${dto.seq};
		})
	})
</script>
</head>
<body>

	<div class="container">
		<div class="row">
		<div class="col-12" align=center>
			<div class="card bg-dark text-white">
				<c:if test="${!empty dto.img}">
					<img
						src="http://localhost${pageContext.request.contextPath}/upload/${dto.img}"
						class="card-img" id=profileImg>

				</c:if>
				<c:if test="${empty dto.img}">
					<img
						src="http://localhost${pageContext.request.contextPath}/upload/lawyer.png"
						class="card-img" id=profileImg>
				</c:if>


				<div class="card-img-overlay">
					<h5 class="card-title">${dto.name}</h5>
					<p class="card-text">${dto.title}</p>
				</div>
			</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12" align=center>
				<b> ${dto.name} 변호사</b>
			</div>
		</div>

		<div class="row">
			<div class="col-12" align=center>
				<b> ${dto.title}</b>
			</div>
		</div>

		<div class="row">
			<div class="col-12" align=center>
				<b>법무법인 ${dto.office_name}</b>
			</div>
		</div>

		<div class="row">
			<div class="col-12" align=center>
				<b>오피스 번호 ${dto.office_phone}</b>
			</div>
		</div>

		<div class="row">
			<div class="col-12" align=left>
				<b> ${dto.name}변호사의 전문 분야을 확인하세요</b><br> <b>${dto.specialty}</b>
			</div>
		</div>

		<div class="row">
			<div class="col-12" align=left>
				<b> ${dto.name}변호사의 법률 활동을 확인하세요</b><br> <b>${dto.education}</b>
			</div>
		</div>

		<div class="row">
			<div class="col-12"></div>
		</div>
		<div class="row">
			<!--
			<c:forEach var="f" items="${fileList}">
				<div class="col-12">첨부파일 : ${f.oriFileName}</div>
			</c:forEach>
			  -->
		</div>

		<c:forEach var="cmt" items="${list}">
			<div class="row">
				<div class="col-12 list"></div>
			</div>
		</c:forEach>

		<div class="row">
			<c:choose>
				<c:when test="${dto.id == sessionScope.id}">
					<div class="col-12" align=right>
						<input type=button id=back value="프로필 목록으로"> <input
							type=button id=delete value="프로필 삭제"> <input type=button
							id=modify value="프로필 수정">
					</div>
				</c:when>

				<%-- admin.id 일 때도 버튼이 보이도록 수정 : admin.id는 개발자가 결정?		
				<c:when test="${admin.id == sessionScope.id}">
					<div class="col-12" align=right>
						<input type=button id=back value="프로필 목록으로"> <input
							type=button id=delete value="프로필 삭제"> <input type=button
							id=modify value="프로필 수정">
					</div>
				</c:when>				
--%>

				<c:otherwise>
					<div class="col-12" align=right>
						<input type=button id=back value="프로필 목록으로"> <input
							type=button id=reservation value="예약하기">
						<!--
			원래 조건에 안맞으면 안보여야 하는 버튼들이지만 테스트 용으로 노출
			  -->
						<input type=button id=delete value="프로필 삭제"> <input
							type=button id=modify value="프로필 수정">

					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</body>
</html>