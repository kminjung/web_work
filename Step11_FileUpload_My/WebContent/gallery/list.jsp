<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	List<GalleryDto> list=GalleryDao.getInstance().getList();
	//세션에 저장된 아이디
	//로그인하지 않았으면 null 이다.
	String id=(String)session.getAttribute("id");
	if(id==null){
		id="";
	}
	String cPath=request.getContextPath();
%>
<div class="container">
	<%if(id!=null && !id.equals("")) {%>
	<p><strong><%=id %></strong>로그인중..</p>
	<%}else {%>
	
	<%} %>
	<a href="private/upload_form.jsp">사진올리기</a><!-- 로그인 한 사람만 -->
	<h3>사진 Gallery 입니다.</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<td>번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>경로</td>
				<td>등록일</td>
				
			</tr>
		</thead>
		<tbody>
			<%for(GalleryDto tmp:list) {%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getCaption() %></td>
				<td><%=tmp.getImagePath() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td>
					<%if(id.equals(tmp.getWriter())) {%><!-- 세션아이디 == 글작성자 -->
						<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a>
					<%} %>
				</td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>