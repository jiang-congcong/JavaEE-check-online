<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
 Map<String, Integer> score_list = new HashMap<String, Integer>();
%>

<%
int score=0;
String q1 = request.getParameter("q1"); 
String q2 = request.getParameter("q2"); 
String[] q3 = request.getParameterValues("q3");

if(q1!=null&&q1.equals("武汉")){
	score+=10;
}

if(q2!=null&&q2.equals("赵匡胤")){
	score+=10;
}

if(q3!=null&&q3.length==2&&q3[0].equals("红楼梦")&&q3[1].equals("水浒传")){
	score+=10;
}

score_list.put((String)session.getAttribute("username"),score);
application.setAttribute("score_list", score_list);
response.sendRedirect("logout.jsp");

%>

</body>
</html>