<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	/* request.setCharacterEncoding("UTF-8"); */
%>
	<%
	String contentPage = request.getParameter("contentPage");
	if(contentPage == null){
		contentPage = "/10/prodList.jsp";
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
			<jsp:include page="/10/layout/header.jsp" />
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				<jsp:include page="/10/layout/left.jsp" />
			</div>
			<div id="content" style="height: 700px; width: 100%; overflow: auto;">
			
				<jsp:include page="<%=contentPage %>" />
			</div>
		</div>
		<div>
			<jsp:include page="/10/layout/footer.jsp" />
		</div>
	</div>
</center>
</body>
</html>









