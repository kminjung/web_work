<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 전송되는 아이디 비밀번호를 읽어와서
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String isSave=request.getParameter("isSave");
	// DB 의 정보와 일치 하는지 확인해서 
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//로그인 성공여부 
	boolean isLoginSuccess=UsersDao.getInstance().isValid(dto);//dao 메소드 전달
	// 아이디 쿠키
	if(isSave!=null){
		Cookie cook=new Cookie("savedId", id);
		cook.setMaxAge(60);
		response.addCookie(cook);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
<%
	//로그인 성공 후 원래 가야 할 곳의 정보 
	String url=request.getParameter("url");
%>
<%if(isLoginSuccess){ 
	//세션에 id 담기
	session.setAttribute("id", id);%>
	<p> <strong><%=id %></strong> 님 로그인 되었습니다.</p>
	<a href="<%=url %>">확인</a>
<%}else{ %>
	<p> 아이디 혹은 비밀번호가 틀려요.</p>
	<a href="loginform.jsp?url=<%=url %>">확인</a>
<%} %>
</body>
</html>