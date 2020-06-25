<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. selectBloodType.jsp
		혈액형 선택 후 [전송] 버튼 클릭
	2. bloodTypeResult.jsp
		bloodType 값 취득
		취득된 혈액형 A => /02/type/a.jsp 리다이렉트  
		취득된 혈액형 B => /02/type/b.jsp 리다이렉트  
		취득된 혈액형 O => /02/type/o.jsp 리다이렉트  
		취득된 혈액형 AB => /02/type/ab.jsp 리다이렉트
	3. a.jsp|b.jsp|o.jsp|ab.jsp
		각 혈액형별 성격 응답컨텐츠 작성 (네이버 혈액형별 검색 내용 추출 후 활용)  
 -->
 <form action="/ddit/02/bloodTypeResult.jsp">
 <select name="bloodType" id="">
 		<option value="A">A형</option>
 		<option value="B">B형</option>
 		<option value="O">O형</option>
 		<option value="AB">AB형</option>
 	</select><input type="submit" value="전송" /></form>
 

</body>
</html>