<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/common/validation.js'></script>
<script type='text/javascript'>

   $(function(){
	   
	   res = "";
		$.ajax({
		    url : '<%= request.getContextPath()%>/10/lprodList.jsp'
		    ,dataType : 'json'
		    	,error : function(result){
	                  alert('error code : ' + result.status +
	                       '   | message : ' + result.responseText);
	            
	         }
		  ,success : function(result){
			  for(var i = 0 ; i <result.length; i++){
				  res += '<option value="'+result[i].lprod_gu+'">'+result[i].lprod_nm+'</option>';
				 }
			  $('#prod_lgu').empty().append(res);
		  }
		    
		    
		});
		
   
   
   });
   


   $(function() {
      $('button[id=btn1]').click(function() {
               $(location).attr('href', '<%=request.getContextPath()%>/10/insertprod.jsp');
            });
      
      $('button[id=btn3]').click(function() {
         $(location).attr('href', '<%=request.getContextPath()%>/10/loginForm.jsp');
      });
      $('form').submit(function(){
    	  $('input[name=prod_id]').val
    	  $('input[name=prod_name]').val
    	  $('select[name=prod_lgu]').val
    	  $('input[name=prod_buyer]').val
    	  $('input[name=prod_cost]').val
    	  $('input[name=prod_price]').val
    	  $('input[name=prod_sale]').val
    	  $('input[name=prod_outline]').val
    	  $('input[name=prod_detail]').val
    	  $('input[name=prod_qtyin]').val
    	  $('input[name=prod_totalstock]').val
    	  $('input[name=prod_properstock]').val
    	  $('input[name=prod_insdate"]').val
    	  
    	  
      });
   });
   
   function idCheck(){
	      if (!$('input[name=prod_id]').val().validationPROD()){
	         alert('상품코드를 바르게 입력해주세요.');
	         return false;   
	      }
	       $.ajax({
	         url : '<%= request.getContextPath()%>/10/idCheck.jsp'
	         ,data : {prod_id : $('input[name=prod_id]').val()}
	         ,dataType : 'json'
	         ,error : function(result){
	                  alert('error code : ' + result.status +
	                       '   | message : ' + result.responseText);
	            
	         }
	         ,success : function(result){
	                  // {"flag" : "true | false"}
	                  // '1' + 1 -> 11
	                  // eval('1' + 1) -> 2
	                  if(eval(result.flag)){
	                     alert('사용할 수 있는 상품코드 입니다.');
	                     $('input[name=prod_name]').focus();
	                  } else {
	                     alert('사용할 수 없는 상품코드 입니다.');
	                     $('input[name=prod_id]').val('');
	                  }
	         }
	       });
	    }
   
   function zipcodePopup(){
	      // document 팝업 - 모달 : 출력되는 팝업에 존재하는 포커스를 잃지 않으면(팝업 종료), 포커스가 이동이 불가
	      //              모달리스 : 출력되는 팝업에 존재하는 포커스가 존재해도 자유롭게 포커스가 이동이 가능
	      // 아귀먼트 : 1. url
	      //        2. 팝업의 타이틀
	      //        3. 옵션(브라우저별 상이)
	      var url = '<%=request.getContextPath()%>/10/zipcodeSearchForm.jsp';
	      var opts = 'width=380px, height=430px, status=no, resizable=no, scrollbars=no';
	      window.open(url, '거래처 검색', opts);
	      
	   }
     </script>
<body>
<form action="<%=request.getContextPath()%>/10/insertprod.jsp" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">상품코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_id" name="prod_id">
				<label class="mdl-textfield__label" for="prod_id">상품코드</label>
			</div>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" 
			id="prod_id" value=""><b>
			<a href="javascript:idCheck();">상품코드중복검사    </a></b> 
			
			</button>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_name" name="prod_name">
				<label class="mdl-textfield__label" for="prod_name">상품명</label>
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
				<select class="browser-default" name="prod_lgu" id="prod_lgu">
					<option value=""  selected>상품분류코드</option>
				
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_buyer" name="prod_buyer">
				<label class="mdl-textfield__label" for="prod_buyer">거래처코드</label>
			</div>
			<!-- 
				거래처 등록시 모달리스 팝업을 활용하여 기존의 거래처명으로 거래처 코드 검색을 ajax로 구현.
			 -->
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"  onclick="zipcodePopup()"   id="search_buyer_id" type="button">거래처검색</button>	
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">매입가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_cost" name="prod_cost">
				<label class="mdl-textfield__label" for="prod_cost">매입가</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">소비자가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_price" name="prod_price">
				<label class="mdl-textfield__label" for="prod_price">소비자가</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">판매가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_sale" name="prod_sale">
				<label class="mdl-textfield__label" for="prod_sale">판매가</label>
			</div>		
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_outline" name="prod_outline">
				<label class="mdl-textfield__label" for="prod_outline">상품설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">상품상세설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_detail" name="prod_detail">
				<label class="mdl-textfield__label" for="prod_detail">상품상세설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">총입고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_qtyin" name="prod_qtyin">
				<label class="mdl-textfield__label" for="prod_qtyin">총입고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_totalstock" name="prod_totalstock">
				<label class="mdl-textfield__label" for="prod_totalstock">재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">안전재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_properstock" name="prod_properstock">
				<label class="mdl-textfield__label" for="prod_properstock">안전재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">입고일자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_insdate" name="prod_insdate">
				<label class="mdl-textfield__label" for="prod_insdate">입고일자</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">상품등록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








