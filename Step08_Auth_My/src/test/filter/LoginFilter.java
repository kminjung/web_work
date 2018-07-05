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
 *  만드는 방법
 *  1. javax.servlet.Filter 인터페이스를 구현한다.
 *  2. Filter 의 동작을 맵핑한다.
 */
@WebFilter({"/market/*","/users/private/*"})
public class LoginFilter implements Filter{
	
	//빨간 오류 났을 때 마우스 대기
	@Override
	public void destroy() {
		
		
	}

	@Override // 요청이 왔을 때 거치는 곳 1.
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain)
			throws IOException, ServletException {
		//필터에 요청이 걸리면 실행이 이쪽으로 온다.
		System.out.println("doFilter()...");
		
		//원래 type 으로 casting
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		
		//context path
		String cPath=request.getContextPath();
		//현재 요청된 url 정보를 읽어온다.(원래 이동하려던 목적지)
		String url=request.getRequestURI();
		
		//세션 객체를 얻어와서
		HttpSession session=request.getSession();
		//id 가 저장되어 있는지 읽어와본다.
		String id=(String)session.getAttribute("id");
		if(id==null) {//로그인 안했으면
			//로그인 페이지로 이동하라고 리다일렉트 응답을 준다.
			response.sendRedirect(cPath+"/users/loginform.jsp?url="+url);
		}else {//로그인 했을 때 하던 동작을 계속 하라
			chain.doFilter(req, res);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
