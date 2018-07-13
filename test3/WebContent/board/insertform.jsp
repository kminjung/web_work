<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertform.jsp</title>
</head>
<body>

<%
	List<BoardDto> list=BoardDao.getInstance().getList();
	//세션에 저장된 아이디 (아이디를 불러올 땐 세션으로)
	//로그인하지 않았으면 null 이다. 
	String id=(String)session.getAttribute("id");
	if(id==null){// NullPointerException 방지 
		id="";
	}
	
	String cPath=request.getContextPath();
%>
<%if(id!=null && !id.equals("")) {%>
	<p><strong><%=id %></strong> 로그인중... </p>
	
	<%}%>

<% if(id!=null){ %>
<h3>새 글 작성 폼 입니다.</h3>
<form action="insert.jsp" method="post">
	
	
	
	
	<input type="hidden" name="writer" value="<%=id%>"/>
	<label for="writer">작성자</label>
	<input type="text" id="writer" value="<%=id%>" 
		disabled="disabled"/><br/>
	<label for="title">제목</label>
	<input type="text" name="title" id="title"/><br/>
	<label for="content">내용</label><br/>
	<textarea name="content" id="content" cols="30" rows="10"></textarea>
	<br/>
	<button type="submit">작성 완료</button>
	<button type="reset"><a href="users/loginform.jsp#blog"></a>취소</button>
</form>
<%} else{%>
<a href="users/loginform.jsp"></a>
<%}%>
</body>
</html>
