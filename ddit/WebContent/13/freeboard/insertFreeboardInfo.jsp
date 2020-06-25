<%@page import="kr.or.ddit.utiles.FileUploadRequestWrapper"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeboardServiceImpl"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@page import="kr.or.ddit.freeboard.service.IFreeboardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 클라이언트의 form 태그 서브밋시 쿼리스트링 전송방식 POST일 때 한글 처리
 /*   //request.setCharacterEncoding("utf-8"); */
   FileUploadRequestWrapper wrapper = new FileUploadRequestWrapper(request);   

   FreeboardVO freeboardInfo = new FreeboardVO();
   BeanUtils.populate(freeboardInfo, wrapper.getParameterMap());
   
   IFreeboardService service = IFreeboardServiceImpl.getInstance();
   service.insertFreeboard(freeboardInfo, wrapper.getFileItemValues("files"));

   response.sendRedirect(request.getContextPath()+"/13/main.jsp");
%>