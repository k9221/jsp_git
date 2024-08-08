<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("userId");/* join.jsp에서 보낸 값을 받고 싶을떄 보낸 값이 id에 담긴다. */
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("userName");
		String phone = request.getParameter("userNum");
		String gender = request.getParameter("gender");		
		
	%>
</body>
</html>