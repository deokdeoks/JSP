<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="javax.activity.InvalidActivityException"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    /* request.setCharacterEncoding("UTF-8"); */
    
    BuyerVO buyerInfo = new BuyerVO();
    
    try{
    		BeanUtils.populate(buyerInfo, request.getParameterMap());
    	
    }catch (IllegalAccessException e){
    	e.printStackTrace();
    }catch (InvocationTargetException e){
    	e.printStackTrace();
    }
    
    IBuyerService service = IBuyerServiceImpl.getInstance();
    service.insertBuyerInfo(buyerInfo);
    
    response.sendRedirect("/ddit/12/main.jsp");
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