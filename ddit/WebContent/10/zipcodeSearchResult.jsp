<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeServiceImpl"%>
<%@page import="kr.or.ddit.zipcode.service.IZipcodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String dong = request.getParameter("dong");



IBuyerService service = IBuyerServiceImpl.getInstance();
List<BuyerVO> list = new ArrayList<BuyerVO>();
list = service.buyerList(dong);

ObjectMapper jsonDataConvertor = new ObjectMapper();
String jsonData = jsonDataConvertor.writeValueAsString(list);
out.println(jsonData);
	
%>