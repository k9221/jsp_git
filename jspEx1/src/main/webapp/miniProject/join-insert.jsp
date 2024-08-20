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

</style>
<body>
		
<% request.setCharacterEncoding("UTF-8");%>

	<%@include file="db.jsp"%>
	<%
		
		ResultSet rs = null; // 쿼리에 결과를 담는 곳 (보관) select 한 결과를 ResultSet에 담는다. ResultSet은 쿼리의 결과를 저장하고 데이터에 접근하는 데 사용됩니다.
		Statement stmt = null; // Statement는 쿼리를 실행하고 결과를 생성하는 데 사용됩니다.
		
		String id = request.getParameter("userId");/* join.jsp에서 보낸 값을 받고 싶을떄 보낸 값이 id에 담긴다. */
		String pwd = request.getParameter("userPassword");
		String name = request.getParameter("userName");
		String phone = request.getParameter("phoneNum");
		String address = request.getParameter("address");
		stmt = conn.createStatement(); // 이것을 이용하면 쿼리에 호출이 가능하다. 
		String query = "INSERT INTO tbl_user " 
				+ "VALUES ('" + id + "', '" + pwd + "', '" + name + "', '" + phone + "', '" + address + "', 'USER', 0);";
		stmt.executeUpdate(query);
	%>	
</body>
</html>
<script>
function fnSubmit(){ /* submit을 사용하여 더 간략하고 쉽게 전송할 수 있다. */
	var form = document.user;
	form.action = "login.jsp"; /* form.action을 사용하여 원하는 주소로 이동할 수 있다. */
	form.submit(); /* form.submit을 사용하여 호출한다. */
}

</script>
