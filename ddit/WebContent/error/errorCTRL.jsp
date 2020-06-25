<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	클라이언트는 서버로부터 발생된 에러 정보를 취득(상태 코드 : 500 시리즈, 상태값)
 -->
익셉션 클래스 : <%= exception.getClass().getName() %><br/>
익셉션 메세지 : <%= exception.getMessage() %>

</body>
</html>