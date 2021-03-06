package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

public class IMemberDaoImpl implements IMemberDao {

	private static IMemberDao dao;

	private SqlMapClient smc;

	public static IMemberDao getInstance() {
		if (dao == null) {
			dao = new IMemberDaoImpl();
		}
		return dao;
	}

	public IMemberDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {

		return (MemberVO) smc.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return smc.queryForList("member.memberList");
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) throws Exception {
		smc.update("member.deleteMember", params);
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws Exception {
		// update쿼리
		// 테이블 생성
		// 프로시저, 펑션을 작성 및 호출
		// 오라클 객체 생성
		// client.update(arg0)
		smc.update("member.updateMember", memberInfo);
	}

	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws Exception {
		smc.insert("member.insertMember",memberInfo);
	}
}
