package kr.or.ddit.hello.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// extends HttpServlet 선언으로 일반 클래스가
// 클라이언트의 요청을 처리하고, 컨텐츠를 응답으로 전송할 수 있는 서블릿 클래스로 변화됨.
public class HelloController extends HttpServlet {
	//HttpServletRequest(요청) : 클라이언트가 웹 서버 대상 요청시 서버로 전송되는 다수의 다양한 정보가 해당 자원에 저장되고, 활용
	//HttpServletResponse(응답) : 웹 서버 내 서블릿 클래스에서 동적으로 작성된 컨텐츠(html, javascript, css, jquery,...)
	//							저장하고, 클라이언트 대상 응답 전송 처리.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO 오늘 할일을 내일로 미루는 간땡이 큰 나(comment)
		
		// HttpServletResponse 내 저장소에 저장될 컨텐츠(클라이언트 대상 전송) 대상 적용될 인코딩 설정
		response.setCharacterEncoding("UTF-8");
		
		//클라이언트(브라우저) 대상 응답으로 전송되어 제공되는 컨텐츠 MINE TYPE 정보 
		response.setContentType("text/html; charset=UTF-8"); 
		
		//HttpServletResponse의 저장소에 컨텐츠를 저장하기 위해서 취득되어야 하는 자원
		PrintWriter out = response.getWriter();
		
		//서버 내 컨텐츠(html, javascript, jquery, css, ...) 문자열 처리
		out.println("<html>");
		out.println("<body>");
		out.println("Hello!!! Servlet");
		out.println("</body>");
		out.println("</html>");
		
		// 1. 클라이언트의 웹 서버 대상 요청
		// http://localhost/ServletToddler/hello
		// 2. 웹 서버 특정
		// 3. 웹 서버 내 웹 애플리케이션 특정(컨텍스트 루트|패스)
		// 4. 클라이언트의 요청시 서블릿 패스(/hello) 맵핑 검증
		//    해당 웹 애플리케이션 내 web.xml 내용을 기준으로 수행
		// 5. 서블릿 패스 맵핑이 성공하면 서블릿을 찾아서 서블릿 클래스를 인스턴스화 진행
		//	 	* 다수의 클라이언트의 동일 요청시 주소를 통해서 매번 해당 서블릿 클래스 인스턴스화 : x
		//		서블릿 클래스의 인스턴스는 싱글톤 패턴을 적용 : 0 (단일 인스턴스의 재활용)
		// 6. 인스턴스화된 서블릿 클래스 내 특정 메서드 호출(callback : 시스템에 의한 메서드 호출)
		// 7. 콜백 메서드 내에서 클라이언트 대상 응답 전송될 컨텐츠를 작성하고, HttpServletResponse에 저장
		// 8. HttpServletResponse의 저장소에 저장된 응답 전송될 컨텐츠를 클라이언트 대상 응답 전송 처리
		
		// -- 클라이언트 입장이 된다. --
		// 9. 클라이언트(브라우저)는 응답 컨텐츠 취득 후 html, javascript, jquery, css를 렌더링
		//    구문 해석으로 UI 출력 및 코드 실행
	}

}
