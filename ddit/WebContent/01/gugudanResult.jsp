<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 	// /ddit/01/gugudanResult.jsp?dan=5
-->
<% 
	String dan = request.getParameter("dan");  
%>
<%!
	// 디클러레이션 : JSP 내 자바 코드 프로그래밍 영역 
	//				자바 메서드 선언 영역 
	private int multiple(int dan, int j){
		return dan * j;
	
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<!--  익스프레션 : 스크립트릿 또는 디클러레이션 내 메서드의 변수, 메서드의 반환값을 활용해 동적인 응답 컨텐츠를 작성하기 위해 선언된 영역  -->
			<%=dan	 %>단 입니다.
<% 			
			for(int j=1; j<10; j++){
				
%>
			<%=dan %> * <%=j  %> = <%=multiple (Integer.parseInt(dan), j)  %> <br/>
<% 				
			}
			
		
%>

</body>
</html>