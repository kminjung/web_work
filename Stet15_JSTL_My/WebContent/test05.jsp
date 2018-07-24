<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<MemberDto> list=new ArrayList<>();
	list.add(new MemberDto(1, "김구라", "노량진"));
	list.add(new MemberDto(2, "김구라2", "노량진2"));
	list.add(new MemberDto(3, "김구라3", "노량진3"));
	//컨트롤러에서 Model 을 request 에 담았다고 가정
	request.setAttribute("list", list);//list 라는 키값으로 list 값을 넣은 것
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
</head>
<body>
<h3>회원 목록입니다.</h3>
<table>
	<thead>
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>주소</td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="tmp" items="${requestScope.list}"> <%-- request 영역에 담겨있는 list 를 참조하는 것 , requestScope 생략가능--%>
		<tr>
			<td>${tmp.num }</td>
			<td>${tmp.name }</td>
			<td>${tmp.addr }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>