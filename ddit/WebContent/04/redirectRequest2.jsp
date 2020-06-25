<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>pageContext 영역 값 취득 </h3>
<%
	MemberVO pageScopeData = (MemberVO)pageContext.getAttribute("pageMemberInfo");
	if(pageScopeData != null){
		
	
%>
아이디 : <%=pageScopeData.getMem_id() %><br/>
패스워드 : <%=pageScopeData.getMem_pass() %><br/>
성명 : <%=pageScopeData.getMem_name() %><br/>
<%
	}
%>
<h3>request 영역 값 취득 </h3>
<%
MemberVO requestScopeData = (MemberVO)request.getAttribute("reqMemberInfo");
	if(requestScopeData != null){
		
	
%>
아이디 : <%=requestScopeData.getMem_id() %><br/>
패스워드 : <%=requestScopeData.getMem_pass() %><br/>
성명 : <%=requestScopeData.getMem_name() %><br/>
<%
	}
%>
<h3>session 영역 값 취득 </h3>
아이디 : <%=((MemberVO)session.getAttribute("sesMemberInfo")).getMem_id() %><br/>
패스워드 : <%=((MemberVO)session.getAttribute("sesMemberInfo")).getMem_pass() %><br/>
성명 : <%=((MemberVO)session.getAttribute("sesMemberInfo")).getMem_name() %><br/>
<h3>application 영역 값 취득 </h3>
아이디 : <%=((MemberVO)application.getAttribute("appMemberInfo")).getMem_id() %><br/>
패스워드 : <%=((MemberVO)application.getAttribute("appMemberInfo")).getMem_pass() %><br/>
성명 : <%=((MemberVO)application.getAttribute("appMemberInfo")).getMem_name() %><br/>
</body>
</html>