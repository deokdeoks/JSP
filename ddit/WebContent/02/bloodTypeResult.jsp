<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bloodType = request.getParameter("bloodType");

    String servletPath = "";
    
    if("A".intern() == bloodType.intern()){
    	servletPath = "a.jsp";
    }
    if("B".intern() == bloodType.intern()){
    	servletPath = "b.jsp";
    }
    if("O".intern() == bloodType.intern()){
    	servletPath = "o.jsp";
    }
    if("AB".intern() == bloodType.intern()){
    	servletPath = "ab.jsp";
    }
    // 리다이렉트 응답 제어 처리
//     response.sendRedirect("/ddit/02/type/" + servletPath);
	// 포워딩 처리
	//   * 컨텍스트 루트|패스가 배제된 서블릿 패스로 작성되어야 함.
	//     /ddit/02/type/a.jsp X
	//     /02/type/a.jsp      O
	RequestDispatcher dispatcher = 
	           request.getRequestDispatcher("/02/type/" + servletPath);
	// forward(HttpServletRequest : bloodTypeResult.jsp 리다이렉트 요청시 생성
    //         HttpServletResponse : bloodTypeResult.jsp 리다이렉트 요청시 생성)
	dispatcher.forward(request, response);
%>











