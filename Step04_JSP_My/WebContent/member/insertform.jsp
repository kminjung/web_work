<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/insertform.jsp</title>
</head>
<body>
<h3>회원추가 폼 입니다.</h3>
<form action="insert.jsp" method="post">
	<label for="name">이름</label>
	<input type="text" name="name" id="name"/><br/>
	<label for="addr">주소</label>
	<input type="text" name="addr" id="addr"/><br/>
	<button type="submit">추가</button>
	<button type="reset">취소</button>
</form>
</body>
</html>