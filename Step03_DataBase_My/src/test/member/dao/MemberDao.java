package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DBConnect;

public class MemberDao {
	private static MemberDao dao;
	private MemberDao() {}
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();
		}
		return dao;
	}
	public List<MemberDto> getList(){
		//필요한 객체를 담을 지역변수 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//회원목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<>();
		try{
			conn=new DBConnect().getConn();
			String sql="SELECT num,name,addr FROM member "
					+ "ORDER BY num ASC";
			pstmt=conn.prepareStatement(sql);
			//sql 문 수행하고 결과셋 받아오기
			rs=pstmt.executeQuery();
			while(rs.next()){
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String addr=rs.getString("addr");
				//회원 한명의 정보를 MemberDto 객체에 담는다.
				MemberDto dto=new MemberDto(num, name, addr);
				//MemberDto 객체의 참조값을 ArrayList 에 저장
				list.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e){}
		}
		return list;
	}
}