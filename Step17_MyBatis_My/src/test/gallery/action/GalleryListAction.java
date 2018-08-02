package test.gallery.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;
import test.gallery.dao.GalleryDao;
import test.gallery.dto.GalleryDto;

public class GalleryListAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. FileDto 객체를 전달해서 파일 목록을 불러온다.
		List<GalleryDto> list=GalleryDao.getInstance().getList();
		//2. request 에 담고
		request.setAttribute("list", list);

		//3. view 페이지로 forward 이동
		return new ActionForward("/views/gallery/list.jsp");

	}

}
//이미지 목록을 얻어온다.
