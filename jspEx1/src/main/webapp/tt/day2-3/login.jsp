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
		/* session.removeAttribute("userId"); */
		session.invalidate(); /* 한번에 묶어서 삭제가 가능함  */
	/* 	out.println(session.getAttribute("userId")); */
	%>
	<form action="login_result.jsp">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		<div>
			<label>비밀먼호 : <input type="password" name="userPwd"></label>
		</div>
		<input type="submit" value="로그인">
	</form>
			
</body>
</html>