<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
		String buyer_id = request.getParameter("buyer_id");
		Map<String, String> params = new HashMap<String, String>();
		params.put("buyer_id", buyer_id);
		
		IBuyerService service = IBuyerServiceImpl.getInstance();
		service.deleteBuyerInfo(params);
		
		//클라이언트 대상 해당 URI  및 쿼리스트링을 서버로부터 전송하고 
		//클라이언트가 취득한 해당 URI 및 쿼리스트링을 기초로 즉시 서버 요청이 시작
 		//response.sendRedirect("URI");
		
		//포워드 요청
		//	*포워드 대상 주소는 서블릿 패스만 선언(컨텍스트 루트 | 패스 는 배제)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/12/main.jsp");
		dispatcher.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		</body>
</html>