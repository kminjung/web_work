  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath=request.getContextPath();

	response.sendRedirect(cPath+"/home.do"); //home.do 로 리다일렉트 된다.
%>
<%
	//여기서 어떻게 request 랑 response 를 쓸 수 있는거?
%>