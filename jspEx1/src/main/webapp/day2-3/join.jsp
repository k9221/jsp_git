<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 아이디, 패스워드, 이름 저장 -->
	<form action="join-insert.jsp" name="user">
		<div>
			아이디 : <input type="text" name="userId" value=""> <!--내가 입력한 정보를 보낼려면 input에 name을 정의한다.-->
			<button type="button" onclick="fnChack()">중복체크</button>
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<div>
			이름 : <input type="text" name="userName">
		</div>
		<div>
			전화번호 : <input type="text" name="userNum">
		</div>
		<div>
			 남자 :<input type="radio" name="gender" value="M"><!--중복체크할 사항이 없는 것은 radio 버튼으로 처리하는게 일반적이다.  -->
			 여자 :<input type="radio" name="gender" value="F">
		</div>
		<!-- <button onclick="fnSave">저장</button> -->
		<!-- 우리가 버튼을 눌렀을 때 join.insert.jsp로 이동하면서 입력한 값을 전달해주고 싶을 떄는 form 태그로 묶는다.  -->
		<button>form action 저장</button>
		<button type="button" onclick="fnSave()">함수를 이용한 저장</button>
		<button type="button" onclick="fnSubmit()">action 수정 후 submit</button>
		<button type="button" onclick="fnex1()">복습 !!</button>
	</form>
</body>
</html>
<script>
	function fnSave(){
		var form = document.user; /* form 안에 form태그 안에 있는 값을 넣는다. */
		var url = "userId="+form.userId.value +"&pwd=" +form.pwd.value +"&userName=" +form.userName.value;
		location.href="join-insert.jsp?"+url;
	}
	
	function fnSubmit(){ /* submit을 사용하여 더 간략하고 쉽게 전송할 수 있다. */
		var form = document.user;
		form.action = "join-insert2.jsp"; /* form.action을 사용하여 원하는 주소로 이동할 수 있다. */
		form.submit(); /* form.submit을 사용하여 호출한다. */
	}
	
	function fnex1(){
		var form = document.user;
		form.action = "user-insert.jsp";
		form.submit();
	}
	function fnChack(){
		var form = document.user;
		form.action = "id-check.jsp";
		form.submit();
	}
	
</script>







