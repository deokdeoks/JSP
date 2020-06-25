<%@page import="kr.or.ddit.freeboard.service.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeboardService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트의 form 태그 서브밋시 쿼리스트링 전송방식 POST일때 한글 처리
	/* request.setCharacterEncoding("UTF-8"); */
	
	FreeboardVO freeboardInfo = new FreeboardVO();
	BeanUtils.populate(freeboardInfo, request.getParameterMap());
	
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	service.updateFreeboard(freeboardInfo);
	
	response.sendRedirect(request.getContextPath() + "/13/main.jsp");
%>