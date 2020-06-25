<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
<script type='text/javascript' src='/ddit/js/common/validation.js'></script>
<script type="text/javascript">
$(function(){
	$('input[type=image]').click(function(){

	
		
		$.ajax({
			url : '<%=request.getContextPath()%>/10/zipcodeSearchResult.jsp'
			,data : { dong : $('#dong').val() }
			,dataType : 'json'
			,error : function(result){
						alert('error code : ' + result.status + 
								' | message : ' + result.responseText);
					}
			,success : function(result){
						var htmls = '<table width="100%" height="200px" cellspacing="0" cellpadding="0" ' + 
									  'style="overflow:scroll;" id="zipcodeTBL">' + 
									  	'<thead>' +
									  		'<tr>' + 
									  			
									  			'<th>거래처 명</th>' +
								  			'</tr>' +
							  			'</thead>' +
							  			'<tbody>';
			  			for(var i=0; i<result.length; i++){
			  				htmls += '<tr>' +
			  						 	'<td>' +result[i].buyer_name +'</td>'+
			  						 	'<td>' +result[i].buyer_id + '</td>' +
			  						 
		  						 	 '</tr>';
		  						 	 
			  			}
			  			htmls += '</tbody></table>';
			  			
			  			$('#viewTable').empty().html(htmls);
			  			
			  			$('#zipcodeTBL tr:gt(0)').click(function(){
			                  var zipcode = $(this).find('td:eq(1)').text();
			                
			                  $(opener.document).find('#prod_buyer').val(zipcode);
			                  
			                  self.close();
			               });
					}
		});
	})
})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25"><div align="center">찾고자 하는 지역의 동이름을
								입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<input type="text" id="dong">&nbsp;&nbsp;
							<input type="image" src="../image/bt_search.gif" border='0'
							align="middle">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>