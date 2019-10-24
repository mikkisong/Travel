<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>위스타그램 - 위트래블</title>
<!-- head 들어가는 곳 -->
<jsp:include page="../inc/intro.jsp" />
<!-- head 들어가는 곳 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/assets/tour/css/fixed-table.css">
<script src="./resources/assets/tour/js/common.js"></script>
<script type="text/javascript">
	function galleryRecommend(seq) {
		console.log(seq);
		galleryRecommend(seq);
	};
	var galleryRecommend = function(seq) {
		var params = {};
   		params["type"] = "Board";
   		params["call_type"] = "getGalleryRecommendCount";
   		params["seq"] = seq ;
   		console.log(params);
   		Ajax(params, function(pResult) {
   	 		console.log(pResult);
   	 		$('.galleryRecommenCount_'+seq).html("♥"+pResult);
   		},false);
	};
	$(document).ready(function(){
		// 추천
	});

</script>

<style type="text/css">


.container1 {
  margin-right: auto;
  margin-left: auto;
  padding-left: 15px;
  padding-right: 15px;
}
.container1:before, .container1:after {
  content: " ";
  display: table;
}
.container1:after {
  clear: both;
}
@media (min-width: 768px) {
  .container1 {
    width: 750px;
  }
}
@media (min-width: 992px) {
  .container1 {
    width: 970px;
  }
}
@media (min-width: 1200px) {
  .container1 {
    width: 1270px;
  }
}

  .col-md-12-1 {
      
    width: 100%;
  }
  
  @media (min-width: 992px) {
   .col-md-12-1 { float: left;
  }  
  
  .col-md-12-1 {
  position: relative;
  min-height: 1px;
  padding-left: 15px;
  padding-right: 15px;
}

.modal-image{
/* 	width: 830px; */
	height: auto;
	width: 100%;
	display: block;
 	background-size: cover; 
    background-position: center center;
    background-repeat: no-repeat;
    position: relative;
    margin: 1em auto 1em auto;
    
/*      display: block; */
/*  	 margin-left: auto; */
/*   	margin-right: auto; */
}

.modal-text {
	margin-left: 1em;
}

</style>
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">

			<!-- 탑메뉴 들어가는 곳 -->
			<jsp:include page="../inc/top.jsp" />
			<!-- 탑메뉴 들어가는 곳 -->


			
		</nav>
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(https://images.pexels.com/photos/2325446/pexels-photo-2325446.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h2>마치 여행지에 와있는 듯한</h2>
				   					<h1>위스타그램</h1>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>

		<div class="colorlib-wrap">
			<div class="container1">
				<div class="row">
					<div class="col-md-12">
						<div class="row" style="margin-left: -25px; margin-right: -55px;">
							<div class="wrap-division">
												<% String id = (String)session.getAttribute("id");
													if(id != null){
													%>
													<div>
													<input id="imageupload" class="btn btn-primary" style="float: right;" type="button" value="사진등록" onclick="location.href='<c:url value="/imageUpload"/>'"> 
													</div>
													<%} %>	
													<c:choose>
												<c:when test="${realId ne null }">
												<legend class="screen_out">${realId }님의 위스타그램</legend>	
												</c:when>
												<c:otherwise>
												<legend class="screen_out">위스타그램</legend>	
												</c:otherwise>
												</c:choose>
							<c:forEach var="board" items="${board }">
							<div class="container2">
								<div class="col-md-6 col-sm-6 animate-box">
									<div class="hotel-entry">
<!-- 										<a href="hotel-room.html" class="hotel-img" -->
<!-- 										 data-toggle="modal" data-target="#myModal"  -->
<!-- 										style="background-image: url();"> -->
										<a href="hotel-room.html" class="hotel-img"
										 data-toggle="modal" data-target="#myModal${board.seq }" 
										style="background-image: url(resources/upload/${board.path1}); height: 360px; margin: 1em;">
<!-- 										<a href="hotel-room.html" class="hotel-img" -->
<%-- 										 data-toggle="modal" data-target="#myModal${board.seq }"  --%>
<!-- 										style="background-image: url(https://images.pexels.com/photos/2622179/pexels-photo-2622179.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);"> -->
											<p class="price"><small class="galleryRecommenCount_${board.seq }"> ♥ ${board.recommend }</small></p>
										</a>
										<div class="desc">
											<span class="place">${board.etc1 }</span>
										</div>
									</div>
								</div>
								
								<div class="modal fade myModal" id="myModal${board.seq }" role="dialog">
								    <div class="modal-dialog modal-lg">
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title" style="margin: 0 0 0 2em;">${board.etc1 }</h4>
								          
								        </div>
								        <div class="modal-body">
								        	<div style="box-sizing: border-box; display: block; 
								        	background-image: url(resources/upload/${board.path1}); background-size:cover;
								        	width: 800px; height: 800px; margin: 0 auto; background-position: center center;
								        	">
								        		
<%-- 								        		<img src="resources/upload/${board.path1}" --%>
<!-- 								        		class="modal-image" data-width="800" data-height="800" style="max-width: 800px;"> -->
								        	</div>
								        	<div>
									          <p class="modal-text" style="margin: 1em 0 0 3em;">${board.content }</p>
									          <p class="modal-text" style="color: gray;margin: 1em 0 1em 3em;">by <a href='<c:url value="/galleryId?board_id=gallery&regi_id=${board.regi_id }"/>'>${board.regi_id }</a></p>
									        </div>
									        <div>
									        	<button onclick='galleryRecommend("${board.seq }")' class="galleryRecommenCount_${board.seq }" >♥ ${board.recommend }</button>
									        </div>
								        </div>
								        <div class="modal-footer">
								        	<c:if test="${id eq board.regi_id }">
								        	<a href='<c:url value="/imageDelete?seq=${board.seq }"/>'>Delete</a>
								        	
								          	</c:if>
								          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								        </div>
								      </div>
								    </div>
								  </div>
							</div>
							</c:forEach>
							
							
							</div>
						</div>
						
					</div>

					<!-- SIDEBAR-->
<!-- 					<div class="col-md-3"> -->
						
<!-- 							<div class="side animate-box"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-md-12-1" style="padding: 0 0 0 80px;"> -->
<!-- 										<h3 class="sidebar-heading">#요즘인기 -->
<!-- 										<img src="http://cfile225.uf.daum.net/image/9936B2455CF6F45919E9BB" -->
<!-- 										width="30px" height="30px" -->
<!-- 										></h3> -->
<!-- 										<form method="post" class="colorlib-form-2"> -->
<!-- 										   <div class="form-check"> -->
<!-- 												<input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 												<label class="form-check-label" for="exampleCheck1"> -->
<!-- 													<h4 class="place">&nbsp;유럽</h4> -->
<!-- 												</label> -->
<!-- 										   </div> -->
<!-- 										   <div class="form-check"> -->
<!-- 										      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 										      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 													<h4 class="place">&nbsp;북미</h4> -->
<!-- 												</label> -->
<!-- 										   </div> -->
<!-- 										   <div class="form-check"> -->
<!-- 										      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 										      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 													<h4 class="place">&nbsp;동남아</h4> -->
<!-- 												</label> -->
<!-- 										   </div> -->
<!-- 										   <div class="form-check"> -->
<!-- 										      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 										      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 													<h4 class="place">&nbsp;프랑스</h4> -->
<!-- 												</label> -->
<!-- 										   </div> -->
<!-- 										   <div class="form-check"> -->
<!-- 										      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 										      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 													<h4 class="place">&nbsp;이탈리아</h4> -->
<!-- 												</label> -->
<!-- 										   </div> -->
<!-- 										</form> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
		<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />


	</body>
</html>

