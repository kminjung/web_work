<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/showfortune.jsp</title>
</head>
<body>
<%
	//request 에 담긴 데이터 읽어오기
	String fortuneToday=
		(String)request.getAttribute("fortuneToday");
%>
<h3>오늘의 운세 페이지</h3>
<p>오늘의 운세 : <strong><%=fortuneToday %></strong></p>
</body>
</html>
<!-- 
	- 출력에만 집중한 페이지 (실제 응답한 페이지) 요청을 서블릿으로 받아서 처리를 하고 리퀘스트에 담아서 응답한 것
	- 반드시 서블릿을 타고 들어와야 함.(Controller)
	- Modal(Data -int,String,Dto,List<xxx>) / Controller(Servlet + x + xx) /
	- View(jsp) - 클라이언트에게 출력해 주는 것
	- view 를 사용하기 때문에 가독성이 좋다. 다른사람이 개발한 프로젝트도 구조를 파악하기 쉽다.
	- 소규모의 홈페이지는 저번 내용으로 하면 된다.
	- 요청은 서블릿으로 받고 로직을 처리함. 출력은 view 로 미룸.
 -->