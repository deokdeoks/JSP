<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%-- <%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%-- <%@ page language="java" contentType="application/vnd.word; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="application/hwp; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	IMemberService service = IMemberServiceImpl.getInstance();
    	List<MemberVO> memberList = service.memberList(new HashMap<String, String>());
    	
    	// Content-Disposition : attachment - 클라이언트(브라우저)의 다운로드 창 설정 및 황성화를 통한 다운로드 처리 
    	
    								//inline - 클라이언트(브라우저)에 기 파악하고 있는 확장자(image[png,gif,jpg,jpeg,text,xml,pdf,....]) 파일을 브라우저에 직접 랜더링 출력(특정위치 임시저장 처리) 
/*     	response.setHeader("content-Disposition", "attachment;fileName=members.xls");
    	response.setHeader("Content-Discription", "Generate Exel File");
    	response.setContentType("application/vnd.ms-excel"); */
    /* 	response.setHeader("content-Disposition", "attachment;fileName=members.doc");
    	response.setHeader("Content-Description", "Generate MSWord File");
    	response.setContentType("application/vnd.ms-word"); */
    	response.setHeader("content-Disposition", "attachment;fileName=members.hwp");
    	response.setHeader("Content-Description", "Generate HWP File");
    	response.setContentType("application/hwp");
    %>
    <c:set var="memberList" value="<%= memberList %>"></c:set>

<table>
	<thead>
		<tr>
			<th>아아디</th>
			<th>패스워드</th>
			<th>성명</th>
			<th>주민번호1</th>
			<th>주민번호2</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${memberList }" var = "memberInfo">
		<tr>
			<td>${memberInfo.mem_id }</td>
			<td>${memberInfo.mem_pass } </td>
			<td>${memberInfo.mem_name }</td>
			<td>${memberInfo.mem_regno1 }</td>
			<td>${memberInfo.mem_regno2 }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>	