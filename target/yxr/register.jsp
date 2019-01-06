<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="bean.Buyerbean" %>

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
<center>
	<jsp:useBean id="Buyerbean" class="bean.Buyerbean" scope="request" />
	<%
		Buyerbean buyer = new Buyerbean();
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("name");
		String pwd = request.getParameter("pass");
		String phone=request.getParameter("phone");


		if("".equals(memberName)||"".equals(pwd))
		{
	%>
		<h2 >姓名密码不可为空，请重新输入!</h2>
		<h2 ><a href="sign.jsp">重新注册</a></h2>
	<%
		}
		else{
		  buyer.setMemberID(memberId);
			buyer.setMemberName(memberName);
			buyer.setPwd(pwd);
			buyer.setPhone(phone);
			buyer.creatMember();
	%>
		<h2>
			注册成功
			<br><br>
			<%=buyer.getMemberName()%>
			<br><br>
			你的会员账号为:
			<br><br>
			<%=buyer.getMemberID()%>
			<br><br>
			<a href="login.jsp">点击去登陆</a>
		</h2>
	<%
		}
	%>
</center>
</body>
</html>
