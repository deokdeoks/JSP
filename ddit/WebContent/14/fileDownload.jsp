<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.global.GlobalConstant"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String fileName = request.getParameter("fileName");
    	
    	File downloadFile = new File(GlobalConstant.FILE_PATH, fileName);
    	
    	if(downloadFile.exists()){
    		fileName = URLEncoder.encode(fileName, "UTF-8");
    		
    		response.setHeader("Content-Disposition", "attachment; fileName=" + fileName);
    		response.setContentType("application/octet-stream");
    		response.setContentLength((int)downloadFile.length());
    		
    		// jsp 요청시 해당 jsp는 servlet 클래스로 천이(자스퍼 엔진).
    		// jsp는 out이 존재하고, servlet 클래스 내 PrintWriter 상속받은 JspWriter가 존재하며,
    		// out 기본객체의 OutputStream 초기화(JSP 파일 내 다운로드 처리시만 선언)
    		
    		out.clear();
    		out = pageContext.pushBody();
    		
    		byte[] buffer = new byte[(int)downloadFile.length()];
    		
    		BufferedInputStream inputStream = new BufferedInputStream( new FileInputStream (downloadFile));
    		
    		BufferedOutputStream outputStream = new BufferedOutputStream(
    																response.getOutputStream());
    		
    		int readCnt = 0;
    		while((readCnt = inputStream.read(buffer)) != -1 ){
    			outputStream.write(buffer);
    		}
    		inputStream.close();
    		outputStream.close();
    		
    	}
    %>
