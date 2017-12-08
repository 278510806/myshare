<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>MyShare Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>  
.col-center-block {  
    float: none;  
    display: block;  
    margin-left: auto;  
    margin-right: auto;  
}  
</style>  

</head>
<body>
	<div class="container">
		<div class="row myCenter">
			<div class="col-xs-6 col-md-4 col-center-block">
				<form class="form-signin" method="post" action="login.action">
					<h2 class="form-signin-heading">请登录</h2>
				<span style="color:red">${param.loginFailed }</span>
					<label for="username" class="sr-only">用户名</label>
					<input type="text" id="username" name="userCustom.loginname" class="form-control"
						placeholder="用户名" required autofocus> <label
						for="inputPassword" class="sr-only">密码</label> <input
						type="password" id="inputPassword" name="userCustom.pwd" class="form-control"
						placeholder="密码" required>
							<div class="checkbox">
								<label> <input type="checkbox" value="remember-me" />
										记住我 </label>
							</div>
							<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>