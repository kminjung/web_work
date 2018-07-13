<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	List<FileDto> list=FileDao.getInstance().getList();
	//세션에 저장된 아이디
	//로그인하지 않았으면 null 이다. 
	String id=(String)session.getAttribute("id");
	if(id==null){// NullPointerException 방지 
		id="";
	}
	
	String cPath=request.getContextPath();
%>
<div class="container">
	<%if(id!=null && !id.equals("")) {%>
		<p><strong><%=id %></strong> 로그인중... </p>
	<%}else{ %>
		<a href="<%=cPath%>/users/loginform.jsp">로그인</a>
	<%} %>
	<a href="private/upload_form.jsp">새파일 업로드</a>
	<h3>파일 목록 입니다.</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>다운로드 횟수</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>	
		</thead>
		<tbody>
			<%for(FileDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td>
					<%=tmp.getOrgFileName() %>
					<a href="download.jsp?num=<%=tmp.getNum()%>"><i class="glyphicon glyphicon-download pull-right"></i></a>
				</td>
				<td><%=tmp.getDownCount() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td>
					<%if(id.equals(tmp.getWriter())) {%>
						<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a>
					<%} %>
				</td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
<script>
	//삭제 확인을 하는 함수 
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}
	}
</script>
</body>
</html>

















