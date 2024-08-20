<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Profile</title>
</head>
<body>
    <%
        String userId = request.getParameter("userId");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample", "root", "test1234");

            // 사용자 정보를 삭제하는 쿼리
            String sql = "DELETE FROM tbl_user WHERE userId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);

            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                // 세션 종료
                session.invalidate();
                out.println("<p>삭제가 완료되었습니다! 메인 페이지로 이동합니다</p>");
            } else {
                out.println("<p>Profile deletion failed. Please try again.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>An error occurred. Please try again later.</p>");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        // Redirect to login page after a short delay
        response.setHeader("Refresh", "2; URL=home.jsp");
    %>
</body>
</html>