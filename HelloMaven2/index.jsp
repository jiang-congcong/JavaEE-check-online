<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<center>
<form action="check.jsp" method="get">
用户名<input type="text" name="username" />
<br>
密码<input type="password" name="psd" />
<br><br>
<button type="submit">登录</button>
<button type="reset">重填</button>
</form>
</center>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>