<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8"%>

<html>
<head>
<meta http-equiv="refresh" content="0;URL=shoppingcart.jsp">
</head>
<body >
	清空购物车......
	<%
	/*清空Cookie(购物车)信息*/
	Cookie[] cookies=request.getCookies();
	for (int i=0;i<cookies.length;i++)
	{	
	String isbn=cookies[i].getName();
			if (isbn.startsWith("ISBN")&&isbn.length()==8)
			{	
				Cookie c=new Cookie(isbn,"0");		
				c.setMaxAge(0);//设定Cookie立即失效
				response.addCookie(c);
			}
	}
	%>
</body>                                                                                
</html>