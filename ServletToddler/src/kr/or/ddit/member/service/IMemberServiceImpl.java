package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.IMemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class IMemberServiceImpl implements IMemberService {

	// 싱글톤 패턴
	private static IMemberService service;
	private IMemberDao dao;

	public static IMemberService getInstance() {
		if (service == null) {
			service = new IMemberServiceImpl();
		}
		return service;
	}

	private IMemberServiceImpl() {
		dao = IMemberDaoImpl.getInstance();
	}

	@Override
	public MemberVO memberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.memberInfo(params);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return memberInfo;
	}
	
	
	@Override
	public List<MemberVO> memberList() {
		List<MemberVO> memberList = null;
		try{
			memberList = dao.memberList();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return memberList;
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) {
		try{
			dao.deleteMemberInfo(params);
		}catch(Exception e1){
			e1.printStackTrace();
		}
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) {
		try{
			dao.updateMemberInfo(memberInfo);			
		}catch(Exception e1){
			e1.printStackTrace();
		}
	}

	@Override
	public void insertMEmberInfo(MemberVO memberInfo) {
		try {
			dao.insertMemberInfo(memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
