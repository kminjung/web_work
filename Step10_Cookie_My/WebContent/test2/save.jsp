<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 파라미터로 전달 된 쿠키 이름과 쿠키 값을 읽어온다.
	String name=request.getParameter("name");
	String value=request.getParameter("value");
	// 쿠키 객체를 생성해서 정보를 담고
	Cookie cook=new Cookie(name, value);
	cook.setMaxAge(60);
	response.addCookie(cook); //응답될 때 script 에 있는 내용이 알아서 심어진다.
	//바로 리다일렉트 응답 주기
	response.sendRedirect("cookie_form.jsp");//이 자체가 응답.쿠키가 심어진다.
	//save.jsp 로 가야하는데 클라이언트에게는 그 페이지에서 새로고침 한 것처럼 보임.
	//cookie_form(form submit) → save.jsp(redirect) → cookie_form.jsp
	//처리 할 로직은 다 처리하고 cookie_form.jsp 경로로 다시 요청을 하는 것
%>
