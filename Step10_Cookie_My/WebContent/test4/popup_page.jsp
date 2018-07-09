<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test4.popup_page.jsp</title>
<style>
	body{
		background-color:yellow;
	}
</style>
</head>
<body>
<h3>여름 맞이 파격 할인</h3>
<p>아디다스 슬리퍼3000</p>
<p>나이키 수영복 9,900</p>
<form action="save.jsp" method="post">
	<label><!--canPopup 로 no 가 간다. cookie -->
		<input type="checkbox" name="canPopup" value="no" />
		1분동안 팝업 띄우지 않기
	</label>
	<br />
	<button type="submit">룰루X</button>
</form>
</body>
</html>