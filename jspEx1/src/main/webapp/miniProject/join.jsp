<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="db.jsp"%>
	<%
		String code = request.getParameter("code");
	%>
	
	<!-- 아이디, 패스워드, 이름 저장 -->
	<form action="" name="userForm" method="post">
		<div>아이디 : <input type="text" name="userId">
			<input type="button" onclick="idCheck();" value="중복체크">
		</div>
		<div>
			비밀번호 : 
			<input type="password" name="userPassword" id="userPassword" required class="textBox1" oninput="validatePassword()">
			<div id="passwordErrorMessage" style="font-size: 12px;"></div>
		</div>
		<div>
			비밀번호 확인: 
			<input type="password" name="userPassword2" id="userPassword2" required class="textBox1" oninput="validatePasswordConfirmation()">
			<div id="passwordConfirmationErrorMessage" style="font-size: 12px;"></div>
		</div>
		<div>
			이름 : 
			<input type="text" name="userName">
		</div>
		<div>
			전화번호 : 
			<input type="text" name="phoneNum">
		</div>
		<div>
			주소 : 
			<input type="text" name="address">
		</div>
		<div>
			<input type="button" onclick="userJoin()" value="회원가입">
		</div>

	</form>
</body>
</html>
<script>
	var check1 = false; // 아이디 중복체크 확인 여부
	var check2 = false; // 중복 여부
	function userJoin(){
		if(!check2){
			alert("아이디 중복체크 하셈");
		} else { 
			var form = document.userForm;
			form.action = "join-result.jsp";
			form.submit(); 
		}
	}
	// 중복체크 확인 팝업
	function idCheck(){
		check1 = true;
		var form = document.userForm;
		if(form.userId.value =="" || form.userId.value.length < 0){
			alert("아이디를 먼저 입력해주세요")
			form.uId.focus();
		}else{
			window.open("idCheck.jsp?userId="+form.userId.value, "check","width=500, height=300");
		}
	}
	// 중복체크 리턴 결과
	function getReturn(val){
		if(val == "Y"){
			check2 = true;
		} else {
			check2 = false;
		}
	}

</script>






