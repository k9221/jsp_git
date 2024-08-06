<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="db.jsp"%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String stuNo = request.getParameter("stuNo");
		
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'");
	
			if(rs.next()){
				out.println("학번 : " + rs.getString("STU_NO")+ "\t" + "이름 : " + rs.getString("STU_NAME") + "\t" + "학과 : "  + rs.getString("STU_DEPT") + "\t" + "성별 : " + rs.getString("STU_GENDER"));
			} else {
				out.println("해당 학생이 존재하지 않습니다.");
			}
	
		} catch(SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>
</body>
</html>