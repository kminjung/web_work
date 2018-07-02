<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%-- 여기는 선언하는 곳--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	여기는 주석영역 jsp 가 해석하지 않는다. 
--%>
<%
	//여기는 service() 메소드 안쪽 영역
%>
<%!
	//여기는 클래스 안쪽 영역 
	
	public String myName="김구라"; //멤버 필드
	
	public void test(){//멤버 메소드
	
	}
%>
<%
	//service() 메서도 안에서 myName 이라는 필드 참조
	System.out.println(myName);
	//service() 메소드 안에서 test() 멤버 메소드 호출
	test();
%>
</body>
</html>