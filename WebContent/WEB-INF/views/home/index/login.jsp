<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>小白酒店|登陆页面</title>
	<meta charset="UTF-8">
	<meta name="Author" content="小白酒店">
	<meta name="Keywords" content="酒店管理系统">
	<meta name="Description" content="酒店管理系统">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home/login/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home/login/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home/login/css/main.css">
</head>

<body>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/resources/home/login/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-49">用户登录</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
						<span class="label-input100">用户名</span>
						<input class="input100" id="name" type="text" name="uname" placeholder="请输入用户名">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="请输入密码">
						<span class="label-input100">密码</span>
						<input class="input100" id="password" type="password" name="upwd" placeholder="请输入密码">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					</br>
					
					<div class="codes" style="margin-top: 25px;">
					<input id="vcode" maxlength="4" type="text" class="blur" placeholder="请输入验证码" /> <img id="cpacha-img" src="../system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha"
						onclick="changeVcode()" class="code" style="cursor: pointer;" />
					<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					</br>
					
					<div class="text-right p-t-8 p-b-31">
						<a href="reg">亲，还没有账号？快来注册吧!</a>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="bt_login" style="cursor: pointer">登 录</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	
	
	
	<script src="../resources/home/js/jquery-1.11.3.js"></script>
	<script>
		function changeVcode() {
			$("#cpacha-img").attr(
					"src",
					'../system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha&t='
							+ new Date().getTime());
		}
		$(document).ready(function() {
			$("#bt_login").click(function() {
				var name = $("#name").val();
				var password = $("#password").val();
				var vcode = $("#vcode").val();
				if (name == '' || password == '' || vcode == '') {
					alert('请填写完成信息再提交!');
					return;
				}
				$.ajax({
					url : 'login',
					type : 'post',
					dataType : 'json',
					data : {
						name : name,
						password : password,
						vcode : vcode
					},
					success : function(data) {
						if (data.type == 'success') {
							window.location.href = '../home/index';
						} else {
							alert(data.msg)
							changeVcode();
						}
					}
				});
			})
		});
	</script>
</body>

</html>