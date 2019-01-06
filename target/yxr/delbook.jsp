
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="Java" contentType="text/html;charset=utf-8"%>
<%
/*Cookie信息处理*/
/*清除Cookie*/
if (request.getParameter("isbn")!=null)
{	
		Cookie cookie=new Cookie("ISBN"+request.getParameter("isbn"),"0");	
		cookie.setMaxAge(0);//设定Cookie立即失效
		response.addCookie(cookie);
}
%>
<!--jsp:forward page="shoppingcart.jsp" /-->
<html>
<head>
<meta http-equiv="refresh" content="0;URL=shoppingcart.jsp" charset="utf-8">
</head>
<body >
删除图书 ......
</body>                                                                                
</html>