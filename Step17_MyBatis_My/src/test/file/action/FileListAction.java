package test.file.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;
/*
 *  파일 목록을 출력해주는 액션
 */
public class FileListAction extends Action{
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5; //여기 수정하면 됨 /페이지 처리를 하기 위한 입력값
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=3; //여기 수정하면 됨
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum"); //파라미터 명이 바뀌었다면 여기도 수정
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=FileDao.getInstance().getCount(); // 여기 수정하면 됨
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		FileDto dto=new FileDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum); // startRownum 과 endRowNum 을 dto로 보낸다. ( 6~10번까지 나와!) 
		
		//1. FileDto 객체를 전달해서 파일 목록을 불러온다.
		List<FileDto> list=FileDao.getInstance().getList(dto);
		//2. request 에 담고
		request.setAttribute("list", list);
		// 페이징 처리에 관련된 값도 request 에 담기
		request.setAttribute("pageNum", pageNum); //현재 보고있는 페이지
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);//
		//3. view 페이지로 forward 이동
		return new ActionForward("/views/file/list.jsp");
	}

}

/* an = 1 + ( n(pageNum) - 1 ) d(page row Count) */
/*
 *  페이지 처리를 하려면 DB 에 row 가 몇개인지 알아야 한다.
 *  
 *  < 1 2 3 4 5 > / < 1 2 3 4 5 6 7 8 9 10 > ··········· - PAGE_DISPLAY_COUNT 몇 개씩 나타낼 것인지
 *  그리고 현재 보고있는 페이지에 표시가 되어 있다.
 */
