<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/03/viewQueryString.jsp" method="POST">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text"  name="mem_id"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="text" name="mem_pass"/></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text" name="mem_name"/></td>
		</tr>
		<tr>
			<td>고찰</td>
			<td><input type="checkbox"  name="qeuery_group" value="학사"/>
			이제 자기 전공분야에 대해서는 모르는게 없다고 생각한다.<br/>
			<input type= "checkbox" name = "query_group" value="석사"/>
			자기 전공분야에 재해서 정말 아무것도 몰랐음을 깨닫게 된다.<br/>
			<input type= "checkbox" name = "query_group" value="박사"/>
			자기 전공분야의 다른 박사 전공하는 사람들도 모르기는 매한가지임을 알게 된다.<br/>
			<input type= "checkbox" name = "query_group" value="교수"/>
			아는것만 가르친다.<br/>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="전송"/></td>
		</tr>
	</table>
</form>
</body>
</html>