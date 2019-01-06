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
	
	<table width="100%" border="1" cellspacing="0" bordercolor="#9999FF">
		<tr> 
			<td><font color="#3333FF">书名</font></td>
			<td><font color="#3333FF">作者</font></td>
			<td><font color="#3333FF">出版社</font></td>
			<td><font color="#3333FF">定价</font></td>
			<td>&nbsp;</td>
		</tr>
		<%
			ResultSet rs = book.getBookList();
			while(rs.next()){
				String ISBN = rs.getString("bookISBN");
		%> 
		<tr> 
			<td><a href="bookinfo.jsp?isbn=<%= ISBN%>"><%= rs.getString("bookName")%></A></td>
			<td><%= rs.getString("bookAuthor")%></td>
			<td><%= rs.getString("publisher")%></td>
			<td><%= rs.getString("price")%></td>
			<td><a href='Javascript:openwin("<%= ISBN %>")'>加入购物车</a></td>
		</tr>
		<%
		   }   
		%> 
	</table>  
	<br><br><br>
	<p align="center"><a href="shoppingcart.jsp"><font color="#0000FF" >查看购物车</font></a></p>
	
	
</body>
</html>