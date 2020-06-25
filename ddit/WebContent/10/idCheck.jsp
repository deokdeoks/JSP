<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String prod_id = request.getParameter("prod_id");
    
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("prod_id", prod_id);
    	
    	IProdService service = IProdServiceImpl.getInstance();
    	ProdVO prodInfo = service.prodInfo(params);
    	
    	// Map, List, Set , VO => json 형식의 문자열로 천이
    	// http://search.maven.org
    	// jackson-core-asl-1.9.13.jar
    	// jackson-mapper-asl-1.9.13.jar
    	// WEB-INF/lib 	import
    	
    	Map<String, String> jsonMap = new HashMap<String, String>();
    	
    	if(prodInfo == null){
    		//{"flag"	,"true"}
    		jsonMap.put("flag", "true");	
    	}else{
    		//{"flag" : "false"}
    		jsonMap.put("falg", "false");
    		
    	}
    	
    	ObjectMapper jsonDataConvertor = new ObjectMapper();
    	String jsonData = jsonDataConvertor.writeValueAsString(jsonMap);
    	
    	out.println(jsonData);
    	
    %>
