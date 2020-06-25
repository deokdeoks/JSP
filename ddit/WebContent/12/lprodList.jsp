<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<LprodVO> list = new  ArrayList<LprodVO>();
	
	list = service.lprodList();
	
	ObjectMapper jsonDataConvertor = new ObjectMapper();
	
	String jsonData = jsonDataConvertor.writeValueAsString(list);
	out.println(jsonData);



%>