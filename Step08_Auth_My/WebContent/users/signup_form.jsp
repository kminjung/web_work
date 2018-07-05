<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
</head>
<body>
<h3>회원가입 페이지입니다.</h3>
<form action="signup.jsp" method="post">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id"/><br/>
	<label for="pwd">비밀번호</label>
	<input type="text" name="pwd" id="pwd"/><br/>
	<label for="email">이메일</label>
	<input type="text" name="email" id="email"/><br/>
	<button type="submit">가입</button>
</form>	
</body>
</html>
<!-- 
	name 속성의 value 는 파라미터 추출할 때 사용한다.
	id 는 label id 와 이어진다.
	/로 시작하지 않으면 상대경로다.
 -->