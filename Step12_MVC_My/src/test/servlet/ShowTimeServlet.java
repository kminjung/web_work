package test.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showtime")
public class ShowTimeServlet extends HttpServlet{
	@Override //service
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//1. 비지니스 로직 수행
		String now=new Date().toString();
		//2. 로직 수행 결과로 얻어진 데이터(Model) 를 request 에 담기
		request.setAttribute("now",now);
		//3. view 페이지로 forward 이동
		RequestDispatcher rd=
				request.getRequestDispatcher("/views/showtime.jsp");
		rd.forward(request, response); //forward는 응답을 위임시키는 것 (jsp 로)
		// request 는 1회성데이터이다.사용하려면 request.setAttribute을 써야한다.
	}
}
