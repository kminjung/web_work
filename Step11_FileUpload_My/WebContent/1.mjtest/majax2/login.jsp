<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 로그인 응답처리 -->
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
%>
<%
	UsersDto dto=new UsersDto(); //메소드가 정의되어 있는 Dto 객체를 생성해서
	dto.setId(id); //set 을 통해 응답해준다.
	dto.setPwd(pwd);
	
	boolean isLoginSuccess=UsersDao.getInstance().isValid(dto);
	if(isLoginSuccess){
		session.setAttribute("id", id);//세션에 아이디 속성을 넣어준다.
	}
%>
{"isLoginSuccess":<%=isLoginSuccess %>}