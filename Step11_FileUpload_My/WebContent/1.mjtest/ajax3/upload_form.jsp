<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>ajax 파일 업로드 예지</h3>
<form action="upload.jsp" method="post"
	enctype="multipart/form-data" id="myForm">
	<label for="image">이미지 선택</label>
	<input type="file" name="image" id="image"/>
	<button type="submit">업로드</button>
</form>
<div class="result">
	<!-- ajax 들어오는 부분 -->
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script></body>
<script>
	$("#myForm").ajaxForm(function(responseData){
		$("<img/>").attr("src",responseData.imagePath)
		css("width","300px")
		.appendTo(".result");
	});
	//파일을 선택하면 실행할 함수
	$("#image").on("input",function(){
		$("#myForm").submit;
	});
</script>
</html>