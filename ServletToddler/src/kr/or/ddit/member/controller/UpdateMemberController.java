package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class UpdateMemberController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//	/ServletToddler/member/updateMemberInfo
		//	쿼리스트링 전송방식 : post
		//				   mem_id, mem_pass, mem_add1, mem_add2,......
		
		//	쿼리스트링과 VO와의 맵핑 처리 환경
		//	http://commons.apache.org
		//	commons-beanutils-1.8.3.jar
		//	commons-logging-1.1.1.jar
		request.setCharacterEncoding("UTF-8");
		// 자바 빈 : private 변수;
		//		setter/getter
		//		DTO(Data Transfer Object) :	C/S 사이에 직렬화되어 전송되는 불변의 객체 
		//		VO(Value Object)		  : 특정 레이어(클라이언트 또는 서버)내에서 활용되는 변경 가능한 객체
		MemberVO memberInfo = new MemberVO();
		try {
			//1. 쿼리스트링의 키와 일치하는 변수명과 setter를 포함하는 VO의 인스턴스가 작성
			//2. 전체 쿼리스트링의 키 = 값을 Map 형태로 반환하는 request.getParameterMap() 활용
			//3. populate()내부에서는 Map에서 키들만을 취득.
			//	 3.1 키명 이터레이팅 수행
			//	 3.2 Map으로 취득한 키명과 일치하는 VO의 변수가 존재하는지 여부를 검증(리플렉션 적용)
			//	 3.3 쿼리스트링의 키명과 일치하는 VO의 변수가 존재하면 해당 변수의 
			//		setter를 통해 해당 쿼리스트링의 키와 맵핑된 값을 전달
			BeanUtils.populate(memberInfo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		IMemberService service = IMemberServiceImpl.getInstance();
		service.updateMemberInfo(memberInfo);
		
		response.sendRedirect("/ServletToddler/member/memberList");
		
	}

}
