<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	   
    	  $('button[id=btn4]').click(function(){
              $(location).attr('href', '/ddit/09/memberList.jsp?mem_id=<%=memberInfo.getMem_id()%>');
           });
          <%--  $('button[id=btn3]').click(function(){
              $(location).attr('href', '/ddit/09/deletemember.jsp?mem_id=<%=memberInfo.getMem_id()%>');
           }); --%>
           $('#btn3').on('click',function(){
          	 location.href='<%=request.getContextPath() %>/09/deletemember.jsp?mem_id=<%=memberInfo.getMem_id() %>';
           })
           $('button[id=btn1]').click(function(){
              $(location).attr('href', '/ddit/09/updatemember.jsp?mem_id=<%=memberInfo.getMem_id()%>');
           });
           $('button[id=btn2]').click(function(){
              $(location).attr('href', '/ddit/09/logout.jsp?mem_id=<%=memberInfo.getMem_id()%>');
           });
    	  
    	  
          $('form').submit(function(){
             $('input[name=mem_bir]').val($('input[name=mem_bir1]').val() + "-" + $('input[name=mem_bir2]').val()
                   + "-" + $('input[name=mem_bir3]').val());
             
             $('input[name=mem_hometel]').val($('select[name=mem_hometel1]').val() + "-" + $('input[name=mem_hometel2]').val()
                   + "-" + $('input[name=mem_hometel3]').val());
             
             $('input[name=mem_hp]').val($('select[name=mem_hp1]').val() + "-" + $('input[name=mem_hp2]').val()
                   + "-" + $('input[name=mem_hp3]').val());
             
             $('input[name=mem_mail]').val($('input[name=mem_mail1]').val() + "@" + $('select[name=mem_mail2]').val());
             
             $('input[name=mem_zip]').val($('input[name=mem_zip1]').val() + "-" + $('input[name=mem_zip2]').val());
       
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
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form action='/ddit/09/updatemember.jsp?mem_id=<%=memberInfo.getMem_id() %>' method='post'>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
			<img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" title="인적사항에 올릴 증명	을 검색합니다." 
				style="cursor: pointer;"/><br/>
			<div style="width: 100%" align="center">
				size : 235x315 이하
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value="<%=memberInfo.getMem_name() %>" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value="<%=memberInfo.getMem_regno1() %>" disabled="disabled"/>
  			<input type="text" name="mem_regno2" size="7" value="<%=memberInfo.getMem_regno2() %>" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
				<input type="hidden" name="mem_bir" />
				<%
					String str = memberInfo.getMem_bir();
					String[] array = str.split("-");
					String[] array1 = array[2].split(" ");
					
					
				
				%>
				<input type="text" name="mem_bir1" size="4" value="<%=array[0]%>" disabled="disabled"/>년
				<input type="text" name="mem_bir2" size="2" value="<%=array[1]%>" disabled="disabled"/>월
				<input type="text" name="mem_bir3" size="2" value="<%=array1[0]%>" disabled="disabled"/>일
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" name="mem_id" value="<%=memberInfo.getMem_id() %>" disabled="disabled">
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" value="<%=memberInfo.getMem_pass() %>" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" value="<%=memberInfo.getMem_pass() %>" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_hometel"/>
		<%
		String str1 = memberInfo.getMem_hometel();
		String[] array2 = str1.split("-");
	
		
		%>
			<select name="mem_hometel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" value="<%=array2[1]%>" /> - 
			<input type="text" name="mem_hometel3" size="4" value="<%=array2[2]%>" />
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<%
				String str3 = memberInfo.getMem_hp();
				String[] array3 = str3.split("-");
			%>
			<select name="mem_hp1">
				<option value="010">010</option>
				<option value="016">016</option>				        	
				<option value="017">017</option>				        	
				<option value="019">019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" value="<%=array3[1]%>" /> - 
			<input type="text" name="mem_hp3" size="4" value="<%=array3[2]%>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<%
				String str4 = memberInfo.getMem_mail();
				String[] array4 = str4.split("@");
			
			%>
			<input type="text" name="mem_mail1" value="<%=array4[0]%>" /> @
			<select name="mem_mail2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zip" />
			<%
				String str5 = memberInfo.getMem_zip();
				String[] array5 = str5.split("-");
			%>
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="<%=array5[0]%>" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="<%=array5[1]%>" />
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">우편번호검색</button><br>
			<input type="text" name="mem_add1" id="mem_add1" value="<%=memberInfo.getMem_add1() %>" />
			<input type="text" name="mem_add2" id="mem_add2" value="<%=memberInfo.getMem_add2() %>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value="<%=memberInfo.getMem_job() %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value="<%=memberInfo.getMem_like() %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">수정하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">삭제</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn4" type="button">목록</button>
		</td>
	</tr>
</table>
</form>


</body>
</html>








