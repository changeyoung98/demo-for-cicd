<%@ page language="java" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%
/*Cookie信息处理*/
/*增加Cookie*/
if (request.getParameter("isbn")!=null)
{	Cookie cookie=new Cookie("ISBN"+request.getParameter("isbn"),"1");//"1"指加入一本
	cookie.setMaxAge(30*24*60*60);//设定Cookie有效期限30日
	response.addCookie(cookie);//cookie发送至HTTP响应头中
}
%>
<html>
<head>
<script language="Javascript">
function Timer(){setTimeout("self.close()",10000)}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>加入购物车</title>

</head>
<BODY onload="Timer()">
	<table width=100%>
		<tr>
			<td align=center>图书已经成功放入购物车！</td>
		</tr>
		<tr>
			<td align=center>
				<a href="shoppingcart.jsp" target=resourcewindow><font class=font1 color=darkblue>查看购物车</font></a></font>
			</td>
		</tr>
		<tr>
			<td align=center>
				<a href="order.jsp" target=resourcewindow><font class=font1 color=darkblue>提交定单 </font></a></font>
			</td>
		</tr>
		<tr>
			<td align=center>
				<input type="button" value="继续购买" name="B3" 
				language="Javascript" onclick="window.close()" 
				style="border: #006699 solid 1px;background:#ccCCcc"/>
			</td>
		</tr>
		<tr>
			<td align=center>（此窗口将为您在10秒内自动关闭，您的商品已经安全地保存在购物车中。）</td>
		</tr>
	</table>
</BODY>
</html>
