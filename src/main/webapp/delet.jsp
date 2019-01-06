
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="bean.Bookbean" %>
<%@ page import="java.sql.ResultSet" %>


<html>
<head>
<meat http-equiv="Content-Style-Type" content="text/css" charset="UTF-8">
<title></title>
<style>
	.img{
		height:650px;
		background-image:url(6.jpg) ;
		background-size:100% 100%;
		background-repeat:no-repeat
	}
</style>
</head>
<BODY class="img">
<jsp:useBean class="bean.Bookbean" id="bookinfo" scope="page"></jsp:useBean>
	<FORM >
	<table width="100%" border="1" cellspacing="0" bordercolor="#9999FF">
		<tr>
			<td><font color="#3333FF">书名</font></td>

			<td>&nbsp;</td>
		</tr>
		<%
			ResultSet rs = book.getBookList();
			while(rs.next()){
				String ISBN = rs.getString("bookISBN");
		%>
		<tr>
			<td><a href="bookinfo.jsp?isbn=<%= ISBN%>"><%= rs.getString("bookName")%></A></td>
			<TD width="43"><A href="delbook.jsp?isbn=<%= bookinfo.getBookISBN()%>">
			删除</A></TD>
		</tr>
		<%
		   }
		%>
	</table>

		<BR>
		<TABLE align="center"border="0" >
			<TBODY>
			<TR>
			    <TD width="30%"><A href="list.jsp">返回首页</A></TD>
				<TD width="30%"><a href="emptycart.jsp">清空购物车</a></TD>
			    <TD width="30%"><a href="order.jsp">填写／提交订单</a></TD>
			</TR>
		  </TBODY>
		</TABLE>
	</FORM>

</BODY>
</html>
