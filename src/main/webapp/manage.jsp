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
    <title>管理员登录</title>
</head>
<body class=img>
	<h1  align="center">管理员登录</h1>
	<center>
	<form action="admain.jsp" method="post" >
		管理员账号:<input type="text" name="manageID"/>
		<br><br>
		密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="managepwd"/>
		<br><br>
		<input type="submit" value="登录"/>
	</form>
	
	
	</center>
	<h3 align="right"><a  href="login.jsp">用户登录</a></h3>

</body>
</html>