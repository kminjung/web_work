<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	MemberDao dao=MemberDao.getInstance();
	dao.delete(num);
%>
</body>
<script>
	alert("<%=num %>번 회원정보를 삭제했습니다.");
	//자바스크립트로 페이지 이동
	location.href="list.jsp";
	
</script>
</html>