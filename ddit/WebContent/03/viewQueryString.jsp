<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	/* request.setCharacterEncoding("UTF-8"); */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>request.getParameter("쿼리스트링 키")</h3>
아이디 : <%=request.getParameter("mem_id") %> <br/>
패스워드 : <%=request.getParameter("mem_pass") %><br/>
성명 : <%=request.getParameter("mem_name") %><br/>
고찰 : <%=request.getParameter("query_group") %><br/>
<h3>request.getParameterMap()</h3>
<!-- Map<String, String[]> 형태로 반환 -->
<%
	 Map<String, String[]> paramMap = request.getParameterMap();
	 Iterator<String> KeyItr = paramMap.keySet().iterator();
	 
	 while(KeyItr.hasNext()){
		 String key = KeyItr.next();
		 String[] values = paramMap.get(key);
		 for(String value : values){

%> 
	<%=key%> : <%=value %><br/>		 
<%			 
		 }
		 
	 }
%>
<h3>request.getParameterNames() : 전송되는 쿼리스트링의 키들을 Enumeration 타입을 반환</h3>
<h3>request.getParameterValues("쿼리스트링 키 ") : 해당 쿼리스트링 키에 맵핑된 값의 문자열 배열 형태 반환</h3>
<%
	Enumeration<String> keys = request.getParameterNames();
	while(keys.hasMoreElements()){
		String key = keys.nextElement();
		String[] values = request.getParameterValues(key);
		for(String value : values){

			%> 
				<%=key%> : <%=value %><br/>		 
			<%			 
	}
	}
%>

</body>
</html>