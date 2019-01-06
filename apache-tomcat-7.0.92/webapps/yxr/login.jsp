<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
	<style>
	.img{
		height:650px;
		background-image:url(2.png) ;
		background-size:100% 100%;
		background-repeat:no-repeat
	}
	</style>
    <title>登录</title>
</head>
<body class=img>
	<h1  align="center">网上书店</h1>
	<center>
	<form action="check.jsp" method="post" >
    昵称:<input type="text" name="memberID"/>
		<br><br>
		密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="pwd"/>
		<br><br>
		<input type="submit" value="登录"/>&nbsp;
		<p><a href="sign.jsp">新用户点击注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="manage.jsp">以管理员身份登录</a></p>
	</form>
	</center>
</body>
</html>
