<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
	<form>
			<div class="form-group">
				<label for="pwDuplcheckInput">비밀번호를 다시 입력해주세요.</label> 
				<input type="password" class="form-control" name="pwDuplcheck" id="pwDuplcheckInput">
			</div>
			<input type='button' id='pwduplcheckB' class='btn btn-primary' value='확인'>
		</form>
		<script>
			$("#pwduplcheckB").on("click", function(){
				$.ajax({
					url:'lpwduplcheck.dupl',
					type:'post',
					data: { pw : $("#pwDuplcheckInput").val()}
				}).done(function(resp){
					resp = JSON.parse(resp);
					if(resp[0].dupl == 'true'){
						alert("비밀번호가 맞습니다.");
	        			$("#lawModify", opener.document).css("display", 'none');
	        			$("#modi_del", opener.document).css("display", 'inline');
	        			$("#delete", opener.document).css("display", 'inline');
	        			$(".pwform", opener.document).css('display', "block");
	        			$("#pw", opener.document).attr("readonly", false);
	    				$("#pwConfirm", opener.document).attr("readonly", false);
	    				$("#name", opener.document).attr("readonly", false);
	    				$("#email", opener.document).attr("readonly", false);
	    				$("#phone", opener.document).attr("readonly", false);
	    				$("#office_name", opener.document).attr("readonly", false);
	    				$("#office_phone", opener.document).attr("readonly", false);
	    				$("#zipcodeB", opener.document).attr("disabled", false);
	    				$("#test", opener.document).attr("disabled", false);
	    				$("#test_num", opener.document).attr("disabled", false);
	    				$("[name=gender]", opener.document).attr("disabled", false);
	    				$("#birth", opener.document).attr("readonly", false);
						
						window.close();
					}else if(resp[0].dupl == 'false'){
						alert("비밀번호가 틀립니다. 다시 입력해주세요.");
						$("#pwDuplcheckInput").val("");
					}				
				})
			})
		</script>
</body>
</html>