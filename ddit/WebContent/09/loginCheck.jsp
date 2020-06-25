<%@page import="java.security.PrivateKey"%>
<%@page import="kr.or.ddit.utiles.CryptoGenerator"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String mem_id = request.getParameter("mem_id");
   String mem_pass = request.getParameter("mem_pass");
   
   mem_id = CryptoGenerator.decyptRSA(session, mem_id);
   mem_pass = CryptoGenerator.decyptRSA(session, mem_pass);

   Map<String, String> params = new HashMap<String, String>();
   params.put("mem_id", mem_id);
   params.put("mem_pass", mem_pass);

   IMemberService service = IMemberServiceImpl.getInstance();
   MemberVO memberInfo = service.memberInfo(params);

   String message = "";
   if(service.memberInfo(params) == null){
      message = URLEncoder.encode("회원이 아닙니다", "UTF-8");
   }else {
      session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
      
   }
   response.sendRedirect(request.getContextPath() + "/13/main.jsp?message=" + message);

%>
