<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	MemberDao dao=MemberDao.getInstance();
	List<MemberDto> list=dao.getList();
%>
<a href="insertform.jsp">회원추가</a>
<h3>회원목록</h3>
<table>
	<thead>
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>주소</td>
			<td>삭제</td>
			<td>수정</td>
		</tr>
	</thead>
	<tbody>
	<%for (MemberDto tmp:list){ %>
		<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getName() %></td>
			<td><%=tmp.getAddr() %></td>
			<td><a href="updateform.jsp?=num<%=tmp.getNum()%>>">수정</a></td>
			<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>	
		</tr>
	<% }%>
	</tbody>
</table>
</body>
</html>