<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<body>
	<form action=write.profile method="post" enctype="multipart/form-data">
		<div class="container">

			<div class="form-group row">
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="header" value="프로필을 작성하세요">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm">
					<input id="title" name="title" class="form-control-plaintext"
						type="text" placeholder="제목을 입력하세요.">
				</div>
			</div>

			<div class="form-group">
				<textarea class="form-control" name="specialty"
					id="exampleFormControlTextarea1" rows="10"
					placeholder="specialty를 입력하세요."></textarea>
			</div>

			<div class="form-group">
				<textarea class="form-control" name="education"
					id="exampleFormControlTextarea1" rows="10"
					placeholder="education를 입력하세요."></textarea>
			</div>

			<div class="form-group">
				<input type=file name="file">
			</div>

			<div class="row">
				<div class="btn-group right" role="group" aria-label="Basic example">
					<button type="submit" class="btn btn-secondary" id="write">작성
						완료</button>
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