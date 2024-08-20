<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
    // 세션 무효화
    session.invalidate();

    // 로그인 페이지로 리디렉션
    response.sendRedirect("home.jsp");
%>
</body>
</html>
