<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원정보 수정 - 위트래블</title>
<!-- head 들어가는 곳 -->
<jsp:include page="../inc/intro.jsp" />
<!-- head 들어가는 곳 -->
<style type="text/css">
.kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar {
    display: inline-block;
}
.kv-avatar .file-input {
    display: table-cell;
    width: 213px;
}
.kv-reqd {
    color: red;
    font-family: monospace;
    font-weight: normal;
}

</style>
<script>
var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' + 
    'onclick="alert(\'Call your custom code here.\')">' +
    '<i class="glyphicon glyphicon-tag"></i>' +
    '</button>'; 
$("#avatar-2").fileinput({
    overwriteInitial: true,
    maxFileSize: 1500,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: 'Cancel or reset changes',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="/samples/default-avatar-male.png" alt="Your Avatar"><h6 class="text-muted">Click to select</h6>',
    layoutTemplates: {main2: '{preview} ' +  btnCust + ' {remove} {browse}'},
    allowedFileExtensions: ["jpg", "png", "gif"]
});
</script>
<script src="./resources/assets/tour/js/common.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	//우편번호, 주소
	function DaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					// document.getElementById("sample6_extraAddress").value = extraAddr;
				} else {
					// document.getElementById("sample6_extraAddress").value = '';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip_code').value = data.zonecode;
				document.getElementById("address1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("address2").focus();
			}
		}).open();
	}

	// 회원수정   
	$(document)
			.ready(
					function() {

						$("#btnUpdate").click(function() {
							Save();
							return false;
						});

						var Save = function() {
							console.log("여기 오냐?");
							var orgPass = '${mb.password}'; // DB에 있는 passwrod
							var inputPass = $("#password2").val(); // from 에 있는 비밀번호
							var newPass = $("#password").val(); // 새로 입력할 비밀번호

							console.log(orgPass);
							console.log(inputPass);
							console.log(newPass);

							// 1 DB에 있는 패스워드(orgPass)랑 from에 있는 pass와 (inputPass)확인을함
							// 2. 2개가 일치하면 서브밋 일치하지 않으면 비밀번호가 일치하지 않습니다.

							//email1
							// 앞쪽 Email 입력값
							var phone1 = $("#ddlPhone").val();
							// 두번째 Email 입력값(도메인)
							var phone2 = $("#phone2").val();
							var phone3 = $("#phone3").val();
							//console.log(email);
							// Email 형식으로 저장
							var phone = phone1 + "-" + phone2 + "-" + phone3;

							// 히든에 있는 phone 에 phone 형식으로 된 데이터 입력
							$("#phone").val(phone);

							//email1
							// 앞쪽 Email 입력값

							var email1 = $("#email1").val();
							// 두번째 Email 입력값(도메인)
							var email2 = $("#email2").val();

							//console.log(email);

							// Email 형식으로 저장
							var email = email1 + "@" + email2;

							// 히든에 있는 email 에 Email 형식으로 된 데이터 입력
							$("#email").val(email);

							// 			return false;
							if (orgPass == inputPass) {
								$('#fr').submit();
							} else {
								alert("비밀번호가 일치하지 않습니다");
								return false;
							}
						};
						// 닉네임 중복확인 버튼
						$("#nickCheck").click(function() {
							if ($('#nickname').val() == "") {
								Toastr("warning", "닉네임을 입력해주세요");
								$("#nickname").focus();
								return false;
							}
							nick();
							return false;
						});
						var nick = function() {
							//Toastr("warning","아이디를 입력해주세요");
							var params = {};
							params["type"] = "Member";
							//		 	params["call_type"]="userCheck";
							params["call_type"] = "nickCheck";
							params["id"] = $('#id').val();
							params["nickname"] = $('#nickname').val();
							console.log(params);
							Ajax(params, function(pResult) {
								//var data = jQuery.parseJSON(pResult);
								console.log("pResult : " + pResult);
								console.log("pResult.data : " + pResult.data);
								//		 		Toastr("warning",pResult.data);
								if (pResult == "1") {
									Toastr("success", "닉네임 사용가능합니다.");
								} else if (pResult == "2") {
									Toastr("warning", "닉네임 중복입니다.");
								}
							}, false);
						};

						// 가입 버튼 클릭 시 입력안된 곳 말해주기
						$("#btnUpdate").click(function() {
							btnUpdate();
							return false;
						});
						var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 아이디 조건
						var getPassword = RegExp(/^[a-zA-Z0-9!@]{4,12}$/); // 비밀번호 조건

						var getName = RegExp(/^[가-힣]+$/); // 이름 조건
						var getEngName = RegExp(/^[a-zA-Z]+$/); // 영문 이름 조건

						var getBirth = RegExp(/^[0-9]{6}/); // 생일 조건

						var getPhone = RegExp(/^[0-9]{3,4}$/); // 전화번호 조건
						var getEmail = RegExp(/^[a-zA-Z0-9]{3,20}$/); // 이메일 조건

						var btnUpdate = function() {
							if ($('#password2').val() == "") {
								Toastr("warning", "이전 비밀번호를 입력해주세요");
								$("#password2").focus();
								return false;
							}
							//비밀번호 유효성검사 
							else if (!getPassword.test($("#password2").val())) {
								Toastr("warning", "비밀번호 형식에 맞게 입력해주세요");
								$("#password2").focus();
								return false;
							} else if ($('#password').val() == "") {
								Toastr("warning", "새로운 비밀번호를 입력해주세요");
								$("#password").focus();
								return false;
							}
							//비밀번호 유효성검사 
							else if (!getPassword.test($("#password").val())) {
								Toastr("warning", "비밀번호 형식에 맞게 입력해주세요");
								$("#password").focus();
								return false;
							} else if ($('#password').val() != $('#password2')
									.val()) {
								Toastr("warning", "비밀번호가 일치하지않습니다");
								$("#password").focus();
								return false;
							} else if ($('#name').val() == "") {
								Toastr("warning", "이름을 입력해주세요");
								$("#name").focus();
								return false;
							}
							//이름 유효성 검사 
							else if (!getName.test($("#name").val())) {
								Toastr("warning", "이름 형식에 맞게 입력해주세요");
								$("#name").focus();
								return false;
							} else if ($('#eng_name').val() == "") {
								Toastr("warning", "영문 이름을 입력해주세요");
								$("#eng_name").focus();
								return false;
							}
							//영문 이름 유효성 검사 
							else if (!getEngName.test($("#eng_name").val())) {
								Toastr("warning", "영문 이름 형식에 맞게 입력해주세요");
								$("#eng_name").focus();
								return false;
							} else if ($('#nickname').val() == "") {
								Toastr("warning", "닉네임을 입력해주세요");
								$("#nickname").focus();
								return false;
							} else if ($('#birth').val() == "") {
								Toastr("warning", "생년월일을 입력해주세요");
								$("#birth").focus();
								return false;
							}
							//생년월일 유효성 검사 
							else if (!getBirth.test($("#birth").val())) {
								Toastr("warning", "생년월일 형식에 맞게 입력해주세요");
								$("#birth").focus();
								return false;
							}
							// 			else if ($("select[id$=selPhone]".val("")){
							// 				Toastr("warning","국번을 입력해주세요");	
							// 			}
							else if ($('#ddlPhone').val() == "") {
								Toastr("warning", "국번을 선택해주세요");
								return false;
							} else if ($('#phone2').val() == "") {
								Toastr("warning", "전화번호 앞자리를 입력해주세요");
								$("#phone2").focus();
								return false;
							}
							//전화번호 유효성 검사 
							else if (!getPhone.test($("#phone2").val())) {
								Toastr("warning", "전화번호 형식에 맞게 입력해주세요");
								$("#phone2").focus();
								return false;
							} else if ($('#phone3').val() == "") {
								Toastr("warning", "전화번호 뒷자리를 입력해주세요");
								$("#phone3").focus();
								return false;
							}
							//전화번호 유효성 검사 
							else if (!getPhone.test($("#phone3").val())) {
								Toastr("warning", "전화번호 형식에 맞게 입력해주세요");
								$("#phone3").focus();
								return false;
							} else if ($('#email1').val() == "") {
								Toastr("warning", "이메일을 입력해주세요");
								$("#email1").focus();
								return false;
							}
							//이메일 유효성 검사 
							else if (!getEmail.test($("#email1").val())) {
								Toastr("warning", "이메일 형식에 맞게 입력해주세요");
								$("#email1").focus();
								return false;
							} else if ($('#email2').val() == "") {
								Toastr("warning", "이메일을 입력해주세요");
								$("#email2").focus();
								return false;
							} else if ($("input:radio[name=gender]:checked").length < 1) {
								Toastr("warning", "성별을 선택해주세요");
								return false;
							}

							//phone1
							// 앞쪽 phone 입력값
							var phone1 = $("#ddlPhone").val();
							// 두번째 phone 입력값(도메인)
							var phone2 = $("#phone2").val();
							var phone3 = $("#phone3").val();
							//console.log(email);
							// Email 형식으로 저장
							var phone = phone1 + "-" + phone2 + "-" + phone3;
							// 히든에 있는 phone 에 phone 형식으로 된 데이터 입력
							$("#phone").val(phone);

							//email1
							// 앞쪽 Email 입력값
							var email1 = $("#email1").val();
							// 두번째 Email 입력값(도메인)
							var email2 = $("#email2").val();
							//console.log(email);
							// Email 형식으로 저장
							var email = email1 + "@" + email2;
							// 히든에 있는 email 에 Email 형식으로 된 데이터 입력
							$("#email").val(email);
							// 			console.log(phone);
							// 			console.log($("#phone").val());
							// 			console.log($("#email").val());
							//return false;

							$('#fr')[0].submit();
						};

						// 셀렉트 이벤트
						// 이메일
						$("select[id$=ddlEmail]")
								.change(
										function() {
											if ($("select[id$=ddlEmail]").val() != "05") {
												$("#email2")
														.val(
																$(
																		"select[id$=ddlEmail] option:selected")
																		.text());
											} else {
												$("#email2").val("");
												$('#email2').focus();
											}
										});
						$("select[id$=ddlEmail]")
								.change(
										function() {
											if ($("select[id$=ddlEmail]").val() != "05") {
												$("#email2")
														.val(
																$(
																		"select[id$=ddlEmail] option:selected")
																		.text());
											} else {
												$("#email2").val("");
												$('#email2').focus();
											}
										});
						return true;
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
				<li style="background-image: url(https://cdn.pixabay.com/photo/2017/08/14/22/05/passport-2642170__340.jpg);">
					<div class="overlay"></div>
					<div class="container-fluid">
						<div class="row">
							<div
								class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
								<div class="slider-text-inner text-center">
									<h2>위트래블</h2>
									<h1>회원정보 수정</h1>
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
			<div  id="kv-avatar-errors-2" class="center-block" >
					<legend class="screen_out">회원 수정</legend>
					<form action='<c:url value="/update"/>' class="form-inline2" method="post" name="fr" id="fr">
				<div class="row">
						<div class="col-md-9 col-sm-9 animate-box">
							<input type="hidden" name="idcheck">
							<div class="form-group">
								<label for="id">아이디</label> <input type="text"
									class="form-control2" id="id" name="id" value="${mb.id}"
									readonly>
							</div>

							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control2" id="password2" name="password2"
									placeholder="Password" required="required">
							</div>
							<div class="form-group">
								<label for="password">새로운 비밀번호</label> <input type="password"
									class="form-control2" id="password" name="password"
									placeholder="Password">
							</div>

							<div class="form-group">
								<label for="name">이름</label> <input type="text"
									class="form-control2" id="name" name="name" value="${mb.name}">
							</div>

							<div class="form-group">
								<label for="eng_name">영문 이름</label> <input type="text"
									class="form-control2" id="eng_name" name="eng_name"
									value="${mb.eng_name }">
							</div>

							<div class="form-group2  mr-2">
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control2" id="nickname" name="nickname"
									style="width: 460px;" value="${mb.nickname }">
							</div>
							<div class="form-group2  mr-2">
								<button type="button" class="btn btn-primary" id="nickCheck"
									name="nickCheck">중복확인</button>
							</div>

							<div class="row form-group">
								<div class="col-md-3">
									<label for="phone1">전화번호</label> ${ddlPhone }
								</div>
								<div class="col-md-3 padding-bottom">
									<label for="phone2"> </label> <input type="text" id="phone2"
										name="phone2" class="form-control3" value="${phone2 }">
								</div>
								<div class="col-md-3">
									<label for="phone3"> </label> <input type="text" id="phone3"
										name="phone3" class="form-control3" value="${phone3 }">
								</div>
								<input type="hidden" name="phone" id="phone">
							</div>

							<div class="row form-group">
								<div class="col-md-3 padding-bottom">
									<label for="email1">이메일</label> <input type="text" id="email1"
										name="email1" class="form-control3" value="${email1 }">
								</div>
								<div class="col-md-3" style="width: 75px;">
									<label for="email"> </label> <input type="text"
										class="form-control4" value="@" style="padding: 1em;" disabled>
								</div>
								<div class="col-md-3">
									<label for="email2"> </label> <input type="text" id="email2"
										name="email2" class="form-control3" value="${email2 }">
								</div>
								<div class="col-md-3">
									<label for="email3"> </label> ${ddlEmail }
								</div>

								<input type="hidden" name="email" id="email">
							</div>

							<div class="form-group2 mr-2">
								<label for="zip_code">우편번호</label> <input type="text"
									class="form-control2" id="zip_code" name="zip_code"
									style="width: 420px;" value="${mb.zip_code }" readonly>
							</div>
							<div class="form-group2 mr-2">
								<button type="button" onclick="DaumPostcode()"
									class="btn btn-primary">우편번호 찾기</button>
							</div>
							<div class="form-group">
								<label for="address1">주소</label> <input type="text"
									class="form-control2" id="address1" name="address1"
									value="${mb.address1 }" readonly>
							</div>
							<div class="form-group">
								<label for="address2">상세 주소</label> <input type="text"
									class="form-control2" id="address2" name="address2"
									value="${mb.address2 }">
							</div>

						</div>
				</div>
						<button type="submit" class="btn btn-success" id="btnUpdate">수정하기</button>
					</form>
			</div>
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