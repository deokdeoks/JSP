<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* request.setCharacterEncoding("UTF-8"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엄마!!미안해!!</title>


</head>
<body>
	<c:import url="/13/layout/header.jsp"></c:import>
	<div id="wrapper">\
		<c:import url="/13/layout/left.jsp"></c:import>
		<div id="page-wrapper">
			<div class="page-content">
				<c:import
					url="${!empty param.contentPage ? param.contentPage : '/13/freeboard/freeboardList.jsp'}">
				</c:import>
			</div>
			<c:import url="/13/layout/footer.jsp"></c:import>
		</div>
	</div>
	<script type="text/javascript">
		if (eval('${!empty param.message}')) {
			BootstrapDialog.show({
				title : '알림',
				message : '${param.message}'
			});
		}
	</script>
</body>
</html>