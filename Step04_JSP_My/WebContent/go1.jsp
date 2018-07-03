<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	System.out.println("/go1.요청 처리중..");
	//context path 읽어오기
	String cPath=request.getContextPath();
	//Redirect 이동 응답 (절대경론)
	response.sendRedirect("test01.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>