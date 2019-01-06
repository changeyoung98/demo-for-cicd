 <%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page import="bean.Bookbean" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>添加图书</title>

<style>
	.img{
		height:650px;
		background-image:url(5.jpg) ;
		background-size:100% 100%;
		background-repeat:no-repeat
	}
</style>
</head>
<body class="img">
<jsp:useBean class="bean.Bookbean" id="book" scope="page"></jsp:useBean>
		<h2 align="center">添加图书</h2>
		<h3 align="center" >
		<a href="look.jsp">查看书籍</a>
		<a href="delet.jsp">删除书籍</a>
		</h3>
	
	<%
		if("1".equals(request.getParameter("flag")))
		{
			String str=request.getParameter("bookName");
			book.setBookName(str==null?"":str);
			str=request.getParameter("bookAuthor");
			book.setBookAuthor(str==null?"":str);
			str=request.getParameter("publisher");
			book.setPublisher(str==null?"":str);
			str=request.getParameter("introduce");
			book.setIntroduce(str==null?"":str);
			str=request.getParameter("price");
			book.setPrice(str==null?"":str);
			str=request.getParameter("bookISBN");
			book.setBookISBN(str==null?"":str);
			book.creatBook();	
		}
	%>
	<form >
	
		书&nbsp;&nbsp;名：<input type="text" name="bookName"/>
		<br><br><br>
		编&nbsp;&nbsp;号：<input type="text" name="bookISBN"/>
		<br><br><br>
		作&nbsp;&nbsp;者：<input type="text" name="bookAuthor"/>
		<br><br><br>
		出版社：<input type="text" name="publisher"/>
		<br><br><br>
		价&nbsp;&nbsp;格：<input type="text" name="price"/>
		<br><br><br>
		简&nbsp;&nbsp;介：<textarea rows="10" cols="60"  name="introduce"></textarea>
		<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="添加"/>
		<input type="hidden" value="1" name="flag">
	
	</form>
</body>
</html>