<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>쪽지 쓰기 - 위트래블</title>
<!-- head 들어가는 곳 -->
<jsp:include page="../inc/intro.jsp" />
<!-- head 들어가는 곳 -->
<script src='<c:url value="/resources/assets/tour/js/common.js"/>'></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#sendMessageSelf").click(function () {sendMessageSelf(); return false;});
	
	var sendMessageSelf = function() {
		var nickname = "${sessionScope.nickname }";
// 		console.log(nickname);
		$('#receive_id').val(nickname);
	};
	
	
	
	
});

</script>

</head>
<body>
	<div class="colorlib-loader"></div>
	<div id="page"></div>
	<nav class="colorlib-nav" role="navigation">
		<!-- 탑메뉴 들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 탑메뉴 들어가는 곳 -->
	</nav>
	<aside id="colorlib-hero">
		<div class="flexslider">
			<ul class="slides">
				<li style="background-image: url(https://images.pexels.com/photos/1753312/pexels-photo-1753312.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);">
					<div class="overlay"></div>
					<div class="container-fluid">
						<div class="row">
							<div
								class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
								<div class="slider-text-inner text-center">
									<h2>위트래블</h2>
									<h1>쪽지 쓰기</h1>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</aside>
	<article>
		<div id="colorlib-blog">
			<div class="container">
				<legend class="screen_out">쪽지 쓰기</legend>
				<form action='<c:url value="/sendMessage"/>' role="form" method="post" name="fr" class="form-inline2">
					<input type="hidden" id="send_id" name="send_id" value=${id }>
					<div class="form-group2 mr-2">
						<label>받는 사람(닉네임)</label>
					</div>
					<div class="form-group2 mr-2">
						<label><button id="sendMessageSelf">내게쓰기</button></label>
					</div>
					<div class="form-group2 mr-2">
					<c:choose>
					<c:when test="${nickname ne null }">
					<input type="text" class="form-control2" id="receive_id" name="receive_id" style="width: 221%;" value="${nickname }" >
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control2" id="receive_id" name="receive_id" style="width: 221%;" required="required" >
					</c:otherwise>
					</c:choose>
					</div><br>
					<div class="form-group2 mr-2">
						<label>제목</label>
						<input type="text" class="form-control2" id="subject" name="subject" style="width: 221%;" required="required">
					</div>
						<input type="text" class="form-control2" id="content" name="content" size="40" style="height: 300px;"> <br>
					<div class="form-group2 text-left">
						<button type="submit" class="btn btn-sm btn-success" id="btnsend" name="btnsend">보내기</button>
						<button type="reset" class="btn btn-sm btn-danger" id="btnCancel">취소</button>
					</div>
				</form>
			</div>
		</div>
	</article>

	<!-- 맨위로 가게하는 버튼 -->
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>

	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
</body>
</html>