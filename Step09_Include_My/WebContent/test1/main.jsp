<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/main.jsp</title>
</head>
<body><!-- 다른 jsp 파일에다가 코딩할 수 있다. -->
<%@include file="header.jsp" %><!-- header.jsp file 을 포함해라 -->
<div>
	<h3>메인 컨텐츠 입니다.</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur ex obcaecati deleniti repudiandae optio cum quasi voluptatem tempora magnam esse delectus tempore commodi ad error quos iusto voluptas deserunt quas.</p>
</div>
<%@include file="footer.jsp" %>
</body>
</html>