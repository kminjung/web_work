package test.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.member.dto.MemberDto;
import test.mybatis.SqlMapConfig;

public class MemberDao {
	//static 필드
	private static MemberDao dao;
	private static SqlSessionFactory factory; //Dao 가 의존하는 객체
	//생성자
	private MemberDao() {}
	//MemberDao 객체를 리턴해주는 static 멤버 메소드
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();
			factory=SqlMapConfig.getSqlSession(); //* factory의 참조값을 얻어내고 
		}
		return dao;
	}
	//회원 정보를 저장하는 메소드 
	public boolean insert(MemberDto dto) { // 성공하면 flag 에 1이 담긴다.
		// DB 에 작업을 할 SqlSession 객체를 담을 지역 변수 만들기
		SqlSession session = null;
		int flag = 0;
		try {
			// .openSession(auto commit 자동커밋 여부) 
			session = factory.openSession(true); // true 전달하지 않으면 commit 이 안됨.
			// .insert("mapper이름.sql아이디, 파라미터 (type) )
			flag=session.insert("member.insert", dto); //세션을 통해서 DB 에 작업을 한다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean update(MemberDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag=session.update("member.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean delete(int num) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag=session.delete("member.delete", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	public MemberDto getData(int num) {
		SqlSession session=null;
		MemberDto dto=null;
		try {
			session=factory.openSession();
			/* 
			 * Mapper 의 namespace : member
			 * sql 의 id : getData
			 * parameterType : int
			 * resultType : MemberDto
			 * 
			 */
			dto=session.selectOne("member.getData", num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return dto;
	}
	public List<MemberDto> getList(){
		SqlSession session=null;
		List<MemberDto> list=null;
		try {
			session=factory.openSession();
			/*
			 *  Mapper namespace : member
			 *  sql id : getList
			 *  parameterType: X
			 *  resultType : MemberDto
			 */
			list=session.selectList("member.getList");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
}