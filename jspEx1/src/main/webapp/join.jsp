<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="join_result.jsp" method="get" name="login">
		<div>
			아이디 : <input type="text" name="userId">
			<!-- jps는 name에 변수이름을 설정 -->
		</div>
		<div>
			비밀번호 :<input type="password" name="pwd">
		</div>
		<div>
			이름 :<input type="text" name="userName">
		</div>
		<div>
			<label><input type="radio" value="M" name="gender">남자</label>
			<label><input type="radio" value="F" name="gender">여자</label>
		</div>
			<label> 
				<input type="checkbox" value="coding" name="hobby">코딩
			</label>
			<label> 
				<input type="checkbox" value="game" name="hobby">게임
			</label>
			<label> 
				<input type="checkbox" value="soccer" name="hobby">축구
			</label>
		</div>
		<!-- <button onclick="fnJoin">회원 가입</button> -->
		<!-- 제출을 할려면 submit이라는 타입을 설정한다 . -->
		<input type="button" value="회원 가입" onclick="fnJoin()">

	</form>

</body>
</html>
<script>
	function fnJoin() {
		var form = document.login; /* form 태그에 있는 이름을 가져오는 방법 */
		console.log(form.userId.value);
		if (form.userId.value == "" || form.userId.value == undefined) {
			alert("아이디를 입력해주세요.");
			form.userId.focus();
			return;
		}

		form.submit();
	}
</script>