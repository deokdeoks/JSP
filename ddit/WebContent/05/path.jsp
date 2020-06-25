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
	절대경로(0) : 컨텍스트 루트|패스 를 기준으로 자원 접근 주소 선언
	상대경로(X) : 해당 경로를 선언하는 자원의 위치를 기준으로 자원 접근 주소 선언 
				현재 위치 : ./
				상위 위치 접근 : ../
 -->
<img src="<%=request.getContextPath() %> /image/ddit.jpg" alt="" width="200px" height="150px" />
<img src="../image/ddit.jpg" alt="" width="200px" height="150px" />
<img src="./img/ddit.jpg" alt="" width="200px" height="150px" />

</body>
</html>