
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="bean.Bookbean" %>

<%
	/*禁止使用浏览器Cache*/
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires",0);
%>

<html>
<head>
<meat http-equiv="Content-Style-Type" content="text/css" charset="UTF-8">
<title>member:<%= session.getAttribute("memberID") %>的购物车</title>
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
	<br><br>
	<H1 align="center">网上书店购物车</H1>
	<jsp:useBean class="bean.Bookbean" id="bookinfo" scope="page"></jsp:useBean>
	<% 
		if (session.getAttribute("memberID") == null||"".equals(session.getAttribute("memberID"))){
	%>
	<H2 align="center">请先登录</H2>
	<H2 align="center"><A href="login.jsp">登录</A></H2>
	<%
		}
		else{
	%>
	<FORM >
		<TABLE border="1" width="100%" cellspacing="0" bordercolor="#9999FF">
			<TR> 
				<TD width="82"><font color="#0000FF">ISBN</font></TD>
				<TD width="258"><font color="#0000FF">书名</font></TD>
				<TD width="62"><font color="#0000FF">单价</font></TD>
				<TD width="36"><font color="#0000FF">数量</font></TD>
				<TD width="43"><font color="#0000FF"> </font></TD>
			</TR>
			<%	
		/*读取购物车信息*/
				Cookie[] cookies=request.getCookies();
				
				for (int i=0;i<cookies.length;i++)
				{	
					String isbn=cookies[i].getName();
					String num=cookies[i].getValue();
					//startsWith判断字符串起始位置是否以指定字符串开头
					if (isbn.startsWith("ISBN")&&isbn.length()==8)
					{	
						bookinfo.setBookISBN(isbn.substring(4,8));
						bookinfo.getBookInfo(isbn.substring(4,8));
			%> 
			<TR> 
				<TD width="82"><%=bookinfo.getBookISBN()%></TD>
				<TD width="258">
				<A href="bookinfo.jsp?isbn=<%=bookinfo.getBookISBN()%>"><%= bookinfo.getBookName()%></A>
				</TD>
				<TD width="62"><%= bookinfo.getPrice()%></TD>
				<TD width="36">
				<input size="5" type="text" maxlength="5" value="<%=num%>" name="num" />
				</TD>
				<TD width="43"><A href="delbook.jsp?isbn=<%= bookinfo.getBookISBN()%>">
			删除</A></TD>
			</TR>
			<%
					}	
				}
			%> 
		</TABLE>
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
	<%
		}
	%>
</BODY>
</html>