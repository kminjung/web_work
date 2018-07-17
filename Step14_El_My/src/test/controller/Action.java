package test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Action {
	//추상 메소드 - 메소드의 형태만 정의한것
	public abstract ActionForward 
		execute(HttpServletRequest request, HttpServletResponse response); // execute - 실행
}
/*
 * 메소드의 형태를 정의해 놔야지 나중에 가져다가 쓸 수 있으니까
*/
