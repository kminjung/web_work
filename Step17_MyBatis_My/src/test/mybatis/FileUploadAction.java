package test.mybatis;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;

public class FileUploadAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//파일을 저장할 폴더의 절대 경로 얻어오기
		//application 은 ServletContext type 객체 인데 jsp 기본 객체이다.
		//WebContent/upload 폴더를 만들어야 한다. 
		ServletContext application=request.getServletContext();
		String realPath=application.getRealPath("/upload");

		//최대 업로드 사이즈 값 지정
		int sizeLimit=1024*1024*50; //50 Mbyte 용량제한도 필요
		/*
			WEB-INF/lib/cos.jar 파일이 있어야 아래의 MultipartRequest,
			DefaultFileRenamePolicy 클래스를 import 해서 사용할수 있다.
		*/
		
		// MultipartRequest 객체를 생성한다.
		// 객체가 성공적으로 생성되면 클라이언트가 업로드한 파일이
		// WebContent/upload 폴더에 저장된다. 
		try {
			MultipartRequest mr=new MultipartRequest(request, // 생성자의 인자에다가 이 5가지의 아이들을 전한다.
					realPath,
					sizeLimit,
					"utf-8",
					new DefaultFileRenamePolicy());//파일에 같은 파일이 있으면  rename 을 한다.
			//업로드된 파일의 정보는 mr 객체를 이용해서 얻어온다.
			String title=mr.getParameter("title");
			//원본 파일명
			String orgFileName=mr.getOriginalFileName("myFile");
			//파일 시스템에 저장된 파일명 
			String saveFileName=mr.getFilesystemName("myFile");
			//파일의 크기 
			long fileSize=mr.getFile("myFile").length();//파일을 다운로드할 때 필요함
			// 
			
			//업로드한 클라이언트의 아이디
			HttpSession session=request.getSession();
			String writer=(String)session.getAttribute("id");
			
			//업로드된 파일의 정보를 FileDto 에 담고 
			FileDto dto=new FileDto();
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setOrgFileName(orgFileName);
			dto.setSaveFileName(saveFileName);
			dto.setFileSize(fileSize);
			
			//DB 에 저장한다.
			boolean isSuccess=FileDao.getInstance().insert(dto);
			//성공 여부를 request 에 담기
			request.setAttribute("isSuccess", isSuccess);
		}catch(IOException ioe) {
			ioe.printStackTrace();
		}

		// view 페이지로 forward 이동해서 응답
		return new ActionForward("/views/file/upload.jsp");
	}

}