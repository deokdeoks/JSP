


<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="org.apache.catalina.tribes.MembershipService"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <c:set var="memberView" value="memberView.jsp"></c:set>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
   String mem_id = request.getParameter("mem_id");

   Map<String, String> params = new HashMap<String, String>();
   params.put("mem_id", mem_id);
   
   IMemberService service = IMemberServiceImpl.getInstance();
   MemberVO memberInfo = service.memberInfo(params);
%>
      <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
      <script type='text/javascript'>
      $(function(){
         $('input[value=회원목록]').click(function(){
            $(location).attr('href', '/ddit/06/memberList.jsp');
         });
         $('input[value=탈퇴]').click(function(){
            $(location).attr('href', '/ddit/06/deletemember.jsp?mem_id=<%=memberInfo.getMem_id()%>');
         });
         $('input[value=로그아웃]').click(function(){
            $(location).attr('href', '/ddit/06/logout.jsp?mem_id=<%=memberInfo.getMem_id()%>');
         });
         $('form').submit(function(){
               var mem_pass = $('input[name=mem_pass]').val();
                if(!mem_pass.validationPWD()){
                   alert('비밀번호를 바르게 입력해주세요');
                   return false;
                }
                var mem_hometel= $('input[name=mem_hometel]').val();
                if(!mem_hometel.validationHOMETEL()){
                   alert('집전화번호를 바르게 입력해주세요');
                   return false;
                }
                var mem_comtel= $('input[name=mem_comtel]').val();
                if(!mem_comtel.validationCOMTEL()){
                   alert('회사전화번호를 바르게 입력해주세요');
                   return false;
                }
                var mem_hp= $('input[name=mem_hp]').val();
                if(!mem_hp.validationHP()){
                   alert('휴대전화번호를 바르게 입력해주세요');
                   return false;
                }
                var mem_mail = $('input[name=mem_mail]').val();
                if(!mem_mail.validationMAIL()){
                   alert('이메일을 바르게 입력해주세요');
                   return false;
                }
                return true;
         });
      });
      </script>
</head>
<body>
<form action='/ddit/06/updatemember.jsp?mem_id=<%=memberInfo.getMem_id() %>' method='post'>
<%-- <input type='hidden' name='mem_id' value='<%=memberInfo.getMem_id() %>'/>     --%>                        
   <table>                                                               
      <tr>                                                              
         <td>아이디</td>                                                  
         <td>                                                          
            <input type='text' name='mem_id' value='<%=memberInfo.getMem_id() %>' disabled="disabled"/>                   
         </td>                                                         
      </tr>                                                             
      <tr>                                                              
         <td>패스워드</td>                                                 
         <td>                                                          
            <input type='text' name='mem_pass' value='<%=memberInfo.getMem_pass() %>'/>                      
         </td>                                                         
      </tr>                                                             
      <tr>                                                              
         <td>성명</td>                                                   
         <td><input type='text' name='mem_name' value='<%=memberInfo.getMem_name() %>' disabled="disabled"/></td>
      </tr>                                                             
      <tr>                                                              
         <td>주민등록번호</td>                                               
         <td>                                                          
            <input type='text' name='mem_regno1' value='<%=memberInfo.getMem_regno1() %>' disabled="disabled"/>        
            <input type='text' name='mem_regno2' value='<%=memberInfo.getMem_regno2() %>' disabled="disabled" />         
         </td>                                                         
      </tr>                                                             
      <tr>                                                              
         <td>생년월일</td>                                                 
         <td><input type='text' name='mem_bir' value='<%=memberInfo.getMem_bir() %>'/></td> 
      </tr>                                                             
      <tr>                                                              
         <td>우편번호</td>                                                 
         <td><input type='text' name='mem_zip' value='<%=memberInfo.getMem_zip() %>'/></td>
      </tr>                                                             
      <tr>                                                              
         <td>주소</td>                                                   
         <td>                                                          
            <input type='text' name='mem_add1' value='<%=memberInfo.getMem_add1() %>'/>                    
            <input type='text' name='mem_add2' value='<%=memberInfo.getMem_add2() %>'/>                     
         </td>                                                         
      </tr>                                                             
      <tr>                                                              
         <td>집전화번호</td>                                                
         <td><input type='text' name='mem_hometel' value='<%=memberInfo.getMem_hometel() %>'/></td>              
      </tr>                                                             
      <tr>                                                              
         <td>회사전화번호</td>                                               
         <td><input type='text' name='mem_comtel' value='<%=memberInfo.getMem_comtel() %>'/></td>               
      </tr>                                                             
      <tr>                                                              
         <td>휴대폰번호</td>                                                
         <td><input type='text' name='mem_hp' value='<%=memberInfo.getMem_hp() %>'></td>                    
      </tr>                                                             
      <tr>                                                              
         <td>이메일</td>                                                  
         <td><input type='text' name='mem_mail' value='<%=memberInfo.getMem_mail() %>'/></td>                
      </tr>                                                             
      <tr>                                                              
         <td>직업</td>                                                   
         <td><input type='text' name='mem_job' value='<%=memberInfo.getMem_job() %>'/></td>                 
      </tr>                                                             
      <tr>                                                              
         <td>취미</td>                                                   
         <td><input type='text' name='mem_like' value='<%=memberInfo.getMem_like() %>'/></td>                 
      </tr>                                                             
      <tr>                                                              
         <td colspan='2'>                                              
            <input type='submit' value='수정' />                      
            <input type='button' value='탈퇴' />                      
            <input type='reset' value='취소' />
            <input type='button' value='회원목록' />
            <input type='button' value='로그아웃' />
         </td>                                                         
      </tr>                                                             
   </table>                                                              
</form>                                                                  
</body>                                                                  
</html>                                                                  