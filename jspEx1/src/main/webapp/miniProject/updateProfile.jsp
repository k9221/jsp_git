<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
    <%
        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String phoneNum = request.getParameter("phoneNum");
        String address = request.getParameter("address");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample", "root", "test1234");

            // 사용자 정보를 업데이트하는 쿼리
            String sql = "UPDATE tbl_user SET userName=?, phoneNum=?, address=? WHERE userId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, phoneNum);
            pstmt.setString(3, address);
            pstmt.setString(4, userId);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<p>업데이트가 완료 되었습니다!</p>");
            } else {
                out.println("<p>Profile update failed. Please try again.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>An error occurred. Please try again later.</p>");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        // Redirect back to the profile page
        response.setHeader("Refresh", "2; URL=myPage.jsp");
    %>
</body>
</html>