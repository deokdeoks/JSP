<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="updatebuyer" value="/12/updatebuyer.jsp"></c:set>
    <c:set var="buyerList" value="/12/buyerList.jsp"></c:set>
    <c:url var="main" value="/12/main.jsp"></c:url>
    <c:url var="updatebuyer" value="/12/updatebuyer.jsp"></c:url>
     <c:url var="deletebuyer" value="/12/deletebuyer.jsp"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String buyer_id = request.getParameter("buyer_id");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("buyer_id", buyer_id);
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	BuyerVO buyerInfo = service.buyerInfo(params);
	
	pageContext.setAttribute("buyerInfo", buyerInfo);

%>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-latest.js'></script>
	  <script type='text/javascript'>
	 $('form').submit(function(){
    	  $('#buyer_id').val();
    	  $('#buyer_name').val();
    	  $('#buyer_charger').val();
    	  $('#buyer_bank').val();
    	  $('#buyer_add1').val();
    	  $('#buyer_add2').val();
    	  $('#buyer_comtel').val();
    	  $('#buyer_fax').val();
    	  $('#buyer_mail').val();
    	
    	  
      });
 	 $(function(){
	   	   
   	  $('button[id=btn4]').click(function(){
             location.replace('${main}');
          });
           $('button[id=btn2]').click(function(){
             location.replace('${deletebuyer}?buyer_id=${buyerInfo.buyer_id}');
          }); 
       <%--    $('#btn4').on('click',function(){
         	 location.href='<%=request.getContextPath() %>/10/deleteprod.jsp?prod_id=<%=prodInfo.getProd_id() %>';
          })
          $('button[id=btn1]').click(function(){
             $(location).attr('href', '/ddit/10/updateprod.jsp?prod_id=<%=prodInfo.getProd_id()%>');
          });
          $('button[id=btn2]').click(function(){
             $(location).attr('href', '/ddit/10/logout.jsp?prod_id=<%=prodInfo.getProd_id()%>'); --%>
     
          
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
<form action='${updatebuyer}?buyer_id=${buyerInfo.buyer_id}' method='post'> 
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" value="${buyerInfo.buyer_id}" type="text" id="buyer_id" name="buyer_id" disabled="disabled">
				<label class="mdl-textfield__label" for="buyer_id">거래처코드</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" value="${buyerInfo.buyer_name}" type="text" id="buyer_name" name="buyer_name">
				<label class="mdl-textfield__label" for="buyer_name">거래처명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">담당자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input"  value="${buyerInfo.buyer_charger}" type="text" id="buyer_charger" name="buyer_charger">
				<label class="mdl-textfield__label" for="buyer_charger">담당자명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래은행</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input"  value="${buyerInfo.buyer_bank}" type="text" id="buyer_bank" name="buyer_bank">
				<label class="mdl-textfield__label" for="buyer_bank">거래은행</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소1</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input"  value="${buyerInfo.buyer_add1}" type="text" id="buyer_add1" name="buyer_add1">
				<label class="mdl-textfield__label" for="buyer_add1">거래처주소1</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소2</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input"  value="${buyerInfo.buyer_add2}" type="text" id="buyer_add2" name="buyer_add2">
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
				<input class="mdl-textfield__input"  value="${buyerInfo.buyer_comtel}" type="text" id="buyer_comtel" name="buyer_comtel">
				<label class="mdl-textfield__label" for="buyer_comtel">전화번호</label>
			</div>		
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">팩스번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input"  value="${buyerInfo.buyer_fax}" type="text" id="buyer_fax" name="buyer_fax">
				<label class="mdl-textfield__label" for="buyer_fax">팩스번호</label>
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="300px" height="25">거래처메일</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input"  value="${buyerInfo.buyer_mail}" type="text" id="buyer_mail" name="buyer_mail">
				<label class="mdl-textfield__label" for="buyer_mail">거래처메일</label>
			</div>
		</td>
	</tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">거래처정보수정</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">거래처정보삭제</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn4" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








