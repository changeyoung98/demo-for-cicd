<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>注册</title>
	<style>
	.img{
		height:650px;
		background-image:url(3.jpg) ;
		background-size:100% 100%;
		background-repeat:no-repeat
	}
	</style>
</head>
<body class=img>



		<table  width="100%">

			<tr><td width="45%"></td>
				<td width="13%"><h1 ><font color="red">新用户注册</font></h1>
				</td>
				<td width="42%"><a href="login.jsp">登录</a>
				</td>
			</tr>
		</table>
		<center>
		<form  action="register.jsp"  >
      输入昵称:<input type="text" name="memberId" />
      <br><br>
			输入你的姓名:<input type="text" name="name" />
			<br><br>
			输入手机号:&nbsp;&nbsp;<input type="text" name="phone"/>
			<br><br>
			设置密码:&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="pass" />
			<br><br>
			<input type="submit" value="确认" name="queren" />

		</form>
	</center>



</body>
</html>
