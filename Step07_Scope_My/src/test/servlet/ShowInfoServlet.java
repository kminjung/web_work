package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessionScope/showinfo")
public class ShowInfoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//세션 영역에 (session scope) 에 정보 담기
		HttpSession session=request.getSession(); //세션은 리퀘스트로부터 찾아온다.
		// .setAttribute("키",value)
		// "myName" 이라는 키값으로 String type 담기
		session.setAttribute("myName", "김구라");//session.setAttribute - 응답을 할 때 웹 브라우저에 표시를 한다.
		
		String cPath=request.getContextPath();
		// 리다일렉트 이동하라고 응답하기
		response.sendRedirect(cPath+"/path2/result.jsp");//세션에 담긴 내용을 읽어보겠다.
	}
}
/*
 * - 리다일렉트는 그 자체가 응답이다. 사용할 때는 컨텍스트 경로가 들어가야한다.
 * - 세션에 담은 것은 응답을 한 뒤에도 사라지지 않는다. (ex 로그인하고 뒤로가기 해도 로그인을 다시 안해도 된다.)
 * - 서버는 여러 클라이언트를 상대하는데, 각각의 클라이언트를 구별할 수 있도록 클라이언트의 웹 브라우저표시를 해 둔다.
 * - 방금 요청을 해온 클라이언트의 사이드에다가 표시를 하는 것을 쿠키 라고 한다.
 * - 웹브라우저를 닫거나 일정 시간이 흐르거나 세션에 있는 것을 지우는 요청을 하면 세션에 있는 것은 지워진다.
 * - 세션객체를 잘 사용해야지 로그인,로그아웃을 처리할 수 있다. 즉 세션에다가 값을 담느냐 지우느냐
 * - 세션은 리퀘스트로부터 찾아온다.
 * - index 을 다시 하면 여기가 로딩됨.
 */
