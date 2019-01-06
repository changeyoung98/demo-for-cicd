<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="bean.Bookbean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<jsp:useBean class="bean.Bookbean" id="bookinfo" scope="page"></jsp:useBean>
<HTML>
<HEAD>
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>
图书信息
</TITLE>
<style>
	.img{
			height:650px;
			background-image:url(3.jpg) ;
			background-size:100% 100%;
			background-repeat:no-repeat
		}	
</style>
<SCRIPT language="JavaScript">

function openwin(str)
{	window.open("addcart.jsp?isbn="+str, 
"shoppingcart","width=300,height=200,resizable=1,scrollbars=2");
		return;
}
</SCRIPT>
</HEAD>
<body class="img">
	<FORM>
		<%
			/*读取购物车信息*/
			if (request.getParameter("isbn")!=null)
			{	
				String isbn = request.getParameter("isbn");	
				bookinfo.setBookISBN(isbn);
				bookinfo.getBookInfo(isbn);
		%> 
		<br><br>
	    <TABLE  align="right" border="1" cellspacing="0" width="70%">
			<TR> 
				<TD width="116"><font color="#6600FF">ISBN</font></TD>
				<TD width="349">
					<font color="#6600FF"><%= bookinfo.getBookISBN()%></font>
				</TD>
			</TR>
			<TR> 
				<TD width="116"><font color="#6600FF">书名</font></TD>
				<TD width="349"><font color="#6600FF">
					<%= bookinfo.getBookName()%></font>
				</TD>
			</TR>
			<TR> 
				<TD width="116"><font color="#6600FF">出版社</font></TD>
				<TD width="349"><font color="#6600FF">
					<%= bookinfo.getPublisher()%></font>
				</TD>
			</TR>    
			<TR> 
				<TD width="116"><font color="#6600FF">作者/译者</font></TD>
				<TD width="349"><font color="#6600FF">
				<%= bookinfo.getBookAuthor()%></font></TD>
			</TR>
			<TR> 
				<TD width="116"><font color="#6600FF">图书价格</font></TD>
				<TD width="349"><font color="#6600FF">
				<%= bookinfo.getPrice()%></font></TD>
			</TR>
			<TR>
				<TD height="18" colspan="3">
					<div align="center"><font color="#6600FF">内容简介</font></div>
				</TD>
			</TR>
			<TR>			
				<TD height="100" colspan="2" > 
				
					<%= bookinfo.getIntroduce()%> 
				</TD>
			</TR>	
	  </TABLE>
	  
	<%
		
	}
	else
	{	out.println("没有该图书数据");
	}
	%>
	</FORM>	
	<TABLE align="right" border="0"> 
		
		<TR>
			<TD><A href="look.jsp">返回上一页</A></TD>
		</TR>
	</TABLE>		
</body>
</HTML>