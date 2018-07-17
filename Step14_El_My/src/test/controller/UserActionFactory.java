package test.controller; //어떤 요청이 들어왔을 때 어떻게 응답을 해줄지

import test.action.FortuneAction;
import test.action.InfoAction;
import test.action.PersonAction;
import test.action.TestAction;

public class UserActionFactory {//의 참조값이 필요하면 getInstance를 부르면 된다.
	private static UserActionFactory factory;
	private UserActionFactory(){}
	//자신의 참조값을 리턴해주는 메소드
	public static UserActionFactory getInstance(){
		if(factory==null){
			factory=new UserActionFactory();
		}
		return factory;
	}
	
	//인자로 전달되는 command 를 수행할 Action type 객체를 리턴해주는 
		//메소드
		public Action action(String command){
			//Action 추상클래스 type 을 담을 지역변수 만들기 
			Action action=null;
			if(command.equals("/fortune")) {
				action=new FortuneAction();
			}else if(command.equals("/person")) {
				action=new PersonAction();
			}else if(command.equals("/info")) {
				action=new InfoAction();
			}else if(command.equals("/test")) {
				action=new TestAction();
			}
			
			return action;
		}
		
		
	}
