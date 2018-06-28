package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class greetServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//오늘의 인사
		String[] list= {"안녕하세요",
				"감사해요",
				"잘있어요",
				"다시만나요",
				"룰루룰루"
		};
		// 0 ~ 4 사이의 랜덤한 정수 얻어내기
		int index=new Random().nextInt(5);
		//오늘의 운세
		String fortune=list[index];
		
		//응답 인코딩 설정
		response.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정
		response.setContentType("text/html;charset=utf-8");//html 문서라고 알려주는 것
		//클라이언트에게 응답할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw=response.getWriter();
	    //html 형식으로 응답하기
	    pw.println("<doctype html>");
	    pw.println("<html>");
	    pw.println("<head>");
	    pw.println("<meta charset='utf-8'/>");
	    pw.println("<title>오늘의인사</title>");
	    pw.println("</html>");
	    pw.println("<body>");
	    pw.println("<h3>오늘의인사 페이지</h3>");
	    pw.print("<p> 인사: <strong>"+fortune+"</Strong></p>");
	    pw.println("</body>");
	    pw.println("</html>");
	    pw.close();
	}
}
//파란색은 바뀌지않는 정적인 요소지만 fortune 은 계속 바뀔 수 있동적인요소다.
