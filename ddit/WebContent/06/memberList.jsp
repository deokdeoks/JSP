<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.memberList();
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type ='text/javascript' src = 'http://code.jquery.com/jquery-latest.js'></script>
		<script type = 'text/javascript'>
		$(function(){
		      $('table tr:gt(0)').click(function(){
		         var mem_id = $(this).find('td:eq(0)').text();
		         location.replace('/ddit/06/memberView.jsp?mem_id='+ mem_id);
		      });
		   });   
</script>
		
</head>
<body>
<table>                                                         
	<thead>                                                         
		<tr>                                                         
			<th>아이디</th>                                                         
			<th>성명</th>                                                         
			<th>주민등록번호1</th>                                                         
			<th>직업</th>                                                        
			<th>취미</th>                                                         
		</tr>                                                         
	</thead>                                                         
	<tbody>  

		<% 
			for(MemberVO memberInfo: memberList){
			
		%>
				
		<tr>      
			<td><%=memberInfo.getMem_id()%></td>                  
			<td><%=memberInfo.getMem_name()%></td>                
			<td><%=memberInfo.getMem_regno1()%></td>              
			<td><%=memberInfo.getMem_job()%></td>                 
			<td><%=memberInfo.getMem_like()%></td>            
		</tr>
<%

}

%>

	</tbody>
	
</table>                                                         
</body>                                                         
</html>                                                         
</body>

</html>