<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ajax 요청 파라미터 추출 
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//유효한 정보인지 확인 / Dto 에 담고
	UsersDto dto=new UsersDto(); //Dto 객체를 생성해서
	dto.setId(id); //set 을 통해 응답해준다
	dto.setPwd(pwd);
	
	boolean isLoginSuccess=UsersDao.getInstance().isValid(dto);
	if(isLoginSuccess){
		//로그인 처리 하기 
		session.setAttribute("id", id);
	}
%>
{"isSuccess":<%=isLoginSuccess %>} 
<%
 // console 에 object 로 boolean type(로그인 성공,실패)여부가 뜬다.
%>