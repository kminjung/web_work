package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/requestScope/showdata")
public class ShowDataServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//파라미터로 전달되는 번호를 읽어온다.
		int num=Integer.parseInt(request.getParameter("num"));
		//DB 에서 num 에 해당되는 정보를 읽어왔다고 가정하자.
		MemberDto dto=new MemberDto(num, "김구라", "노량진");
		
		//request 영역 (request scope) 에 dto 담기
		// .setAttribute("키", value(object로 담아주니까 뭐든 담을 수 있다.문자열,실수,정수));
		request.setAttribute("dto", dto);
		
		//forward 이동해서 응답한다.( jsp 페이지로 응답 위임하기 )
		RequestDispatcher rd=
				request.getRequestDispatcher("/path1/showdata.jsp");//← webContent
		rd.forward(request, response);
	}
}
/*
 *  - 클라이언트가 요청했을 때 응답을 jsp 로 위임하는 것이 forward이다.
 *    응답에 필요한 객체인 request, response 도 같이 넘겨준다.
 *    
 *  - 하나의 서블릿은 여러 클라이언트의 요청을 처리한다.요청을 request 영역에 담으면 응답하고 난 뒤 사라진다.
 *  
 *  - 어떤 키값으로 어떤 타입을 담았는지 기억해야 한다.
 *  - MemberDto를 담은 dto 는 /path1/showdata.jsp 에서 응답을 하고 난 뒤 사라진다.
 */
