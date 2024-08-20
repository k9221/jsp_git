<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            margin-top: 0;
            color: #333;
        }
        .profile-info {
            margin-bottom: 20px;
        }
        .profile-info p {
            font-size: 16px;
            margin: 8px 0;
        }
        .profile-info strong {
            color: #555;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
        }
        .button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String userId = (String) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // 데이터베이스 연결 정보
            String dbURL = "jdbc:mysql://localhost:3306/sample";
            String dbUser = "root";
            String dbPassword = "test1234";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // 사용자 정보를 가져오는 쿼리
                String sql = "SELECT userName, phoneNum, address FROM tbl_user WHERE userId=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String userName = rs.getString("userName");
                    String phoneNum = rs.getString("phoneNum");
                    String address = rs.getString("address");
        %>

        <h1>My Page</h1>
        <div class="profile-info">
            <p><strong>아이디:</strong> <%= userId %></p>
            <p><strong>이름:</strong> <%= userName %></p>
            <p><strong>전화번호:</strong> <%= phoneNum %></p>
            <p><strong>주소:</strong> <%= address %></p>
        </div>
        <a href="editProfile.jsp" class="button">수정하기</a>
		<a href="home2.jsp" class="button">돌아가기</a>
        <% 
                } else {
                    out.println("No user found.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</body>
</html>