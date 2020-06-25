<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$('form').submit(function(){
		var flag = true;
	$('input[type=file]').each(function(idx, inputTag){
		if(!/\.(jpg|jpeg|png|gif)$/.test($(inputTag).val().toLowerCase())){
			alert('이미지 파일 대상 업로드 됩니다.');
			flag = false;
	}
		});
	return flag;
	});
});

</script>
</head>
<body>
<!--  
	클라이언트의 파일 업로드 처리 : 쿼리스트링 전송방식 : POST	
										content type = multipart/form-data	
										<form/>
										ajax
										* 바이너리 스트리밍을 통한 서버 전송  처리
											(폼필드  _mem_id, mem_pass, ...,
											  파일)
										
 -->
<form action ="${pageContext.request.contextPath }/14/result2.jsp"
		method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="mem_id" /></td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td><input type="text" name="mem_pass" /></td>
	</tr>
	<tr>
		<td>성명</td>
		<td><input type="text"  name="mem_name"/></td>
	</tr>
	<tr>
		<td>파일1</td>
		<td><input type="file" name="files"/></td>
	</tr>
	<tr>
		<td>파일2</td>
		<td><input type="file" name="files"/></td>
	</tr>
	<tr>
	
		<td colspan="2"><input type="submit" value="전송"/></td>
	</tr>
</table> 




</form>
</body>
</html>