<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* request.setCharacterEncoding("UTF-8"); */

	ProdVO prodInfo = new ProdVO();
	try {
		//1. 쿼리스트링의 키와 일치하는 변수명과 setter를 포함하는 VO의 인스턴스가 작성
		//2. 전체 쿼리스트링의 키 = 값을 Map 형태로 반환하는 request.getParameterMap() 활용
		//3. populate()내부에서는 Map에서 키들만을 취득.
		//	 3.1 키명 이터레이팅 수행
		//	 3.2 Map으로 취득한 키명과 일치하는 VO의 변수가 존재하는지 여부를 검증(리플렉션 적용)
		//	 3.3 쿼리스트링의 키명과 일치하는 VO의 변수가 존재하면 해당 변수의 
		//		setter를 통해 해당 쿼리스트링의 키와 맵핑된 값을 전달
		BeanUtils.populate(prodInfo, request.getParameterMap());
	} catch (IllegalAccessException e) {
		e.printStackTrace();
	} catch (InvocationTargetException e) {
		e.printStackTrace();
	}
	IProdService service = IProdServiceImpl.getInstance();
	service.updateProdInfo(prodInfo);
	
	response.sendRedirect("/ddit/10/main.jsp");
    
    
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