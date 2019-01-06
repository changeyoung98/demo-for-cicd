<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="bean.Buyerbean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<style>
	.img{
		height:650px;
		background-image:url(2.png) ;
		background-size:100% 100%;
		background-repeat:no-repeat
	}
</style>
</head>
<body class=img>
	<h1 align="center">网上书店</h1>
	<jsp:useBean id="Buyerbean" class="bean.Buyerbean" scope="request" />
	<%
		Buyerbean buyer = new Buyerbean();
		String memberID = request.getParameter("memberID");
		String pwd = request.getParameter("pwd");
		buyer.setMemberID(memberID);
		buyer.setPwd(pwd);

		int logonTimes = buyer.getLogontimes() ;
		//out.println("登陆次数"+logonTimes);
		//out.println(buyer.getMemberName());

		if(buyer.getMemberName()!=null)
		{
			session.setAttribute("memberID",memberID);
	%>
		<h2 align="center"><%= buyer.getMemberName()%>欢迎你</h2>
		<h2 align="center"><a href="list.jsp">进入书店</a></h2>
	<%
		}
		else{

	%>
		<h2 align="center">密码错误或用户不存在</h2>
		<br><br>
		<h2 align="center">
			<a href="login.jsp">重新登录</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="sign.jsp">点击注册</a>
		</h2>

	<%
		}
	%>



</body>
</html>
