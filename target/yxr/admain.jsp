<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page import="bean.Buyerbean" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>管理员界面</title>
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
<br><br><br>
	<h1 align="center">管理员</h1>
	<jsp:useBean id="Buyerbean" class="bean.Buyerbean" scope="request" />
	<%
		String manageID=request.getParameter("manageID");
		String managepwd=request.getParameter("managepwd");
		if("syw".equals(request.getParameter("manageID"))&&"admin".equals(request.getParameter("managepwd"))){
			session.setAttribute("manageID",manageID);
			session.setAttribute("managepwd",managepwd);		
	%>
		<h3 align="center"><a  href="look.jsp">查看书籍</a>
		<br><br>
		<a  href="addbook.jsp">添加书籍</a><br><br>
		<a  href="delet.jsp">删除书籍</a></h3>
	<%	
		}
		else{
		
	%>
		<h2>你不是管理员</h2>	
	<%
		}
	%>	
</body>
</html>