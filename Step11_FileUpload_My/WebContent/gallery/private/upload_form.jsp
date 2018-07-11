<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/upload_form.jsp</title>
</head>
<body>
<h3>사진 업로드폼</h3>
<form action="upload.jsp" method="post" 
	enctype="multipart/form-data">
	<label for="caption">설명</label>
	<input type="text" name="caption" id="caption"/><br/>
	<label for="image">이미지</label>
	<input type="file" name="image" id="image"/><br/>
	<button type="submit">업로드</button>
</form>
</body>
</html>
<!-- 
	input type="file" 이면  enctype="multipart/form-data"가 반드시 있어야 한다.
 -->