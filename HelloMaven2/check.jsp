<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
Map<String,String> user_list=new HashMap<String,String>();
%>

<%
user_list.put("zz", "888");
user_list.put("qq", "222");
user_list.put("yy", "666");
%>

<%!
boolean check(String username,String psd){
	if(user_list.containsKey(username))
		if(user_list.get(username).equals(psd)){
			return true;
		}
	return false;
}
%>

<%
String username=request.getParameter("username");
String psd=request.getParameter("psd");

if( check(username,psd)){
	session.setAttribute("username", username);	
	out.print("欢迎"+username);
	out.print("&nbsp;&nbsp;&nbsp;<a href='test.jsp'>开始测试</a>");
}
else{
	out.print("登录失败，3秒之后重新登录");
	response.setHeader("refresh", "3;url='index.jsp'");
}


%>

</body>
</html>