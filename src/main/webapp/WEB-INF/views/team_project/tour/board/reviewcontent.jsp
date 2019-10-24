<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML>
<html>
   <head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>후기게시판 - 위트래블</title>
<!-- head 들어가는 곳 -->
   <jsp:include page="../inc/intro.jsp" />
<!-- head 들어가는 곳 -->

<style type="text/css">
   .row-1 {
       margin-left: -15px;
       margin-right: -15px;
   }
   .recentlist {
      float: left;
      margin: 50px 0 50px 10px;
   
   }
   .hotlist{
      float:left;
      margin: 50px 10px 50px 0;
   }
   
</style>

<link rel="stylesheet" href="./resources/assets/tour/css/fixed-table.css">
<script src="./resources/assets/tour/js/common.js"></script>

<!-- 그리드용 -->
<link rel="stylesheet" type="text/css" media="screen" href="./resources/assets/tour/jqGrid/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="./resources/assets/tour/jqGrid/css/ui.jqgrid.css" />
<script src="./resources/assets/tour/jqGrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
<script src="./resources/assets/tour/jqGrid/js/minified/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">
   $(document).ready(function(){
      // 추천
      $("#btnRecommendUp").click(function () {recommendUp();});
      $("#btnRecommendDown").click(function () {recommendDown();});
      // 댓글 좋아요 싫어요
      $(".btnLike").click(function () {
         var idx = $(this).attr('name'); 
         console.log(idx);
         Like(idx);
      });
      $(".btnHate").click(function () {
         var idx = $(this).attr('name'); 
         console.log(idx);
         Hate(idx);
         });
      
      // 댓글 수정 삭제
      $(".btnComDelete").click(function () {
         var idx = $(this).attr('id');
//          console.log(idx);
         comDelete(idx);
      });

      
      var recommendUp = function() {
         var params = {};
          params["type"] = "Board";
          params["call_type"] = "getRecommendCountUp";
          params["seq"] = ${Article.seq };
          console.log(params);
          Ajax(params, function(pResult) {
              console.log(pResult);
              $('#recommend_count').html(pResult);
          },false);
      };
      
      var recommendDown = function() {
         var params = {};
          params["type"] = "Board";
          params["call_type"] = "getRecommendCountDown";
          params["seq"] = ${Article.seq };
          console.log(params);
          Ajax(params, function(pResult) {
              console.log(pResult);
              $('#recommend_count').html(pResult);
          },false);
      };
      
      var Like = function(idx) {
         var params = {};
          params["type"] = "Board";
          params["call_type"] = "getLike";
          params["seq"] = idx;
          console.log(params);
          Ajax(params, function(pResult) {
              console.log("like : " + pResult);
              $('#like_count_'+idx).html(pResult);
          },false);
      };
      
      var Hate = function(idx) {
         var params = {};
          params["type"] = "Board";
          params["call_type"] = "getHate";
          params["seq"] = idx;
          console.log(params);
          Ajax(params, function(pResult) {
              console.log("hate : " + pResult);
              $('#hate_count_'+idx).html(pResult);
          },false);
      };
      
      var comDelete = function(idx) {
         $.confirm({
             title: '댓글 삭제',
             content: '삭제하시겠습니까?',
             buttons: {
                삭제: function () {
                   var params = {};
                   params["type"] = "Board";
                   params["call_type"] = "comDelete";
                   params["seq"] = idx;
                   console.log(params);
                   Ajax(params, function(pResult) {
                       console.log(pResult);
                       $('.idx').parent().parent().remove();;
                   },false);
                },
                        취소: function () {
                  Toastr("info","삭제취소 하였습니다.");
                }
             }
         });
         
      };
      
   });

</script>

<script>
    function share() {
      var url = encodeURI(encodeURIComponent(myform.url.value));
      var title = encodeURI(myform.title.value);
      var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
      document.location = shareURL;
    }
  </script>
</head>
<body>

<c:set var="session_id" value="${sessionScope.id}" />

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
               <li style="background-image: url(https://images.pexels.com/photos/1000443/pexels-photo-1000443.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940);">
                  <div class="overlay"></div>
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
                           <div class="slider-text-inner text-center">
                              <h2>리얼트래블러의</h2>
                              <h1>여행후기</h1>
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
            <div>
               <table class="table table-hover">
                  <tr>
                     <td>작성자 : ${Article.nickName }</td>
                     <td>작성일 : <fmt:formatDate value="${Article.regi_date }" pattern="yyyy-M-dd HH:mm" /></td>
                     <td>조회수 : ${Article.readcount }</td>
                     <td>추천수 : <span id="recommend_count">${Article.recommend }</span></td>
                  </tr>
                  <tr>
                     <td colspan="4">제목 :   ${Article.subject }</td>
                  </tr>
                  <tr>
                     <td colspan="4"><br>${Article.content }</td>
                  </tr>
                  <tr>
<%--                      <td><a href='<c:url value="tourreview"/>'>목록으로</a></td> --%>
                     <td><c:if test='${sessionScope.id == Article.regi_id}'>
                        <input type="button" value="글수정" onclick="location.href='<c:url value="/reviewUpdate?seq=${Article.seq }"/>'" >
                        <input type="button" value="글삭제" onclick="delete1()">
                        </c:if>
                        <input type="button" value="글목록" onclick="back()" >
                        <script type="text/javascript">
                        function delete1(){
                           var result = confirm("게시물을 삭제하시겠습니까?");
                           if(result == true) {
                              location.href = '<c:url value="/review/delete?seq=${Article.seq }"/>';
                              } 
                        }
                        
                        function back(){
                           history.back();
                        }
                        </script>
                        </td>
                     <td>
                      <form id="myform">
						    <input type="hidden" id="url" value="${requestScope['javax.servlet.forward.request_uri']}"><br/>
						    <input type="hidden" id="subject" value="${Article.subject }"><br/>
						  </form>
<!-- 						  <input type="button" onclick="share()"/> -->
						  	
                     </td>
                     <td>
                        <c:if test='${session_id != null}'>
                           <button id="btnRecommendUp">추천하기</button>
                           <button id="btnRecommendDown">추천취소</button>
                        </c:if>
<span>
	<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
	<script type="text/javascript">
	new ShareNaver.makeButton({"type": "d"});
	</script>
</span>
                     </td>
                  </tr>
               </table>
               
            <!--    comment table -->
            
               <table class="table table-hover">
                  <tr><td colspan="5" align="center">Comment</td></tr>
                     <tr>
                        <td width="10%" align="center" width="100">ID</td><td width="80%" colspan="4">Content</td>
                     </tr>
                     <tr>
                     
                        <c:choose>
                           <c:when test='${sessionScope.id != null}'>
                              <form action='<c:url value="reviewComment "/>' method="post" name="fr">
                              <input type="hidden" name="board_seq" value="${Article.seq }">
                                 <td align="center" width="10%">
                                 <c:choose>
									<c:when test="${sessionScope.profile eq null }">
										<c:if test="${sessionScope.gender eq '02' }">
											<img src="resources/upload/profile/female.jpg" alt="Avatar" style="width:50px;">
										</c:if>
										<c:if test="${sessionScope.gender eq '01' }">
											<img src="resources/upload/profile/male.jpg" alt="Avatar" style="width:50px;">
										</c:if>
									</c:when>
									<c:otherwise>
										<img src="resources/upload/profile/${sessionScope.profile }" alt="Avatar" style="width:50px;">					
									</c:otherwise>
								</c:choose>	
                                 ${sessionScope.nickName }</td>
                                 <td colspan="4" width="80%">
                                    <textarea name="content" cols="80" rows="3"></textarea>
                                    <input type="submit" name="resister" value="댓글쓰기">
                                 </td>
                              </form>
                           </c:when>
                           <c:otherwise>
                              <td colspan="5" align="center">
                                 <textarea name="content" cols="80" rows="3">로그인 이후 코멘트 작성을 하실 수 있습니다.</textarea>
                              </td>
                           </c:otherwise>
                        </c:choose>
                     </tr>      
                  <c:forEach var="bean" items="${commentList }">
                     <tr>
                        <td class="row" width="20%">
                           <c:choose>
                              <c:when test="${bean.profile eq null }">
                                 <c:if test="${bean.gender eq '02' }">
                                    <img src="resources/upload/profile/female.jpg" alt="Avatar" style="width:50px; border-radius: 50%;">
                                 </c:if>
                                 <c:if test="${bean.gender eq '01' }">
                                    <img src="resources/upload/profile/male.jpg" alt="Avatar" style="width:50px; border-radius: 50%;">
                                 </c:if>
                              </c:when>
                              <c:otherwise>
                                 <img src="resources/upload/profile/${bean.profile }" alt="Avatar" style="width:50px; border-radius: 50%;">               
                              </c:otherwise>
                           </c:choose>   
                           ${bean.nickname }
                        </td>
                        <td width="40%" class="commentContent">${bean.content }</td>
                        <td width="10%"><button id="like_${bean.seq }" class="btnLike" name="${bean.seq }">좋아요</button> : <span id="like_count_${bean.seq }">${bean.likeCount }</span></td>
                        <td width="10%"><button id="hate_${bean.seq }" class="btnHate" name="${bean.seq }">싫어요</button> : <span id="hate_count_${bean.seq }">${bean.hateCount }</span></td>
                        <td width="10%"><fmt:formatDate value="${bean.regi_date }" pattern="yyyy-M-dd" /></td>
                        <td width="10%">
<%--                            <c:if test='${session_id == bean.regi_id }'> --%>
<%--                               <button class="btnComDelete" id='${bean.seq }'>삭제하기</button> --%>
<%--                            </c:if> --%>
                        </td>
                     </tr>
                  </c:forEach>
                     
                  </table>
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