  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath=request.getContextPath();

	response.sendRedirect(cPath+"/home.do"); //home.do 로 리다일렉트 된다.
%>
<%
	//			비즈니스 로직은 Action 에서 처리
	//home.do  >  HomeAction  >  /views/home.jsp	 >  /home
	//		request 	forward,move 		  response
	//	   			forward - 응답을 위임시킨다
	
	
	//vew 페이지에서 request 영역에 담긴 내용을 가져오고 싶을 땐(추출) ${requestScope.key}
	//			 session 영역에 담긴 내용 			(추출)  ${sessionScope.key}
	//			  파라미터 영역에 담긴 내용을 가져오고 싶을 땐  (추출)  ${param.name}
		
	
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

	// UsersInfoAction
	// UserActionFactory
	// info.jsp
	
	
	//update.jsp
	//
	
	//UsersDeleteAction
	//delete.jsp
	
	
	
	// UsersUpdateFormAction
	// 
	// updateform.jsp
	//1-2-3-4-5 UserActionFactory
	
		
%>