<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		margin-top : 5px;
	}
</style>

</head>
<body>
	<form action="insert-result.jsp" method="get" name="board">
		<div>
			<label>제목 : <input type="text" name="title"></label>
		</div>
		<div>
			<label>내용 : <textarea cols="50" rows="10" name="contents"></textarea></label>
		</div>
		<div>
			<input type="button" value="저장" onclick="fnCheck()"> <!--버튼으로 줬을 경우에 디폴트 값이 submit 이기에 input으로 설정해준다.  -->
		</div>
	</form>
</body>
</html>
<script>
	function fnCheck() {
		var form = document.board; /* 여기에 form 태그의 name을 입력해준다. */
		if (form.title.value == "") {
			alert("제목을 입력해주세요.");
			form.title.focus();
			return;
		} else if(form.contents.value == ""){
			alert("내용을 입력해주세요.");
			form.contents.focus();
			return;
		} else {
			alert("저장되었습니다.");	
			form.submit();
		}	
	
	}
</script>