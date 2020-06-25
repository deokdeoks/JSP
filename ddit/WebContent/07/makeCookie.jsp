<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 쿠키 생성 : 클라이언트(브라우저 : 자바스크립트)
	// 		       서버(자바 : 응답 객체의 응답 헤더에 저장 후 클라이언트에 전송)
	// 쿠키 저장소 : 클라이언트(브라우저)
	// 			브라우저별 상이한 저장소 형태 - 해당 브라우저의 메모리 활용
	//								해당 브라우저가 인스톨된 폴더 내 특정 위치
	// 쿠키 사이즈 : 4kb 이내로 생성
	// 쿠키 성향 : 클라이언트(브라우저의 쿠키 저장소)에 저장된 쿠키는 해당 클라이언트
	//		      브라우저의 서버 대상 요청시 마다 요청 헤더에 포함되어 전송되려는 성향
	//	       * 전송 제한 : 쿠키 생성 시 패스, 도메인 속성 활용
	// 쿠키 생성 패턴 : 키=값; 유효시간=값; 패스=값; 도메인=값;
	// 쿠키 패스 속성 : default /(컨텍스트 루트 : 루트)
	// 쿠키 도메인 속성 : default 해당 쿠키 생성시 요청 도메인
	// 쿠키 유효시간(만료시간) : 해당 쿠키 생성시 선언된 쿠키의 삭제까지의 남은 시간
	//					default -1(해당 쿠키가 저장된 브라우저의 종료시까지 존속)
	Cookie memidCookie = new Cookie("mem_id", "a001");
	memidCookie.setPath("/");
	response.addCookie(memidCookie);

	Cookie mempwdCookie = new Cookie("mem_pass", "asdfasdf");
	// 쿠키의 유효시간(만료시간) 초단위 설정
	mempwdCookie.setMaxAge(60 * 60 * 24);
	// httpL//localhost/ddit/07/makeCookie.jsp - 브라우저 저장소에 저장된 쿠키 전송
	// httpL//localhost/ddit/06/makeCookie.jsp - 브라우저 저장소에 저장된 쿠키 미전송
	mempwdCookie.setPath("/ddit/07/");
	response.addCookie(mempwdCookie);
	
	// 쿠키 저장소에 설정된 인코딩 타입 : ISO-8859-1(라틴어)
	// UTF-8(김은대) => 쿠키 저장소에 전송 => ISO-8859-1(UTF-8(김은대)) => 쿠키 저장소로부터 취득 => UTF-8(김은대) => UTF-8로 디코딩 후 활용
	// "mem_name"=UTF-8(김은대); 유효시간=60*60; 도메인=www.bagrant.co.kr; path=/ddit/07/;
	Cookie memnmCookie = new Cookie("mem_name", URLEncoder.encode("김은대", "utf-8"));
	memnmCookie.setDomain("www.bagrant.co.kr");
	memnmCookie.setPath("/ddit/07/");
	memnmCookie.setMaxAge(60 * 60);
	response.addCookie(memnmCookie);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키가 잘 구워졌습니다....!!
</body>
</html>