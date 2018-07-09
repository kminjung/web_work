<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test4/popup.jsp</title>
</head>
<body>
<%
	//팝업창을 띄울지 여부
	boolean canPopup=true;
	//모든 쿠키를 배열로 얻어낸다.
	Cookie[] cooks=request.getCookies();
	if(cooks!=null && cooks.length>0){//쿠키가 존재한다면
		//반복문 돌면서 쿠키 객체 하나씩 참조해서
		for(Cookie tmp:cooks){
			//쿠키의 이름이 "canPopup" 이라면
			if(tmp.getName().equals("canPopup")){
				//팝업창을 띄우지 않도록 설정
				canPopup=false;
			}
		}
	}
%>
<%if(canPopup){ %> <!-- 조건부 출력 canPopup 이 true 일 때만 출력 -->
<script>
	//팝업 띄우기
	window.open("popup_page.jsp", "팝업",
			"width=500,height=500,top=100,left=100");
		
</script>
<%} %>

<h3>메인 페이지입니다.</h3>
<p>구라 홈쇼핑</p>
<p>바캉스를 즐겨용호호호호호</p>
</body>
</html>