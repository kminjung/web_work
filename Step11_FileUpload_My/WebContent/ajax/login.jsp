<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ajax 요청 파라미터 추출 
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//유효한 정보인지 확인 / Dto 에 담고
	UsersDto dto=new UsersDto();
	dto.setId(id); // dto 에 id 담아서
	dto.setPwd(pwd); // ↓ 에서 확인한다.
	
	boolean isLoginSuccess=UsersDao.getInstance().isValid(dto);//Dao 를 통해 db의 저장공간에서 dto 유효성검사를 한다.
	if(isLoginSuccess){
		//로그인 처리 하기 
		session.setAttribute("id", id); //세션에 ("이름",불러오는 값)을 넣어준다.
		}
%>
{"isSuccess":<%=isLoginSuccess %>} <% // 로그인 성공여부에 따라 isLoginSuccess 를 출력한다.%>

<%
	/*
		Valid - 유효한
		Instance - 저장공간
		Attribute - 속성
	*/
%>