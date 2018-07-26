package test.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory; //interface type
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	//static 맴버 필드로 SqlSessionFactory type 선언
	private static SqlSessionFactory sqlSession;
	//static 초기화 블럭 (초기화 설정이 되는 곳) SqlSessionFactory 을 잘 만들기 위해서 static에서 준비작업을 한다.
	static{ // 스테틱 필드
		//MyBatis 설정 xml 문서의 위치 
		String resource="test/mybatis/Configuration.xml"; /* ←  읽어들여서 ↓ 초기화 설정한 것 오류 있으면 데이터가 안불러와진다. 오류가뜨면 어기서 확인하기*/
		try{
			Reader reader=Resources.getResourceAsReader(resource);
			//SqlSessionFactory 객체의 참조값을 얻어내서 맴버필드에 저장
			sqlSession=new SqlSessionFactoryBuilder().build(reader);
			reader.close();//SqlSessionFactory 객체를 만든것
			System.out.println("SqlSessionFactory 객체 생성 성공!");
		}catch(Exception e){ // 예외가 발생하면 뭐가 어떻게 잘못됬는지 console 창에 찍힘
			e.printStackTrace();
			System.out.println("SqlSessionFactory 객체 생성 실패!");
		}
	}
	//static 맴버 메소드 / sqlSession 세션객체를 만들어 내는 factory 역할 / sqlSession 은 Dao 에서 의존함
	public static SqlSessionFactory getSqlSession(){
		return sqlSession;
	}
	
}
/* 클래스가 최초 사용 될 때 static 으로 실행순서가 한번 들어온다. (최초 한번) */
//  Dao 에서 필요한것은 sqlsession 이다.
