<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Importing jQuery and Vue -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/join.css">

</head>
<body>
<% 
	if(session.getAttribute("id") != null) {
%>
	<h2>로그인 상태입니다!</h2>
	<form action="logout.jsp">
		<input type="submit" value = "로그아웃"><br>
	</form>

<% 
	}else {
%>

   <div class="container">
        <%@ include file="db.jsp"%>
        <h1>회원가입</h1>
        <form action="join-insert.jsp"name="userForm" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="userId">아이디:</label>
                <input type="text" name="userId" id="userId" required>
                <input type="button" onclick="idCheck();" value="중복체크">
            </div>
            <div class="form-group">
                <label for="userPassword">비밀번호:</label>
                <input type="password" name="userPassword" id="userPassword" required oninput="validatePassword()">
                <div id="passwordErrorMessage" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="userPassword2">비밀번호 확인:</label>
                <input type="password" name="userPassword2" id="userPassword2" required oninput="validatePasswordConfirmation()">
                <div id="passwordConfirmationErrorMessage" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="userName">이름:</label>
                <input type="text" name="userName" id="userName" required>
                <div id="nameErrorMessage" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="phoneNum">전화번호:</label>
                <input type="text" name="phoneNum" id="phoneNum" required>
                <div id="phoneErrorMessage" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="address">주소:</label>
                <input type="text" name="address" id="address" required>
                <div id="addressErrorMessage" class="error-message"></div>
            </div>
            <div class="form-group">
                <input type="button" onclick="userJoin()" value="회원가입">
            </div>
        </form>
    </div>
<% 
	}
%>    

</body>
</html>
<script>
        var check1 = false; // 아이디 중복체크 확인 여부
        var check2 = false; // 중복 여부

        function idCheck() {
            check1 = true;
            var form = document.userForm;
            if (form.userId.value.trim() === "") {
                alert("아이디를 먼저 입력해주세요");
                form.userId.focus();
            } else {
                window.open("idCheck.jsp?userId=" + encodeURIComponent(form.userId.value), "check", "width=500, height=300");
            }
        }

        function getReturn(val) {
    		if(val == "Y"){
    			check2 = true;
    		} else {
    			check2 = false;
    		}
        }

        function validateForm() {
            var form = document.userForm;
            var isValid = true;

            // 비밀번호 유효성 검사
            if (!validatePassword()) {
                isValid = false;
            }

            // 비밀번호 확인
            if (form.userPassword.value !== form.userPassword2.value) {
                document.getElementById("passwordConfirmationErrorMessage").textContent = "비밀번호가 일치하지 않습니다.";
                isValid = false;
            } else {
                document.getElementById("passwordConfirmationErrorMessage").textContent = "";
            }

            // 이름 필드 검증
            if (form.userName.value.trim() === "") {
                document.getElementById("nameErrorMessage").textContent = "이름을 입력해 주세요.";
                isValid = false;
            } else {
                document.getElementById("nameErrorMessage").textContent = "";
            }

            // 전화번호 필드 검증
            if (form.phoneNum.value.trim() === "") {
                document.getElementById("phoneErrorMessage").textContent = "전화번호를 입력해 주세요.";
                isValid = false;
            } else {
                document.getElementById("phoneErrorMessage").textContent = "";
            }

            // 주소 필드 검증
            if (form.address.value.trim() === "") {
                document.getElementById("addressErrorMessage").textContent = "주소를 입력해 주세요.";
                isValid = false;
            } else {
                document.getElementById("addressErrorMessage").textContent = "";
            }

            return isValid;
        }

        function validatePassword() {
            var password = document.getElementById("userPassword").value;
            var errorMessage = "";
            var isValid = true;

            if (password.length < 6) {
                errorMessage = "비밀번호는 최소 6자 이상이어야 합니다.";
                isValid = false;
            }

            document.getElementById("passwordErrorMessage").textContent = errorMessage;
            return isValid;
        }

        function validatePasswordConfirmation() {
            var password = document.getElementById("userPassword").value;
            var passwordConfirmation = document.getElementById("userPassword2").value;
            var errorMessage = "";
            if (password !== passwordConfirmation) {
                errorMessage = "비밀번호가 일치하지 않습니다.";
            }
            document.getElementById("passwordConfirmationErrorMessage").textContent = errorMessage;
        }

        function userJoin() {
            if (!check2) {
                alert("아이디 중복체크 하셈");
                return false;
            } else if (validateForm()) {
                var form = document.userForm;
                form.action = "join-insert.jsp";
                form.submit();
            }
        }
</script>



