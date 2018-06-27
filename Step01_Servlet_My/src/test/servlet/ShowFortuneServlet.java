package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 오늘의 운세를 출력할 서블릿
 */
public class ShowFortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//오늘의 운세 목록
		String[] list= {"동쪽으로 가면 귀인을 만나요",
				"로또를 사면 좋은 결과가 있을 거예요",
				"저녁에 치맥을 먹게 될거예요",
				"다가오늘 주말에 이상형을 만나게 되요",
				"집에가는 길에 비를 맞을거예요"
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
	    pw.println("<title>오늘의운세</title>");
	    pw.println("</html>");
	    pw.println("<body>");
	    pw.println("<h3>오늘의운세 페이지</h3>");
	    pw.print("<p> 운세: <strong>"+fortune+"</Strong></p>");
	    pw.println("</body>");
	    pw.println("</html>");
	    pw.close();
	}
}
