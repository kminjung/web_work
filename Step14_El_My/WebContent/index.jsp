<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<h3>인덱스 페이지입니다.</h3>
<ul>
	<li><a href="hello.jsp">Hello Expression Language</a></li>
	<li><a href="scope/test01.jsp"> scope 테스트1</a></li>
	<li><a href="fortune.do">오늘의 운세</a></li>
	<li><a href="person.do">오늘의 인물 보기</a></li>
	<li><a href="info.do">회원 한 명의 정보 보기</a></li>
	<li><a href="test.do?num=1&name=gura">요청 param 테스트</a></li>
	<li><a href="test.do?num=2&name=monkey">요청 param 테스트</a></li>
</ul>
<p>컨텍스트 경로를 EL 로 출력하기 : <strong>${pageContext.request.contextPath }</strong></p>
								<!-- %=request.getContextPath() % 와 같다-->
								<!-- 위와 같이 입력하며 수정해도 수정한 결과가 나온다.-->
</body>
</html>