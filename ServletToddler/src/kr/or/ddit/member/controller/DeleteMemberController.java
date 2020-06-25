package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;

public class DeleteMemberController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// /ServletToddler/member/deleteMemberInfo?mem_id=a001
		String mem_id = request.getParameter("mem_id");
		Map<String, String> params = new HashMap<>();
		params.put("mem_id", mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		service.deleteMemberInfo(params);
		
		//클라이언트 대상 해당 URI  및 쿼리스트링을 서버로부터 전송하고 
		//클라이언트가 취득한 해당 URI 및 쿼리스트링을 기초로 즉시 서버 요청이 시작
 		//response.sendRedirect("URI");
		
		//포워드 요청
		//	*포워드 대상 주소는 서블릿 패스만 선언(컨텍스트 루트 | 패스 는 배제)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/memberList");
		dispatcher.forward(request, response);
	}
	
}
