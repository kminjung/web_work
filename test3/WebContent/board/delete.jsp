<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 파일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));

	//파일 시스템에서 삭제하기 위해서는 저장된 파일명을 알아야한다.
	BoardDto dto=BoardDao.getInstance().getData(num);// dto=dao 를 통해 db num 에 접근
	
	String boardName=dto.getContent();
	//순서대로 class type . FileDao type . FileDto type . String type / String type 로 받은 것
	
	//세션의 아이디와 삭제할 글의 작성자와 같은지 한번더 확인
	String id=(String)session.getAttribute("id");
	
	if(!id.equals(dto.getWriter())){
		//금지된 요청이라고 에러를 응답한다. 
		response.sendError(HttpServletResponse.SC_FORBIDDEN,
				"본인의 파일이 아닙니다.");
		//서비스 메소드 종료
		return;
	}
	
	//1.DB  에서 파일정보 삭제
	BoardDao.getInstance().delete(num);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/delete.jsp</title>
</head>
<body>
<h3>파일을 삭제 했습니다.</h3>
<a href="../index.jsp#blog">확인</a>
</body>
</html>