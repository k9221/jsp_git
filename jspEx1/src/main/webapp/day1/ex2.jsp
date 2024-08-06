<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! 
		int i = 0;
		String name = "홍길동";
	%>
	<!-- html 주석  -->
	<%-- jsp 주석 --%> <!-- jsp 주석은 웹 화면 소스에 나오지 않음 -->
	<%
		for(i=1; i<=10; i++){
		/* System.out.println(i); */
			out.println("<h2>" + i + "</h2>"); /* 브라우저에 출력 */
		}
	%>
	<h1><%= name %></h1><!-- html과 혼용하여 사용 가능하다.(표현식) -->
	
</body>
</html>