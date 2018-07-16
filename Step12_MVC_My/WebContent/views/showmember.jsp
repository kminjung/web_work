<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/showmember.jsp</title>
</head>
<body>
<%
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<h3>회원정보 페이지입니다.</h3>
<p>번호 : <strong><%=dto.getNum() %></strong></p>
<p>이름 : <strong><%=dto.getName() %></strong></p>
<p>주소 : <strong><%=dto.getAddr() %></strong></p>
<a href="index.jsp">인덱스로 가기</a><!-- 결과로써는 같은 최상위 경로이기 때문에 ../ 를 안쓴다. -->
<!-- <a href="../index.jsp">인덱스로 가기</a> -->
</body>
</html>