<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="container">
        <% 
            // 세션에서 사용자 ID를 가져옵니다
            String userId = (String) session.getAttribute("userId");

            // 이미 로그인된 사용자가 로그인 페이지에 접근하지 못하도록 리디렉션
            if (userId != null) {
                response.sendRedirect("home2.jsp"); // 로그인 후 이동할 페이지를 설정하세요.
                return;
            }
        %>
        <h1>로그인</h1>
        <form action="login-result.jsp" method="post" name="user">
            <div class="form-group">
                <label for="userId">아이디:</label>
                <input type="text" id="userId" name="userId" required>
            </div>
            <div class="form-group">
                <label for="userPassword">비밀번호:</label>
                <input type="password" id="userPassword" name="userPassword" required>
            </div>
            <div class="form-group">
                <input type="submit" value="로그인">
            </div>
        </form>
    </div>
</body>
</html>


