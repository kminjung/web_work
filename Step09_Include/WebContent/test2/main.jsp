<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test2/main.jsp</title>
</head>
<body>
<%
	//header.jsp 에서 사용할 데이터를 main.jsp 에서 전달하려면...
	
	//request 에 담는다. 
	request.setAttribute("myName", "김구라");
%>
<%@include file="header.jsp" %>
<div class="main">
	<h3>메인 컨텐츠 입니다.</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto illo repellendus eius tempora ea odit magni repudiandae perferendis fuga temporibus tenetur atque ex veniam veritatis vitae labore officia? Consectetur magnam.</p>
</div>

</body>
</html>












