  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath=request.getContextPath();

	response.sendRedirect(cPath+"/home.do"); //home.do 로 리다일렉트 된다.
%>
<%	
	//1.users/signup_form.do
	//1-1 SignupFormAction
	
	
	//2.users/checkid.do 아이디를 사용할 수 있는지 없는지
	//2-1.CheckIdAction
	
	
	//3.users/signup.do
	//3-1.SignupAction	
	
	
	//4.  	 request 	     forward        view page
	// login.do => LoginAction => /views/users/login.jsp		
	
	//			UserActionFactory
	
	
	//4 LoginFormAction 자바코드는 최대한 이쪽으로 옮기는게 좋다
	//UserActionFactory
	//loginform.jsp
	//LoginAction
	//login.jsp / LoginAction 에서 비즈니스 로직을 다 처리했기 때문에 java 코드가 없음
	
	
	//5. LogoutAction
	// UserActionFactory
	// logout.jsp


	//1-2-3-4-5 UserActionFactory
	
		
%>