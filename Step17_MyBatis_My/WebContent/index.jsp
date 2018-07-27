<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/home.do"); // cPath sms LoginFilter 에 정의되어 있음
%>