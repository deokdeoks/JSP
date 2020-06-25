<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.buyer.service.IBuyerServiceImpl"%>

<%@page import="kr.or.ddit.buyer.service.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <c:set var="buyerForm" value="/12/buyerFrom.jsp"></c:set>
 <c:set var="buyerView" value="/12/buyerView.jsp"></c:set>
 <c:set var="buyerForm" value="buyerForm.jsp"></c:set>
<%
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<HashMap<BuyerVO, LprodVO>> buyerAllList = service.buyerAllList();
	pageContext.setAttribute("buyerAllList", buyerAllList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type='text/javascript'
	src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript'>
	$(function() {
		$('table tr:gt(0)')
				.click(
						function() {
							var buyer_id = $(this).find('td:eq(0)').text();
							location.replace('/ddit/12/main.jsp?contentPage=${buyerView}&buyer_id='
											+ buyer_id);
						});
		
		$('button[type=button]').on('click',function(){
			location.replace('/ddit/12/main.jsp?contentPage=${buyerForm}')
			
		});
		
	});
</script>
</head>
<body>
	<div id="list">
		<table
			class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp"
			style="width: 100%;">
			<thead>
				<tr>
					<th class="mdl-data-table__cell--non-numeric">거래처코드</th>
					<th class="mdl-data-table__cell--non-numeric">거래처명</th>
					<th class="mdl-data-table__cell--non-numeric">상품분류명</th>
					<th class="mdl-data-table__cell--non-numeric">담당자명</th>
					<th class="mdl-data-table__cell--non-numeric">전화번호</th>
					<th class="mdl-data-table__cell--non-numeric">메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${buyerAllList}" var="buyerInfo">
					<tr>
						<td>${buyerInfo['BUYER_ID']}</td>
						<td>${buyerInfo['BUYER_NAME']}</td>
						<td>${buyerInfo['BUYER_LGU']}</td>
						<td>${buyerInfo['BUYER_CHARGER']}</td>
						<td>${buyerInfo['BUYER_COMTEL']}</td>
						<td>${buyerInfo['BUYER_MAIL']}</td>
					</tr>
				</c:forEach>
		</table>
	</div>
	<div class="searchForm" align="right" style="margin-top: 10px;">
		<form method="post"action="/ddit/12/main.jsp?contentpage=&{buyerForm}">
			<select name="search_keycode">
				<option value="ALL">전체</option>
				<option value="BUYERID">거래처코드</option>
				<option value="BUYERNAME">거래처명</option>
				<option value="BUYERCHARGER">담당자명</option>
			</select> <input type="text" id="search_keyword" name="search_keyword">
			<button
				class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
				type="submit">검색</button>
			<button
				class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
				type="button" >거래처등록</button>
		</form>
	</div>
</body>
</html>








