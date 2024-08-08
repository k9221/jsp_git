<%@page import="java.awt.Checkbox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
}
</style>

</head>
<body>
	<%@include file="db.jsp"%>
	<%
		ResultSet rs = null;
		Statement stmt = null;
		String id = request.getParameter("userId");/* join.jsp에서 보낸 값을 받고 싶을떄 보낸 값이 id에 담긴다. */
		

		try {
			stmt = conn.createStatement();
			String query = "SELECT * FROM TBL_USER WHERE userId='" + id + "'";
			rs = stmt.executeQuery(query);
		
			if(rs.next()){
	%>		
		<table>
			<div>아이디: <%=rs.getString("userId")%></div>
	 		<div>이름: <%=rs.getString("name")%></div>
	 		<div>권한: <%=rs.getString("status")%></div>	
		</table>
	<% 				
			
			}else {
				out.println("삭제된 아이디입니다.");
			}
			
	 		
		} catch (SQLException ex) {
			out.println("SQLException : " + ex.getMessage());
		}
	%>

</body>
</html>