package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showfortune")
public class ShowFortune extends HttpServlet{
   @Override
   protected void service(HttpServletRequest request,
		   HttpServletResponse response) throws ServletException, IOException {
   
      //1. 오늘의 운세를 얻어오는 비지니스 로직 수행
      String fortuneToday="밖에 나가면 더워요!";
      //2. 로직 수행 결과로 얻어진 데이터(Model)을 request에 담기
      request.setAttribute("fortuneToday", fortuneToday);
      //3. view 패아지로 (jsp 패이지로) forward 이동
      RequestDispatcher rd=
            request.getRequestDispatcher("/views/showfortune.jsp");
      rd.forward(request, response);
   }
}
/*
 *  - 어떤 요청에 대해서 어떤 로직을 통해 결과를 나타낼 때 
 *  - 1.리퀘스트에 담는다. request.setAttribute
 *  - java 에서 Model 은 int,float,String,xxxDto,List<XXX>(가변배열,제너릭은 상황에 따라 다름)
 *  - ↑ 을 request 에 담기
 *  - set 담은 것은 get 로 불러올 수 있음
 *  - ("fortuneToday") 키 값 기억하기
 */ 