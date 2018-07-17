<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		[ 영역(scope) ]
				
		1. page 영역(scope)
		2. request 영역
		3. session 영역
		4. application 영역
	*/
	
	//page scope 에 "myName" 이라는 키값으로 String type 저장 / set 해서 넣고 get 으로 읽어온다.
	pageContext.setAttribute("myName", "김구라"); //pageContext 으로 한다.
	//request scope 에 "yourName" 이라는 키값으로 String type 저장 / 요청이 발생할때마다 생성되고, 응답 결과를 출력하면 영역이 사라진다
	request.setAttribute("yourName", "원숭이");
	//session scope 에 "ourName" 이라는 키값으로 String type 저장 / 임의로 지우지 않거나 웹 브라우저를 닫기 전까지는 살아있다.
	session.setAttribute("ourName", "Acorn");
	//application scope 에 "herName" 이라는 키값으로 String type 저장
	application.setAttribute("herName", "신민아"); //임의로 지우지 않는 이상 서버를 껏다 키기까지 살아있다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/scope/test01.jsp</title>
</head>
<body>
<p>myName=<strong>${pageScope.myName }</strong></p>
<p>myName=<strong>${myName }</strong></p>
<p>yourName=<strong>${requestScope.yourName }</strong></p>
<p>yourName=<strong>${yourName }</strong></p>
<% 
	// 아래 두 줄의 코드는 ${ourName} 으로 대체할 수 있다.
	String ourName=(String)session.getAttribute("ourName");
%>
<p>ourName=<strong><%=ourName %></strong></p>
<p>ourName=<strong>${sessionScope.ourName }</strong></p>
<p>ourName=<strong>${ourName }</strong></p>
<p>herName=<strong>${applicationScope.herName }</strong></p>
<p>herName=<strong>${herName }</strong></p>
</body>
</html>

<!-- 
	객체 종류
- page : 하나의 JSP가 실행되는 작업 영역.
- request : 하나의 요청이 처리되는 작업 영역, 요청이 발생할때마다 생성되고, 응답 결과를 출력하면 영역이 사라진다. 요청 처리에 필요한 다수의 JSP을 포함한다에 있어서 page객체와 차이를 보인다.
- session : 하나의 웹 브라우저가 실행되는 작업 영역, 브라우저와 관련된 모든 요청들을 포함한다.
- application : 하나의 웹 어플리케이션와 관련된 작업을 처리하는 영역. 모든 JSP, 모든 요청, 모든 세션을 어플리케이션 영역에 포함한다.


	
 -->