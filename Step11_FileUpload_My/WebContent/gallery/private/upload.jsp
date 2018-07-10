<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realPath=application.getRealPath("/upload");
	int sizeLimit=1024*1024*50;
	MultipartRequest mr=new MultipartRequest(request,
			realPath,
			sizeLimit,
			"utf-8",
			new DefaultFileRenamePolicy());
	//업로드된 파일의 정보는 mr 객체를 이용해서 얻어온다.
	String title=mr.getParameter("title");

	//업로드한 클라이언트의 아이디
	String writer=(String)session.getAttribute("id");
	
	//업로드된 파일의 정보를 FileDto 에 담고 
	GalleryDto dto=new GalleryDto();
	dto.setWriter(writer);





	
	//DB 에 저장한다.
	boolean isSuccess=GalleryDao.getInstance().insert(dto);
	
	//응답
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private.upload.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
	<p>파일을 업로드 했습니다.</p>
	<a href="../list.jsp">목록보기</a>
<%}else{ %>
	<p>파일 업로드 실패</p>
	<a href="../list.jsp">목록보기</a>
<%} %>
</body>
</html>