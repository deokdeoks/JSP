<%@page import="kr.or.ddit.freeboard.service.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeboardService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bo_no = request.getParameter("bo_no");

	Map<String, String> params = new HashMap<String, String>();
	params.put("bo_no", bo_no);
	
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	service.deleteFreeboard(params);
	
	response.sendRedirect(request.getContextPath() + "/13/main.jsp");
%>
