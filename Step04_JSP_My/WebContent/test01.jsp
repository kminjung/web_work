<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test01.jsp</title>
</head>
<body>
<%
	//여기는 java 코딩을 할 수 있는 영역입니다.
	int num=1;
	String name="김구라";
	String addr="노량진";
%>
<h3>jsp 테스트</h3>
<!-- 문자나 숫자를 출력할 수 있는 out 객체 -->
<p>번호 : <strong><% out.print(num); %></strong></p>
<p>이름 : <strong><% out.print(name); %></strong></p>
<p>주소 : <strong><% out.print(addr);%></strong></p>
<hr />
<!-- %=에 참조 된 위치에 숫자나 문자인 경우 변수에 있는 내용을 그대로 출력하고 싶을 때 -->
<p>번호 : <strong><%=num %></strong></p>
<p>이름 : <strong><%=name %></strong></p>
<p>주소 : <strong><%=addr %></strong></p>
</body>
</html>

