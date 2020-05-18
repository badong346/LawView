<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style>
* {
	box-sizing: border-box;
}

#p_board {
	width: 600px;
	height: 500px;
	margin: auto;
	border: 1px solid black;
	overflow-y: auto;
}

.article {
	border: 1px solid black;
	float: left;
	height: 100px;
	width: 100%;
	text-align: center;
}

.title {
	border: 1px solid black;
	float: left;
	width: 80%;
	height: 25%;
	text-align: left;
	line-height: 25px;
}

.name {
	border: 1px solid black;
	float: left;
	width: 80%;
	height: 50%;
	text-align: left;
	line-height: 25px;
	text-size: 25px;
}

.phone {
	border: 1px solid black;
	color: #f56a6a;
	float: left;
	width: 80%;
	height: 25%;
	text-align: left;
	line-height: 25px;
}

.profileImg {
	border: 1px solid black;
	float : right;
	width: 20%;
	height: 100%;
	
}
  .thumbnail { 
	position: relative;
	width: 100%;
	height: 0;
	overflow: hidden;
	padding-bottom: 56.26%;
            }
            .thumbnail .centered { 
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                -webkit-transform: translate(50%,50%);
                -ms-transform: translate(50%,50%);
                transform: translate(50%,50%);
            }
            .thumbnail .centered img { 
                position: absolute;
                top: 0;
                left: 0;
                max-width: 100%; 
                height: auto;
                -webkit-transform: translate(-50%,-50%);
                -ms-transform: translate(-50%,-50%);
                transform: translate(-50%,-50%);
            }


</style>

</head>
<body>


	<div id="p_board"></div>


	<div class="col-12" align=right>
		<input type=button id=writeProfile value="프로필 작성">
	</div>


	<script>
		var pageNo = 1;
		$(function() {
			$.ajax({
						url : "profileListAjax.profile",
						data : {
							cpage : pageNo++
						},
						dataType : "json"
					})
					.done(
							function(resp) {
								console.log(resp);
								for (var i = 0; i < resp.length; i++) {

									console.log(resp[i].seq);
	<%--
			클릭한 글 seq를 넘길 때
name.append('<a href="toProfile.profile?seq=resp[i].seq">'+resp[i].name+'</a>');
java.lang.IllegalArgumentException: 요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.		
			
			resp[i].seq를 바로 get 방식으로 전송하면 인코딩 에러 발생
			
			[방법1]
			톰캣 conf/server.xml의 Connector에 다음 부분을 relaxedQueryChars 옵션을 추가
			<Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443"
           URIEncoding="UTF-8"
           relaxedQueryChars="[,]"/>
			
			[방법2]
            name.append("<a href='toProfile.profile?seq="+resp[i].seq+"'>"+resp[i].name+"</a>");
			
			 --%>
		var line = $("<div>");
									line.addClass("article")

									var title = $("<div>");
									title.addClass("title");
									title.append(resp[i].title);

									var name = $("<div>");
									name.addClass("name");
									name.append("<a href='toProfile.profile?seq="
													+ resp[i].seq
													+ "'>"
													+ resp[i].name + "</a>");

									var phone = $("<div>");
									phone.addClass("phone");
									phone.append("☎ " + resp[i].office_phone);

									var profileImg = $("<div>");
									profileImg.addClass("profileImg");
									if(resp[i].img == null){
										profileImg.append("<div class=thumbnail><div class=centered><img src='http://localhost${pageContext.request.contextPath}/upload/lawyer.png'></div></div>")

									}else{
										profileImg.append("<div class=thumbnail><div class=centered><img src='http://localhost${pageContext.request.contextPath}/upload/"+resp[i].img+"''></div></div>")

									}



									line.append(name);
									line.append(profileImg);
									line.append(title);
									line.append(phone);
									
									$("#p_board").append(line);
								}
							});
		})

		$("#p_board").on("scroll", function() {
			var board = document.getElementById("p_board");
			if (board.offsetHeight + board.scrollTop > board.scrollHeight) {
				loadData();
			}
		})
		function loadData() {
			$.ajax({
				url : "profileListAjax.profile",
				data : {
					cpage : pageNo++
				},
				dataType : "json"
			}).done(
					function(resp) {
						console.log(resp);
						for (var i = 0; i < resp.length; i++) {

							var line = $("<div >");
							line.addClass("article")

							var title = $("<div>");
							title.addClass("title");
							title.append(resp[i].title);

							var name = $("<div>");
							name.addClass("name");
							name.append("<a href='toProfile.profile?seq="
									+ resp[i].seq + "'>" + resp[i].name
									+ "</a>");

							var phone = $("<div>");
							phone.addClass("phone");
							phone.append("☎ " + resp[i].office_phone);
							
							
							var profileImg = $("<div>");
							profileImg.addClass("profileImg");
							if(resp[i].img == null){
								profileImg.append("<img src='http://localhost${pageContext.request.contextPath}/upload/lawyer.png'>")

							}else{
								profileImg.append("<img src='http://localhost${pageContext.request.contextPath}/upload/"+resp[i].img+"''>")

							}

							line.append(name);
							line.append(profileImg);
							line.append(title);
							line.append(phone);

							$("#p_board").append(line);
						}
					});

		}

			$("#writeProfile").on("click", function() {
				location.href = "profileWrite.jsp";
			})
	</script>
</body>
</html>