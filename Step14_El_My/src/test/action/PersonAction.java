package test.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class PersonAction extends Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String pr="헤헤헤헤헤헤헿";
		request.setAttribute("pr", pr);
		return new ActionForward("/views/person.jsp");
	}

}
