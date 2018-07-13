<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. BoardDao 를 이용해서 수정할 글정보를 얻어온다.
	BoardDto dto=BoardDao.getInstance().getData(num);
	//3. 글 수정 폼을 응답한다. 
%>
<%
	//쿠키에 저장된 아이디를 담을 변수
	String savedId="";

	Cookie[] cooks=request.getCookies();
	if(cooks!=null&&cooks.length>0){
		for(Cookie tmp:cooks){
			//savedId 라는 쿠키명으로 저장된 값이 있으면
			if(tmp.getName().equals("savedId")){
				//변수에 저장된 아이디값을 담는다.
				savedId=tmp.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/updateform.jsp</title>
</head>
<body>
<h3>글 수정 폼입니다.</h3>
<form action="update.jsp" method="post">
	<input type="hidden" name="num" value="<%=dto.getNum() %>" />
	<label for="num">번호</label>
	<input type="text" id="num" value="<%=dto.getWriter() %>" 
		disabled/><br/>
	<input type="hidden" name="writer" value="<%=dto.getWriter() %>" />
	<label for="text">작성자</label>
	<input type="text" id="writer" value="<%=dto.getWriter() %>" 
		disabled/><br/>			
	<label for="title">제목</label>
	<input type="text" name="title" id="title" 
		value="<%=dto.getTitle() %>"/><br/>
	<label for="content">내용</label><br/>
	<textarea name="content" id="content" 
		cols="30" rows="5"><%=dto.getContent() %></textarea><br/>
	<button type="submit">수정확인</button>
</form>
</body>
</html>