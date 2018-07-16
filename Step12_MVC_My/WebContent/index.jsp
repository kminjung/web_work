<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지입니다.</title>
</head>
<body>
<ul>
	<li><a href="showfortune">오늘의 운세</a></li> <!-- 서블릿에서 처리, html 로 처리하기 어려움 -->
	<!-- <li><a href="showfortune.jsp">오늘의 운세</a></li> -->
	<li><a href="showtime">현재시간</a></li>
	<li><a href="showmember">회원 한명의 정보보기</a></li>
</body>
</html>
<!-- 
	- 클라이언트와 물리적인 위치는 아무상관이 없다.
	- forward는 응답을 위임시키는 것 (jsp 로)
 -->