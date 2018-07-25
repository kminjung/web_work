package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 *  중간에 요청을 가로채서 특정 동작을 하기 위한 클래스 
 *  
 *  1. javax.servlet.Filter 인터 페이스를 구현한다.
 *  2. Filter 의 동작을 맵핑한다.  
 */

//2. 		    /* 이 곳은 로그인을 해야 접근할 수 있다.*/
@WebFilter({"/users/private/*","/file/private/*","/cafe/private/*"})
// 필터링을 여러개 할 때 String배열{}로 요청경로를 여러개 가지면 된다.배열의 방마다 문자열을 가지고 있는 것
public class LoginFilter implements Filter{//1.implements - 도구 / 특별한 일을 할 수 있는 객체가 된다.
		//빨간 오류 났을 때 마우스 대기				// 요청을 가로채서 로그인 했는지 안했는지 검증한다.
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

		//필터가 동작될 때 호출되는 메소드 
	@Override // 요청이 왔을 때 거치는 곳 1.
	public void doFilter(ServletRequest req, ServletResponse res, 
			FilterChain chain)
			throws IOException, ServletException {
		//필터에 요청이 걸리면 실행이 이쪽으로 온다.
		System.out.println("doFilter() ...");
		
		//원래 type 으로 casting
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		
		//context path 
		String cPath=request.getContextPath();
		//현재 요청된 url 정보를 읽어온다.(원래 이동하려던 목적지) 
		String url=request.getRequestURI();
		
		//세션 객체를 얻어와서 / 핵심로직
		HttpSession session=request.getSession();
		//id 가 저장되어 있는지 읽어와본다.
		String id=(String)session.getAttribute("id");//세션의 아이디를 가져온다.
		if(id==null) {//로그인 안했으면
			//로그인 페이지로 이동하라고 리다일렉트 응답을 준다.
			response.sendRedirect(cPath+"/users/loginform.do?url="+url); // sendRedirect - 응답
		}else {
			// 요청의 흐름 계속 진행 시키기 
			chain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
/*
 *  - ServletRequest 를 상속받아서 만든 것이 HttpServletRequest
 *  - 세션에 로그인정보가 없으면 로그인 하는 곳으로 리다일렉트 해준다.
 */


