<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.prod.service.IProdServiceImpl"%>
<%@page import="kr.or.ddit.prod.service.IProdService"%>
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
    	String prod_id = request.getParameter("prod_id");
    
    Map<String, String> params = new HashMap<String, String>();
    params.put("prod_id", prod_id);
    
    IProdService service = IProdServiceImpl.getInstance();
    ProdVO prodInfo = service.prodInfo(params);
    
    %>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
      <script type='text/javascript'>
     
      $('form').submit(function(){
    	  $('input[name=prod_id]').val
    	  $('input[name=prod_name]').val
    	  $('input[name=prod_lgu]').val
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
     $(function(){
   	   
    	  $('button[id=btn3]').click(function(){
              $(location).attr('href', '/ddit/10/prodList.jsp?prod_id=<%=prodInfo.getProd_id()%>');
           });
          <%--  $('button[id=btn3]').click(function(){
              $(location).attr('href', '/ddit/09/deletemember.jsp?mem_id=<%=prodInfo.getM_id()%>');
           }); --%>
           $('#btn4').on('click',function(){
          	 location.href='<%=request.getContextPath() %>/10/deleteprod.jsp?prod_id=<%=prodInfo.getProd_id() %>';
           })
           $('button[id=btn1]').click(function(){
              $(location).attr('href', '/ddit/10/updateprod.jsp?prod_id=<%=prodInfo.getProd_id()%>');
           });
           $('button[id=btn2]').click(function(){
              $(location).attr('href', '/ddit/10/logout.jsp?prod_id=<%=prodInfo.getProd_id()%>');
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
<form action='/ddit/10/updateprod.jsp?prod_id=<%=prodInfo.getProd_id() %>' method='post'> 
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">상품코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			 <input type="hidden" name="prod_id"/>
				<input class="mdl-textfield__input" value="<%=prodInfo.getProd_id()%>" type="text" id="prod_id" name="prod_id" disabled="disabled">
				<label class="mdl-textfield__label" for="prod_id">상품코드</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" value="<%=prodInfo.getProd_name()%>" type="text" id="prod_name" name="prod_name" disabled="disabled">
				<label class="mdl-textfield__label" for="prod_name">상품명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_lgu()%>" id="prod_lgu" name="prod_lgu" disabled="disabled">
				<label class="mdl-textfield__label" for="prod_lgu">상품분류명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_buyer()%>" id="prod_buyer" name="prod_buyer" disabled="disabled">
				<label class="mdl-textfield__label" for="prod_buyer">거래처코드</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">매입가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_cost()%>" id="prod_cost" name="prod_cost">
				<label class="mdl-textfield__label" for="prod_cost">매입가</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">소비자가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_price()%>" id="prod_price" name="prod_price">
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
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_sale()%>" id="prod_sale" name="prod_sale">
				<label class="mdl-textfield__label" for="prod_sale">판매가</label>
			</div>		
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_outline()%>" id="prod_outline" name="prod_outline">
				<label class="mdl-textfield__label" for="prod_outline">상품설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">상품상세설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_detail()%>" id="prod_detail" name="prod_detail">
				<label class="mdl-textfield__label" for="prod_detail">상품상세설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">총입고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_qtyin()%>" id="prod_qtyin" name="prod_qtyin">
				<label class="mdl-textfield__label" for="prod_qtyin">총입고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_totalstock()%>" id="prod_totalstock" name="prod_totalstock">
				<label class="mdl-textfield__label" for="prod_totalstock">재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">안전재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" value="<%=prodInfo.getProd_properstock()%>" id="prod_properstock" name="prod_properstock">
				<label class="mdl-textfield__label" for="prod_properstock">안전재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">입고일자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<%
				String str = prodInfo.getProd_insdate();
				String[] array = str.split(" ");
				
			%>
				<input class="mdl-textfield__input" type="text"  value="<%=array[0]%>" id="prod_insdate" name="prod_insdate">
				<label class="mdl-textfield__label" for="prod_insdate">입고일자</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">상품정보수정</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn4" type="button">상품정보삭제</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








