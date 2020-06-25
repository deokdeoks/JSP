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
    
    MemberVO memberInfo = new MemberVO();
    
    try{
    		BeanUtils.populate(memberInfo, request.getParameterMap());
    	
    }catch (IllegalAccessException e){
    	e.printStackTrace();
    }catch (InvocationTargetException e){
    	e.printStackTrace();
    }
    
    IMemberService service = IMemberServiceImpl.getInstance();
    service.insertMEmberInfo(memberInfo);
    
    response.sendRedirect("/ddit/06/memberList.jsp");
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