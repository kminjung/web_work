<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test04/main.jsp</title>
</head>
<body>
<jsp:include page="../include_files/header.jsp"></jsp:include> <!-- <jsp 컨+스 -->
<div class="container">
	<h3>main 페이지입니다.</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit expedita amet at in id quasi possimus harum a neque totam distinctio animi ea repellendus itaque autem. Quasi odio est illo.</p>
</div>
<jsp:include page="../include_files/footer.jsp"></jsp:include>
</body>
</html>
<!-- 
	jsp:include - 각각의 서블릿이 자기 맡은 영역을 공동 응답한다. 지역변수를 사용해도 된다. include 보다 많이 사용한다.
				  include 와 역할은 같지만 작동을 다르게 한다.
 -->