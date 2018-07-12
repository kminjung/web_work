<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
</head>
<body>
<%
	//1. 세션에 저장된 아이디를 읽어와서
	String id=(String)session.getAttribute("id");
	//2. DB 에서 해당 아이디의 개인정보를 읽어온 다음
	UsersDto dto=UsersDao.getInstance().getData(id);
	//3. 응답한다.
%>
<h3>개인정보 입니다.</h3>
<table>
	<thead>
		<tr>
			<td>항목</td>
			<td>정보</td>
		</tr>
	</thead>
	<tbody><!-- UsersDao 를 통해서 DB 에 있는 id,pwd 등 가져와야 하는 상황 -->
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</tbody>
</table>
<a href="updateform.jsp">회원정보 수정</a>
<a href="javascript:deleteConfirm()">회원탈퇴</a>
<script>
	function deleteConfirm(){
		var isDelete=confirm("회원탈퇴를 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>