<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
</head>
<body>
<%
	//공지사항 목록 얻어오기
	List<String> msgs=(List<String>)request.getAttribute("msgs");
	// type -List<String>  / key - msgs
%>
<h3>home 페이지 입니다.</h3>
<ul>
	<li><a href="member/list.do">회원 목록보기</a></li>
</ul>

<h3>오늘의 공지사항</h3>
<ul><!-- home.jsp 에서 forward 이동시켰기 때문에 보임 . msgs -->
	<%for(String tmp:msgs){ %>
		<li><%=tmp %></li>
	<%} %>
</ul>
</body>
</html>