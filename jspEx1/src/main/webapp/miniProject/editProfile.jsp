<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: vertical;
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
            margin-right: 10px;
        }
        .button:hover {
            background: #0056b3;
        }
        .danger-button {
            background: #dc3545;
        }
        .danger-button:hover {
            background: #c82333;
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

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String userName = "";
            String phoneNum = "";
            String address = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sample", "root", "test1234");

                // 사용자 정보를 가져오는 쿼리
                String sql = "SELECT userName, phoneNum, address FROM tbl_user WHERE userId=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    userName = rs.getString("userName");
                    phoneNum = rs.getString("phoneNum");
                    address = rs.getString("address");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>

        <h1>Edit Profile</h1>
        <form action="updateProfile.jsp" method="post">
            <div class="form-group">
                <label for="userName">이름</label>
                <input type="text" id="userName" name="userName" value="<%= userName %>" required>
            </div>
            <div class="form-group">
                <label for="phoneNum">전화번호</label>
                <input type="text" id="phoneNum" name="phoneNum" value="<%= phoneNum %>" required>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <textarea id="address" name="address" rows="4" required><%= address %></textarea>
            </div>
            <input type="hidden" name="userId" value="<%= userId %>">
            <button type="submit" class="button">저장하기</button>
        </form>
        <form action="deleteProfile.jsp" method="post" style="margin-top: 20px;">
            <input type="hidden" name="userId" value="<%= userId %>">
            <button type="submit" class="button danger-button">회원탈퇴</button>
        </form>
    </div>
</body>
</html>