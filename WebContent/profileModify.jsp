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
<script>
	
</script>
<style>
.thumbnail img{
height : 50px;
width : auto;
}
</style>
</head>

<body>

	<form action=modify.profile?seq=${dto.seq}  method="post" enctype="multipart/form-data">
		<div class="container">

			<div class="form-group row">
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="header" value="프로필을 수정하세요">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm">
					<input id="title" name="title" class="form-control-plaintext"
						type="text" value=${dto.title}>
				</div>
			</div>

			<div class="form-group">
				<textarea class="form-control" name="specialty"
					id="exampleFormControlTextarea1" rows="10"
					 placeholder="specialty 수정">${dto.specialty}</textarea>
			</div>
			
			<div class="form-group">
				<textarea class="form-control" name="education"
					id="exampleFormControlTextarea1" rows="10"
					 placeholder="education 수정">${dto.education}</textarea>
			</div>
			
			<div class="form-group">
			<p>프로필 사진</p>
			<div class=thumbnail>
					<img
						src="http://localhost${pageContext.request.contextPath}/upload/${dto.img}"
						class="card-img" id=profileImg>
						</div>
				<input type=file name="file">
			</div>


			<div class="row">
				<div class="btn-group right" role="group" aria-label="Basic example">
					<button type="submit" class="btn btn-secondary" id="write">수정하기</button>
					<button type="button" class="btn btn-secondary" id="back">목록으로</button>
				</div>
			</div>

		</div>
	</form>
	<script>
		$("#back").on("click", function() {
			location.href = 'toProfileList.profile'
		});
	</script>
</body>
</html>