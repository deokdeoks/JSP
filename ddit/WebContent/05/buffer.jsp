<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page buffer="1kb" autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//http:ServletResponse(응답객체) 	: 서버에서 클라이언트 (브라우저) 대상 응답 컨텐츠를 저장 후 전송하는 자원
	//								    출력버퍼 - 응답 컨텐츠를 저장하기 위한 응답 객체의 저장소
	//		출력버퍼 : default 8kb
	//		Flush(전송) : 출력버퍼에 저장된 응답컨텐츠의 클라이언트(브라우저) 대상 전송
	//					 1.jsp 요청시 천이되는 서블릿 클래스 내 _jspService() 내에서 출력 버퍼
	//							대상 저장 후 해당 메서드 종료시 Flush
	// 					 2. 출력버퍼의 사이즈 제한용량까지 응답컨텐츠가 저장되면 해당 응답 컨텐츠를 Flush(반복가능)
	//		AutoFlush : default ture(자동 Flush)
	//					AutoFlush = false(코드를 통해 직접 Flush 처리)
	//					* 해당 출력버퍼 사이즈 이상의 응답 컨텐츠가 저장되어지는 시점에 Flush 미처리시 에러 발생.
	//					* out.flush() - 수동 전송 처리 (출력버퍼 Clear)
	//					* out.clear() - Flush 되지 않으며 출력버퍼만 clear
	//									출력버퍼가 1번 이상 Flush 기록 존재시 에러 발생
	//					* out.clearBuffer() - Flush 되지 않으며 출력버퍼만 Clear		
	//										    출력버퍼 Flush 기록 존재시에도 에러 미발생
	for(int i = 0 ; i < 50; i++){
		out.println("출력버퍼의 총 사이즈 : " + out.getBufferSize() + "<br/>");
		out.println("출력버퍼의 저장가능 사이즈 : " + out.getRemaining() + "<br/>");
		
		if(i%10 == 0) {
			out.println("암달의 법칙 : 전체 시스템에서 개선을 위한 일부 시스템의 프로젝트 수행결과가 시스템 전체 성능에 미치는 영향정도 계산법");
			out.flush();
		}
		
	}
	
	
	
%>

</body>
</html>