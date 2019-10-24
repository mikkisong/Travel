<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>받은 쪽지함 - 위트래블</title>
<!-- head 들어가는 곳 -->
<jsp:include page="../inc/intro.jsp" />
<!-- head 들어가는 곳 -->
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
				<li style="background-image: url(https://images.pexels.com/photos/292426/pexels-photo-292426.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);">
					<div class="overlay"></div>
					<div class="container-fluid">
						<div class="row">
							<div
								class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
								<div class="slider-text-inner text-center">
									<h2>위트래블</h2>
									<h1>받은 쪽지함</h1>
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
					<legend class="screen_out">받은 쪽지함</legend>
				<form action='<c:url value="/member/messageReceived"/>'
					method="post" name="fr">
					<div style="float: left;">
						<button type="button" onclick="location.href='sendMessage'" class="btn btn-success">쪽지쓰기</button>
					</div>
					<div style="float: right;">
						<button type="button" class="btn btn-danger">삭제</button>
						<button type="button" class="btn btn-sm btn-primary">보관</button>
					</div>
				</form>
				<table class="table">
					<thead>
						<tr>
							<th class="header" width="100">보낸 사람</th>
							<th class="header" width="600">쪽지 내용</th>
							<th class="header" width="150">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bean" items="${msgList }">
						<tr>
							<td>${bean.send_id }</td>
							<td>${bean.content }</td>
							<td>${bean.regi_date }</td>
<%-- 							<td><fmt:formatDate value="${list.regi_date }" pattern="yyyy-M-dd" /></td> --%>
						</tr>
						</c:forEach>
					</tbody>
				</table>

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