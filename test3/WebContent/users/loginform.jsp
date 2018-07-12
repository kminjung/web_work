<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<%
	//로그인후 이동할 url 정보를 읽어온다. 
	String url=request.getParameter("url");
	if(url==null){//만약 전달되지 않았으면
		//인덱스 페이지로 이동 되도록 한다. 
		url=request.getContextPath()+"/";
	}
%>
<%
	//쿠키에 저장된 아이디를 담을 변수
	String savedId="";

	Cookie[] cooks=request.getCookies();
	if(cooks!=null&&cooks.length>0){
		for(Cookie tmp:cooks){
			//savedId 라는 쿠키명으로 저장된 값이 있으면
			if(tmp.getName().equals("savedId")){
				//변수에 저장된 아이디값을 담는다.
				savedId=tmp.getValue();
			}
		}
	}
%>
<h3>로그인 폼입니다.</h3>
<form action="login.jsp?url=<%=url %>" method="post">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id" value="<%=savedId %>"/>
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"/>
	<label>
		<input type="checkbox" name="isSave" value="yes"/>아이디 저장</label>

	<button type="submit">로그인</button>
</form>
<a href="signup_form.jsp">회원가입</a>
</body>
</html>