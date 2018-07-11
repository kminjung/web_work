<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
<%if(id!=null){ %>
	<p><strong><%=id %></strong>님 로그인중</p>
	<a href="users/logout.jsp"></a>
<%}else { %>
	<a href="users/loginform.jsp">로그인</a>
<%} %>
<h3>인덱스 페이지입니다.</h3>
<ul>
	<li><a href="users/signup_form.jsp">회원가입</a></li>
	<li><a href="file/list.jsp">자료실</a></li>
	<li><a href="gallery/list.jsp">사진 갤러리</a></li>
</ul>
</body>
</html>