<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url var="insertbuyer" value="/12/insertbuyer.jsp"></c:url>
    <c:url var="lprodList" value="/12/lprodList.jsp"></c:url>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-latest.js'></script>
	  <script type='text/javascript'>
	  $(function(){
		   
		   res = "";
			$.ajax({
			    url : '${lprodList}'
			    ,dataType : 'json'
			    	,error : function(result){
		                  alert('error code : ' + result.status +
		                       '   | message : ' + result.responseText);
		            
		         }
			  ,success : function(result){
				  for(var i = 0 ; i <result.length; i++){
					  res += '<option value="'+result[i].lprod_gu+'">'+result[i].lprod_nm+'</option>';
					 }
				  $('#buyer_lgu').empty().append(res);
			  }
			    
			    
			});
			
	   
	   
	   });
	   
	  
	  
	/*   $(function() {
	      $('button[id=btn1]').click(function() {
	               location.replace('${insertbuyer}');
	            });
	       */
	<%--       $('button[id=btn3]').click(function() {
	         $(location).attr('href', '<%=request.getContextPath()%>/10/loginForm.jsp');
	      }); --%>
	  
	  
/* 	  $('form').submit(function(){
    	  $('#buyer_id').val();
    	  $('#buyer_name').val();
    	  $('#buyer_charger').val();
    	  $('#buyer_bank').val();
    	  $('#buyer_add1').val();
    	  $('#buyer_add2').val();
    	  $('#buyer_comtel').val();
    	  $('#buyer_fax').val();
    	  $('#buyer_mail').val();
    	
    	  
      }); */
/* 	  }); */
	  
</script>
	  
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
/* .tLine {background-color: #d2d2d2; height: 1px;} */
/* .btnGroup { text-align: right; } */
td {text-align: left; }
</style>
<body>
<form action="${pageContext.request.contextPath }/12/insertbuyer.jsp" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_id" name="buyer_id">
				<label class="mdl-textfield__label" for="buyer_id">거래처코드</label>
				<button style="margin-left: 400px; width: 200px;" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="search_buyer_id" type="button">거래처코드중복검사</button>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_name" name="buyer_name">
				<label class="mdl-textfield__label" for="buyer_name">거래처명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류코드</td>
		<td>
			<div class="mdl-selectfield">
				<!-- 해당 셀렉트에 출력될 option의 구성은 LProd 테이블의 lprod_gu와 lprod_nm으로 UI출력시 먼저 
				     구성되도록 함.
				 -->
				<select class="browser-default" name="buyer_lgu" id="buyer_lgu">
					<option value="" selected>상품분류코드</option>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">담당자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_charger" name="buyer_charger">
				<label class="mdl-textfield__label" for="buyer_charger">담당자명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래은행</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_bank" name="buyer_bank">
				<label class="mdl-textfield__label" for="buyer_bank">거래처명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소1</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add1" name="buyer_add1">
				<label class="mdl-textfield__label" for="buyer_add1">거래처주소1</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소2</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add2" name="buyer_add2">
				<label class="mdl-textfield__label" for="buyer_add2">거래처주소2</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_comtel" name="buyer_comtel">
				<label class="mdl-textfield__label" for="buyer_comtel">전화번호</label>
			</div>		
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">팩스번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_fax" name="buyer_fax">
				<label class="mdl-textfield__label" for="buyer_fax">팩스번호</label>
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="300px" height="25">거래처메일</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_mail" name="buyer_mail">
				<label class="mdl-textfield__label" for="buyer_mail">거래처메일</label>
			</div>
		</td>
	</tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">거래처등록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








