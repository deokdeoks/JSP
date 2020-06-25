<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
.mdl-layout__container {
	width: 240px;
}
</style>
</head>
<body>
<center>
	<div id="wrap">
		<div id="header">
		
		<!-- 
			UI 레이아웃을 구성하기 위해 활용되는 jsp 액션태그
				include 액션 태그 : UI 레이아웃 구성을 위해 활용
								page 속성에 선언된 해당 jsp로 포워드 처리 후 
								해당 jsp가 응답 객체의 출력 버퍼에 저장한 응답 컨텐츠를 
								include 액션 태그가 선언된 코드라인에
								추가.  
		 -->
			<jsp:include page="/09/layout/header.jsp" />
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				
				<c:import url="/09/layout/left.jsp"></c:import>
			</div>
			<div id="content" style="height: 600px; margin-left: 250px; overflow: scroll;">
				<c:import url= "${!empty param.contentPage ? param.contentPage : '/09/memberList.jsp' }" />
			</div>
		</div>
		<div>
			
			<c:import url="/09/layout/footer.jsp"></c:import>
		</div>
	</div>
</center>
</body>
</html>









