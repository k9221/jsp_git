<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
<style>
table, th, tr, td {
    border: 1px solid black;
    border-collapse: collapse;
    padding: 10px;
}
</style>
</head>
<body>
    <%@ include file="db.jsp"%>
    <%
    ResultSet rs = null;
    Statement stmt = null;
    String id = request.getParameter("userId");
    String pwd = request.getParameter("userPassword");
    String message = "";
    String redirectUrl = "login.jsp";

    try {
        stmt = conn.createStatement();
        String querytext = "SELECT * FROM TBL_USER WHERE userId = '" + id + "' AND userPassword = '" + pwd + "'";
        rs = stmt.executeQuery(querytext);

        if (rs.next()) {
            // 로그인 성공
            session.setAttribute("userId", rs.getString("userId"));
            session.setAttribute("status", rs.getString("status"));

            // 로그인 성공 후 리디렉션할 URL 설정
            redirectUrl = "index.jsp";
        } else {
            // 로그인 실패 처리
            querytext = "SELECT * FROM TBL_USER WHERE userId = '" + id + "'";
            rs = stmt.executeQuery(querytext);

            if (rs.next()) {
                // 아이디는 존재하지만 비밀번호가 틀린 경우
                if (rs.getInt("cnt") >= 5) {
                    // 비밀번호 실패 횟수가 5번 이상인 경우
                    message = "5번 이상 실패했습니다. 관리자에게 문의해주세요";
                } else {
                    // 비밀번호를 틀린 경우
                    message = "비밀번호를 다시확인해주세요";
                    // 실패 횟수 증가
                    querytext = "UPDATE TBL_USER SET cnt = cnt + 1 WHERE userId = '" + id + "'";
                    stmt.executeUpdate(querytext);
                }
            } else {
                // 아이디가 존재하지 않는 경우
                message = "아이디를 확인해주세요";
            }
        }
    } catch (SQLException ex) {
        message = "SQLException : " + ex.getMessage();
    } finally {
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
    }
    %>

    <script>
        var message = "<%= message %>";
        var redirectUrl = "<%= redirectUrl %>";

        window.onload = function() {
            if (message) {
                alert(message);
                // Redirect to login page if there's a message
                window.location.href = redirectUrl;
            }
        };
    </script>
</body>
</html>