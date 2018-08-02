package test.gallery.action;

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
import test.gallery.dao.GalleryDao;
import test.gallery.dto.GalleryDto;

public class GalleryUploadAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		// ServletContext 객체는 request 객체로 부터 얻어낼수 있다. 
		ServletContext application=request.getServletContext();
		String realPath=application.getRealPath("/upload");

		//최대 업로드 사이즈 값 지정
		int sizeLimit=1024*1024*50; //50 Mbyte
		/*
			WEB-INF/lib/cos.jar 파일이 있어야 아래의 MultipartRequest,
			DefaultFileRenamePolicy 클래스를 import 해서 사용할수 있다.
		*/
		
		// MultipartRequest 객체를 생성한다.
		// 객체가 성공적으로 생성되면 클라이언트가 업로드한 파일이
		// WebContent/upload 폴더에 저장된다. 
		try {
			MultipartRequest mr=new MultipartRequest(request,
					realPath,
					sizeLimit,
					"utf-8",
					new DefaultFileRenamePolicy());	
			String caption=mr.getParameter("caption");
			//파일 시스템에 저장된 파일명 
			String saveFileName=mr.getFilesystemName("image");
			
			//업로드한 클라이언트의 아이디
			HttpSession session=request.getSession();
			String writer=(String)session.getAttribute("id");
			
			//업로드된 파일의 정보를 GalleryDto 에 담고 
			GalleryDto dto=new GalleryDto();
			dto.setWriter(writer);
			dto.setCaption(caption);
			// <img src="/Context Path/upload/kim1.jpg" />
			dto.setImagePath("/upload/"+saveFileName);
			
			//DB 에 저장한다.
			boolean isSuccess=GalleryDao.getInstance().insert(dto);
			//성공 여부를 request 에 담기
			request.setAttribute("isSuccess", isSuccess);
		}catch(IOException ioe) {
			ioe.printStackTrace();
		}

		// view 페이지로 forward 이동해서 응답
		return new ActionForward("/views/gallery/private/upload.jsp");
		

	}

}
