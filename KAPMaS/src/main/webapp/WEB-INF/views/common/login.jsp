<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!empty loginUser }">
	<script>
		location.href="<%=request.getContextPath()%>/index.do";
	</script>
</c:if>

<!DOCTYPE html>
<html lang="en"><head>
	<meta charset="utf-8">
	<title>KAPMaS | Login</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
	<meta content="" name="description">
	<meta content="" name="author">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico">
	<link rel="icon" href="<%=request.getContextPath() %>/resources/images/favicon.ico">
	<!-- ================== BEGIN core-css ================== -->
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/vendor.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/default/app.min.css" rel="stylesheet">
	<!-- ================== END core-css ================== -->
	
	<link href="<%=request.getContextPath() %>/resources/css/css.css" rel="stylesheet">
	
</head>
<body class="pace-done pace-top">
	<div class="pace pace-inactive">
		<div class="pace-progress" data-progress-text="100%"
			data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
			<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>
	<!-- BEGIN #loader -->
	<div id="loader" class="app-loader loaded">
		<span class="spinner"></span>
	</div>
	<!-- END #loader -->

	<!-- BEGIN #app -->
	<div id="app" class="app">
		<!-- BEGIN login -->
		<div class="login login-with-news-feed">
			<!-- BEGIN news-feed -->
			<div class="news-feed">
				<div class="news-image" style="background-image: url(<%=request.getContextPath() %>/resources/images/wallpaper/login-wallpaper.jpg)"></div>
				<div class="news-caption">
					<h4 class="caption-title">
						<b>KAPMaS</b>
					</h4>
					<p>Knoledge And Project Management System</p>
					<p>???????????? ?????? ?????? ?????? ?????????
					</p>
				</div>
			</div>
			<!-- END news-feed -->

			<!-- BEGIN login-container -->
			<div class="login-container">
				<!-- BEGIN login-header -->
				<div class="login-header mb-30px">
					<div class="brand">
						<div class="d-flex align-items-center">
						<img src="<%=request.getContextPath() %>/resources/images/logo-remove.png" alt="" style="width: 300px">
						</div>
						<small>Knoledge And Project Management System</small>
					</div>
					<div class="icon">
						<i class="fa fa-sign-in-alt"></i>
					</div>
				</div>
				<!-- END login-header -->

				<!-- BEGIN login-content -->
				<div class="login-content">
					<form action="<%=request.getContextPath() %>/common/login.do" method="post" role="signIn">
						<div class="form-floating mb-15px">
							<input type="text" class="form-control h-45px fs-13px" placeholder="Email Address" id="ID" name="id">
							<label for="emailAddress" class="d-flex align-items-center fs-13px text-gray-600">ID</label>
						</div>
						<div class="form-floating mb-15px">
							<input type="password" class="form-control h-45px fs-13px" placeholder="Password" id="password" name="pwd">
							<label for="password" class="d-flex align-items-center fs-13px text-gray-600">Password</label>
						</div>
						<div class="mb-15px">
							<button type="submit" class="btn btn-inverse d-block h-45px w-100 btn-lg fs-14px">Sign In</button>
						</div>
						<div class="mb-40px pb-40px text-inverse row">
							<div class="col-6 text-center">
								<a href="<%=request.getContextPath() %>/emp/registForm.do" class="text-inverse">Sign Up</a>
							</div>
							<div class="col-6 text-center">
								<a href="<%=request.getContextPath() %>/emp/findForm.do" class="text-inverse">Find Password</a>
							</div>
						</div>
						<div>
							<div class="row">
								<div class="col-6">
									<select id="loginSelectBox" class="form-control"onchange="loginSelect();">
										<option>????????? ??? ????????? ???????????????</option>
										<option>?????????</option>
										<option>?????????</option>
										<option>?????????</option>
										<option>?????????</option>
										<option>?????????</option>
										<option>?????????</option>
										<option>?????????</option>
									</select>
								</div>
							</div>
						</div>
						<hr class="bg-gray-600 opacity-2">
						<div class="text-gray-600 text-center text-gray-500-darker mb-0">
							?? Persie Choi All Right Reserved 2021</div>
					</form>
				</div>
				<!-- END login-content -->
			</div>
			<!-- END login-container -->
		</div>
		<!-- END login -->
	</div>
	<!-- END #app -->
</body>
<!-- ================== BEGIN core-js ================== -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/transparent.min.js"></script>
<!-- ================== END core-js ================== -->

<script type="text/javascript">
var id = "";
var pwd = "";
function loginSelect(){
	var id = $('#loginSelectBox').val();
	switch(id){
		case "?????????" : id = "kdhz1001"; pwd = "enen1590"; break;
		case "?????????" : id = "asd"; pwd = "asd"; break;
		case "?????????" : id = "zoozoo"; pwd = "zoozoo"; break;
		case "?????????" : id = "persie_0"; pwd = "qwerty"; break;
		case "?????????" : id = "cololo11"; pwd = "qweqwe"; break;
		case "?????????" : id = "kshz0726"; pwd = "enen1590"; break;
		case "?????????" : id = "admin"; pwd = "admin"; break;
	}
	$('input[name="id"]').val(id);
	$('input[name="pwd"]').val(pwd);
}
</script>
</html>
