<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="../inc/intro.jsp" />
<title>최저가 항공권 결과</title>
<script src='<c:url value="/resources/assets/tour/js/common.js"/>'></script>

<!-- 그리드용 -->
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/assets/tour/jqGrid/css/jquery-ui.min.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/assets/tour/jqGrid/css/ui.jqgrid.css"/>' />
<script src='<c:url value="/resources/assets/tour/jqGrid/js/i18n/grid.locale-kr.js"/>' type="text/javascript"></script>
<script src='<c:url value="/resources/assets/tour/jqGrid/js/minified/jquery.jqGrid.min.js"/>' type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


<script type="text/javascript">
$(document).ready(function () {

	$(".btnTimeAsc").click(function () { SortAsc("5"); return false; });
	$(".btnTimeDesc").click(function () { SortDesc("5"); return false; });
	
	$(".btnFareAsc").click(function () { SortAsc("6"); return false; });
	$(".btnFareDesc").click(function () { SortDesc("6"); return false; });

	function SortAsc(idx) {
		  var table, rows, switching, i, x, y, shouldSwitch;
		  table = document.getElementById("flightSearchTable");
		  switching = true;
		  while (switching) {
		    switching = false;
		    rows = table.rows;
		    for (i = 1; i < (rows.length - 1); i++) {
		      shouldSwitch = false;
		      x = rows[i].getElementsByTagName("TD")[idx];
		      y = rows[i + 1].getElementsByTagName("TD")[idx];
		      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
		        shouldSwitch = true;
		        break;
		      }
		    }
		    if (shouldSwitch) {
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		    }
		  }
		}	
	function SortDesc(idx) {
		  var table, rows, switching, i, x, y, shouldSwitch;
		  table = document.getElementById("flightSearchTable");
		  switching = true;
		  while (switching) {
		    switching = false;
		    rows = table.rows;
		    for (i = 1; i < (rows.length - 1); i++) {
		      shouldSwitch = false;
		      x = rows[i].getElementsByTagName("TD")[idx];
		      y = rows[i + 1].getElementsByTagName("TD")[idx];
		      if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
		        shouldSwitch = true;
		        break;
		      }
		    }
		    if (shouldSwitch) {
		      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
		      switching = true;
		    }
		  }
		}	
	
	
	$(".btnBooking").on("click", function(e){

		var data = $(this).parent().parent();
		
		$.confirm({
		    title: '예매 확인',
		    content: '예매하시겠습니까?',
		    buttons: {
		    	예: function () {
		    	    var params = {};
		    	    
		    	    $.each(data,function(){
		    	    	if($(this).find('input[name="trip"]').val()!=""){
		    	    		params["trip"] = $(this).find('input[name="trip"]').val()
		    	    	}
		    	    	if($(this).find('input[name="date"]').val()!=""){
		    	    		params["date"] = $(this).find('input[name="date"]').val()
		    	    	}
		    	    	if($(this).find('input[name="count"]').val()!=""){
		    	    		params["count"] = $(this).find('input[name="count"]').val()
		    	    	}
		    	    	if($(this).find('input[name="comp"]').val()!=""){
		    	    		params["comp"] = $(this).find('input[name="comp"]').val()
		    	    	}	
		    	    	if($(this).find('input[name="airline"]').val()!=""){
		    	    		params["airline"] =$(this).find('input[name="airline"]').val()
		    	    	}
		    	    	if($(this).find('input[name="time"]').val()!=""){
		    	    		params["time"] = $(this).find('input[name="time"]').val()
		    	    	}
		    	    	if($(this).find('input[name="fare"]').val()!=""){
		    	    		params["fare"] = $(this).find('input[name="fare"]').val()
		    	    	}
		    	    });
		    	    
		    	    var $form = $('<form></form>');
	    	 	        $form.attr('action', '<c:url value="/airBooking"/>');
	    	 	        $form.attr('method', 'GET');
	    	 	        $form.appendTo('body');
		    	 	        var trip = $('<input type="hidden" value="'+ params["trip"] +'" name="trip">');
		    	 	        $form.append(trip);
		    	 	        var date = $('<input type="hidden" value="'+ params["date"] +'" name="date">');
		    	 	        $form.append(date);
		    	 	        var count = $('<input type="hidden" value="'+ params["count"] +'" name="count">');
		    	 	        $form.append(count);
		    	 	        var comp = $('<input type="hidden" value="'+ params["comp"] +'" name="comp">');
		    	 	        $form.append(comp);
		    	 	        var airline = $('<input type="hidden" value="'+ params["airline"] +'" name="airline">');
		    	 	        $form.append(airline);
		    	 	        var time = $('<input type="hidden" value="'+ params["time"] +'" name="time">');
		    	 	        $form.append(time);
		    	 	        var fare = $('<input type="hidden" value="'+ params["fare"] +'" name="fare">');
		    	 	        $form.append(fare);
	    	 	        $form.submit();
		    	},
		              아니오: function () {
		            Toastr("info","취소 하였습니다.");
		       }
		    }
		});
	    
	});

});

</script>
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
			   	<li style="background-image: url(https://images.pexels.com/photos/163792/model-planes-airplanes-miniatur-wunderland-hamburg-163792.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row-1">
				   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h2>위트래블</h2>
				   					<h1>최저가 항공권 결과</h1>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>

		<div id="colorlib-testimony" class="colorlib-light-grey">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
						<h3>최저가 항공권 결과</h3>
					</div>
				</div>
				<div class="row">
					<div class="form-group">
						<div class="panel panel-white">
							<div id="divInfo" class="panel-body padding-10">
								<div>
								
								<input type="button" value="빠른 시간순" class="btn btn-primary btnTimeAsc" />
								<input type="button" value="늦은 시간순" class="btn btn-primary btnTimeDesc" />
								
								<input type="button" value="높은 가격순" class="btn btn-primary btnFareDesc" />
								<input type="button" value="낮은 가격순" class="btn btn-primary btnFareAsc" />
								
									<table id="flightSearchTable" class="panel-body padding-10">
										<thead>
											<tr class="table-info">
												<th style="width: 12.5%">여행지</th>
												<th style="width: 15%">비행날짜</th>
												<th style="width: 15%">인원수</th>
												<th style="width: 10%">좌석등급</th>
									            <th style="width: 12.5%">항공사</th>
									            <th style="width: 12.5%">비행시간</th>
									            <th style="width: 12.5%">가격</th>
									            <th style="width: 10%">예매하기</th>
						       				</tr>
						     			</thead>
										<tbody>
											<c:forEach var="bean" items="${flightSearchList }">
												<tr>
													<td>
														<input name="trip" class="form-control" type="text" value="${bean.trip}" readonly="readonly">
													</td>
													<td>
														<input name="date" class="form-control" type="text" value="${bean.date}" readonly="readonly">
													</td>
													<td>
														<input name="count" class="form-control" type="text" value="${bean.count}" readonly="readonly">
													</td>
													<td>
														<input name="comp" class="form-control" type="text" value="${bean.comp}" readonly="readonly">
													</td>
													<td>
														<input name="airline" class="form-control" type="text" value="${bean.airline}" readonly="readonly">
													</td>
													<td>
														<input name="time" class="form-control" type="text" value="${bean.time}" readonly="readonly">
													</td>
													<td>
														<input name="fare" class="form-control" type="text" value="${bean.fare}" readonly="readonly">
													</td>
													<td>
														<input type="button" value="예매하기" class="btn btn-primary btn-block btnBooking" />
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
<!-- 									<div id="pager"></div>  -->
								</div>
							</div>
						</div>
					</div>
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
