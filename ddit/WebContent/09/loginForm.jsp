<%@page import="kr.or.ddit.utiles.CryptoGenerator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   Map<String, String> publicKeyMap = CryptoGenerator.generatePairKey(session);
   //pageContext.setAttribute("publicKeyMap", publicKeyMap);
%>
<c:set var="publicKeyMap" value="<%=publicKeyMap %>"></c:set>
<c:url var="registMemberURI" value="/09/memberForm.jsp"></c:url>
<c:url var="loginCheck" value="/09/loginCheck.jsp"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<title>회원관리 관리자 로그인</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/common/validation.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/common/cookieControl.js'></script>
<!-- 
   자바스크립트 : RSA 암호화 알고리즘 처리
            1. js 라이브러리
               http:///www-cs-students.stanford.edu/~tjw/jsbn
               jsbn.js, prng4.js, rng.js, rsa.js 다운로드
            2. WebContext 하위에 배치
            3. 취득한 js 파일 import 우선순위
               3.1 jsbn.js
               3.2 rsa.js
               3.3 prng4.js
               3.4 rng.js
               
          해시 알고르짐(단방향성 FingerPrint[지문] 활용)
          -해싱(암호화)된 암호문은 서버단에서 평문으로 복호화 하지 않고 그 자체를 활용.
          -적용된 해당 해시 알고리즘이 해커에 뚫리면 해시 알고리즘이 적용된 모든 암호문이 평문화 가능성이 높음.
          	* 단어사전입력공격(무차별, 무작위 글자조합 적용), LookUpTable(준비된 해쉬값을 활용 - 뽐뿌 해킹에 활용)
          - 해시 알고리즘 + Salt(소금치기) : 동일한 비밀번호를 사용하는 유저들의 해쉬값이 동일할 수 있는 보안 취약 상황에서 
          								반복적인 해싱처리와 무작위 해싱구성(랜덤한 Salt 활용)으로 암호화하고, Salt값을 재차 암호화(기타 암호화 알고리즘 활용)
          								하여 활용 
          
          - SHA1|2|16|32|256|512
          - SH256(256bit - 32byte) or SHA512(512bit-64byte) : hex 표현
          
          - SH256 활용 환경
            1. js 라이브러리
            	1.1 http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js 
            	1.2 http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js
            2. CDN 선언
            3. CDN 선언 우선순위 
            	3.1 core.js
            	3.2 sha256.js 
          
 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/jsbn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/rsa.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/prng4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/crypto/rng.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js "></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js "></script>
<script type='text/javascript'>
            $(function() {
                if (eval('${!empty param.message}')){                                                                          
                alert('${param.message}');                                                                              
                }  
                
                if(Get_Cookie("mem_id")){
                  $('input[name = saveID]').attr('checked', true);
                   $('input[name = mem_id]').val(Get_Cookie("mem_id"));

                } 
                  $('.loginBtn').click(function() {
                  var mem_id = $('input[name = mem_id]').val();
                  if (!mem_id.validationID()) {
                     alert('아이디를 바르게 입력해주세요.');
                     return false;
                  }
                  var mem_pass = $('input[name = mem_pass]').val();
                  if (!mem_pass.validationPWD()) {
                     alert('비밀번호를 바르게 입력해주세요.');
                     return false;
                  }
                  
                  if($('input[name = saveID]').is(':checked')){
                     Set_Cookie("mem_id", $('input[name = mem_id]').val(), '1', '/');
                  } else {
                     Delete_Cookie('mem_id', '/');
                  }
                  
                 
                  
                var hasingID =  CryptoJS.SHA256(mem_id).toString(); 
                
                var hasingPWD =  CryptoJS.SHA256(mem_pass).toString(CryptoJS.enc.Hex); 
                  
               var modulus = '${publicKeyMap["publicModulus"]}';
               var exponent= '${publicKeyMap["publicExponent"]}';
               
               var rsaObject = new RSAKey();
               rsaObject.setPublic(modulus, exponent);
               
               var encryptID = rsaObject.encrypt(mem_id);
               var encryptPWD = rsaObject.encrypt(mem_pass);
               
               var $frm = $('<form action="${loginCheck }" method = \"post\" ></form>');
               var $inputID = $('<input type = "hidden" value ="' + encryptID + '" name = "mem_id" />');    
               var $inputPWD = $('<input type = "hidden" value ="' + encryptPWD + '" name = "mem_pass" />');
               
               $frm.append($inputID);                                                                        
               $frm.append($inputPWD);                                                                          
               
               $(document.body).append($frm);
               
               $frm.submit();
         });
      });
</script>
</head>
<body>
   <table width="770" border="0" align="center" cellpadding="0"
      cellspacing="0" style="margin: 90px;">
      <tr>
         <td height="150" align="center"><img src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
      </tr>
      <tr>
         <td height="174"
            style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr>
                  <td width="260" height="110" align="center"
                     style="border-right: 1px dotted #736357;">
                     <img src="${pageContext.request.contextPath }/image/logo.jpg" />
                  </td>
                  <td>
                     <table border="0" align="center" cellpadding="5"
                        cellspacing="0">
                        <tr>
                           <td><b>아이디</b></td>
                           <td><input type="text" name="mem_id" class="box" tabindex="3" height="18" /></td>
                           <td rowspan="2">
                              <img src="${pageContext.request.contextPath }/image/login.gif" class="loginBtn"/>
                           </td>
                        </tr>
                        <tr>
                           <td><b>패스워드</b></td>
                           <td><input type="password" name="mem_pass" class="box" tabindex="3" height="18" /></td>
                        </tr>
                        <tr>
                           <td colspan="2">
                              <input type="checkbox" name="saveID" checked='checked' > 아이디 저장
                              <br><br>
                              <a href='${registMemberURI }'>회원가입을 원하세용?</a>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
   </table>
</body>
</html>