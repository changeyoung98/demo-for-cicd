<%@ page import="bean.Orderbean" %>
<%@ page import="bean.Bookbean" %>
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
/*禁止使用浏览器Cache，网页立即失效*/
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires",0);
%>
<HTML>
<HEAD>
<META http-equiv="Content-Style-Type" content="text/css" charset="utf-8">
<TITLE>填写订单</TITLE>
<style>
	.img{
		height:650px;
		background-image:url(6.jpg) ;
		background-size:100% 100%;
		background-repeat:no-repeat
	}
	.p1{
		text-align:center;
		font-size:20px;
	}
</style>
</HEAD>
<BODY class="img" BGCOLOR="#FFFFFF">
	<jsp:useBean class="bean.Bookbean" id="bookinfo" scope="page"></jsp:useBean>
	<jsp:useBean class="bean.Orderbean" id="order" scope="page"></jsp:useBean>
	<%  
		if (session.getAttribute("memberID") == null||"".equals(session.getAttribute("memberID"))){
	%>
	<h2 align="center">请先登录</h2>
	<h2 align="center"><a href="login.jsp">登录</a></h2>
	<%
		}
		else{
			if ("send".equals(request.getParameter("send")))
			{	
				order.setUserID((String)session.getAttribute("memberID"));
				String str=request.getParameter("receivername");
				order.setReceiverName(str==null?"":str);
				str=request.getParameter("orderprice");
				order.setOderprice(Float.toString(Float.parseFloat(str)));
				str=request.getParameter("address");
				order.setReceiverAddress(str==null?"":str);
				str=request.getParameter("postcode");
				order.setReceiverZip(str==null?"":str);
				str=request.getParameter("memo");
				order.setOrderRem(str==null?"":str);
				str=request.getParameter("bookInfo");//bookinfo图书编号
				
				order.setBookinfo(str==null?"":str);
				int orderID= Integer.parseInt(order.getOrderID());
				
				if (orderID>0)
				{	/*清空Cookie(购物车)信息*/
					Cookie[] cookies=request.getCookies();
					for (int i=0;i<cookies.length;i++)
					{	String isbn=cookies[i].getName();
						if (isbn.startsWith("ISBN")&&isbn.length()==8)
						{	Cookie c=new Cookie(isbn,"0");
							c.setMaxAge(0);//设定Cookie立即失效
							response.addCookie(c);
						}
					}
			%>
			<br><br>
			<p class="p1">订购成功!</p>
			<p class="p1" > 订单号:<%=orderID%></p>
			<p class="p1" ><a href="list.jsp">返回首页</a></p>
			<%
				}
				else
				{	
				out.print("订购失败\n");
					
				}
			}		

			else
			{	
				float price=0;
				String bookInfo="";
				
			%> 
			<FORM  name="frm">
			  <TABLE border="1" width="100%" cellspacing="0" bordercolor="#9999FF">
				<TR>
				  <TD width="90">ISBN</TD>
				  <TD width="269">书名</TD>
				  <TD width="50">单价</TD>
				  <TD width="75">数量</TD>
				  <TD width="48">价格 </TD>
				</TR>
			<%	/*读取购物车信息*/
				Cookie[] cookies=request.getCookies();
				for (int i=0;i<cookies.length;i++)
				{	String isbn=cookies[i].getName();
					String num=cookies[i].getValue();
					if (isbn.startsWith("ISBN")&&isbn.length()==8)
					{	
						bookinfo.setBookISBN(isbn.substring(4,8));//得到图书编号，
						bookinfo.getBookInfo(isbn.substring(4,8));
						Float bookPrice = new Float(bookinfo.getPrice());
			%>
				<TR>
				  <TD width="90"><%= bookinfo.getBookISBN()%></TD>
				  <TD width="269"><A href="bookinfo.jsp?isbn=<%= bookinfo.getBookISBN()%>"><%= bookinfo.getBookName()%></A></TD>
				  <TD width="50"><%= bookPrice%></TD>
				  <TD width="75"> 
					<INPUT size="5" type="text" maxlength="5" value="<%= num%>" name="num" readonly></TD>
				  <TD width="48"><%=  bookPrice.floatValue() * java.lang.Integer.parseInt(num)%></TD>
				</TR>

			<%
						price += bookPrice.floatValue()*java.lang.Integer.parseInt(num);
						bookInfo += bookinfo.getBookISBN()+"="+num+";";	
					}
				}
			%>
			</TABLE>
			  <p>&nbsp;</p>
			  <table width="100%" border="0">
				<tr> 
				  <td width="34%">&nbsp;</td>
				  <td width="41%">
					<div align="center"><a href="shoppingcart.jsp">修改图书订单</a></div>
				  </td>
				  <td width="25%">&nbsp;</td>
				</tr>
			  </table>
			  <p><font color="#0000FF">如以上信息无误，请填写以下信息并按提交按钮提交订单，完成网上订书：</font></p>
			  <table width="100%" border="0">
				<tr> 
				  <td width="17%"><font color="#0000FF">收书人姓名</font></td>
				  <td width="83%"> 
					<input type="text" name="receivername" size="10" maxlength="10"/>
				  </td>
				</tr>
				<tr> 
				  <td width="17%"><font color="#0000FF">订单总金额</font></td>
				  <td width="83%"> 
					<input type="text" name="orderprice" size="10" value="<%=price%>" readonly>
				  </td>
				</tr>
				<tr> 
				  <td width="17%"><font color="#0000FF">发送地址</font></td>
				  <td width="83%"> 
					<input type="text" name="address" size="60" maxlength="60">
				  </td>
				</tr>
				<tr> 
				  <td width="17%"><font color="#0000FF">邮编</font></td>
				  <td width="83%"> 
					<input type="text" name="postcode" size="6" maxlength="6">
				  </td>
				</tr>    
				<tr> 
				  <td width="17%"><font color="#0000FF">备注</font></td>
				  <td width="83%"> 
					<textarea name="memo" cols="60" rows="6"></textarea>
				  </td>
				</tr>
				<tr> 
				  <td width="17%"><font color="#0000FF"></font></td>
				  <td width="83%"> 
					<input type="submit" name="Submit" value="提交订单">
					<input type="hidden" name="send" value="send">
					<input type="hidden" name="bookInfo" value="<%= bookInfo%>">
				  </td>
				</tr>
			  </table>
			</FORM>
	<%
			}
		}
	%>
</BODY>
</HTML>
