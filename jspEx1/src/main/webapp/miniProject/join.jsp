<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/jspEx1/css/sample.css">
    <title>회원가입 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
        }
        input {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
	    <form method="post" action="join-insert.jsp">
	        <label for="userId">ID:</label>
	        <input type="text" id="userId" name="userId" >
	        <br>
	        <label for="userPassword">Password:</label>
	        <input type="password" id="userPassword" name="userPassword">
	        <br>
	        <label for="userName">Name:</label>
	        <input type="text" id="userName" name="userName">
	        <br>
	        <label for="phoneNum">Phone:</label>
	        <input type="text" id="phoneNum" name="phoneNum">
	        <br>
	        <label for="address">Address:</label>
	        <input type="text" id="address" name="address">
	        <br>
	        <button type="button" onclick="fnSubmit()"></button>
	    </form>
    </div>
</body>
</html>
<script>
	function fnSubmit(){ /* submit을 사용하여 더 간략하고 쉽게 전송할 수 있다. */
		var form = document.user;
		form.action = "index.jsp"; /* form.action을 사용하여 원하는 주소로 이동할 수 있다. */
		form.submit(); /* form.submit을 사용하여 호출한다. */
	}
</script>
