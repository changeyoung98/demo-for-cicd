
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page import="bean.Bookbean" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>书店</title>
<SCRIPT language="JavaScript">

function openwin(str)
{	
	window.open("addcart.jsp?isbn="+str,  
	"shoppingcart","width=300,height=200,resizable=1,scrollbars=2");
	return;
}

</SCRIPT>
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
	<h1 align="center">网上书店</h1>
	<jsp:useBean class="bean.Bookbean" id="book" scope="page"></jsp:useBean>
	
	<!--  
		if (session.getAttribute("manageID") == null||"".equals(session.getAttribute("managepwd"))){
	%>
	
	<H2 align="center"><A href="login.jsp">登录</A></H2>
	<
		}
		else{
	-->
	
		<%
	if("syw".equals(session.getAttribute("manageID"))&&"admin".equals(session.getAttribute("managepwd"))){		
	%>
<table align="right" width="90%" border="1" cellspacing="0" bordercolor="#9999FF">
		<tr> 
			<td><font color="#3333FF">书名</font></td>
			<td><font color="#3333FF">作者</font></td>
			<td><font color="#3333FF">出版社</font></td>
			<td><font color="#3333FF">定价</font></td>
			
		</tr>
		<%
			ResultSet rs = book.getBookList();
			while(rs.next()){
				String ISBN = rs.getString("bookISBN");
		%> 
		<tr> 
			<td><a href="bookdetail.jsp?isbn=<%= ISBN%>"><%= rs.getString("bookName")%></A></td>
			<td><%= rs.getString("bookAuthor")%></td>
			<td><%= rs.getString("publisher")%></td>
			<td><%= rs.getString("price")%></td>
			
		</tr>
		<%
		   }   
		%> 
	</table> 
	<table >
	<tr><td><a href="addbook.jsp">添加书籍</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td><a href="delet.jsp">删除书籍</a></td></tr>
	</table>	
	<%}%>
	
	
	
</body>
</html>