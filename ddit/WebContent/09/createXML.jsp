<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String mem_id = request.getParameter("mem_id");
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
 	// xml 데이타 응답객체를 통해 브라우저에 전송.
 	IMemberService service = IMemberServiceImpl.getInstance();
    List<MemberVO> memberList = service.memberList(params);
    
    out.println("<members>");
    for(MemberVO memberInfo : memberList){
    	out.println("<member id = '"+ memberInfo.getMem_id() + "'>");
    		out.println("<mem_pass>" + memberInfo.getMem_pass() + "</mem_pass>");
    		out.println("<mem_regno1>" + memberInfo.getMem_regno1() + "</mem_regno1>");
    		out.println("<mem_regno2>" + memberInfo.getMem_regno2() + "</mem_regno2>");
    	out.println("</member>");
    }
    out.println("</members>");
    
    %>
