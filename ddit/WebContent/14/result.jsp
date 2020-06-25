<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 클라이언트(블우저) 보안정책(Security Policy) : 
    	// 		브라우저는 해당 하드웨어시스템 내 파일에 접근은 가능하지만,
    	// 		신규 파일 또는 디렉토리의 생성, 파일 및 디렉토리 수정과 삭제는 불가.
    	//		* IE ActiveX를 활용해서 파일 생성, 수정, 삭제가 가능.
    	// 서버의 파일 업로드 처리 개발환경
    	// 1. 라이브러리
    	// 		http://commons.apache.org 
    	//	 commons-fileupload-1.2.2.jar
    	//	 commons-io-2.3.jar
    	// WEB-INF/lib 	import
    	
    	// 서버대상 업로드된 파일의 저장 처리 : 서버 내 특정 파일 시스템 할용
    	// 						     파일 정보들을 DB 새상 저장
    	//
    
    	String filesSavePath =  application.getRealPath("/upload");
    	
    	int fileSizeMax = 1024 * 1024 * 100;
    	
    	// 클라이언트(브라우저) 서버 대상 요청 
    	// 	  일반 요청 
    	//		직접 브라우저의 주소창에 URL 입력.
    	// 		location.href = '주소'
    	//		location.replace('주소')
    	//		<a href='주소'></a>
    	//		form 태그 (enctype= applcation/x-www-form-urlencoded)
    	//		ajax 
    	//	  스트리밍 요청(파일)
    	//		form 태그(method-post, enctype=multipart/form-data)
    	//		ajax(method=post, enctype=multipart/form-data)
    	boolean multipartFlag =  ServletFileUpload.isMultipartContent(request);
    	if(multipartFlag){
    		// 서버의 업로드 된 파일 저장 처리 
    		// 		1. 업로드된 파일의 임시저장소 저장(서버 내 서버가 관리하는 파일 시스템, 서버의 메모리)
    		//			* 임시저장소에 저장되는 파일의 롹장자 : *.tmp
    		// 			* 임시저장소 저장 대상 파일의 사이즈 제한 
    		//			* 임시저장소로 활용되는 서버 내 특정 파일 패스를 지정
    		//		2. 업로드된 파일의 실제저장소 저장
    		//			* 실제저장소 저장 대상 파일의 사이즈 제한
    		//			* 실제저장소로 활용될 서버 내 특정 파일 패스 지정 가능
    		// 		3. 임시저장소에 저장된 파일의 실제저장소 저장시 임시저장소에 저장되었던 임시 파일 자동 삭제
    		DiskFileItemFactory factory = new DiskFileItemFactory();
    		factory.setSizeThreshold(fileSizeMax);
    		//factory.setRepository(new File("임시저장소 활용될 서버 내 파일 패스 지정"));
    		
    		ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
    		// 서버 대상 업르드 된 파일 단위의 파일 사이즈 제한. 		
    		servletFileUpload.setFileSizeMax(fileSizeMax);
    		// 서버 대상 업르드 된 전체 파일 대상의 사이즈 제한.
    		servletFileUpload.setSizeMax(fileSizeMax);
    		
    		//fileUploadForm.jsp(form 태그 method = post, enctype = multipart/ form-data)
    		//	FileItem(서버 내 스트리밍을 통해 취득한 자원)
    		// 폼필드
    		// 			input[type=text name=mem_id]
    		// 			input[type=text name=mem_pass]
    		// 			input[type=text name=mem_name]
    		//		파일
    		//			input[type=file name=files]*2
    		List<FileItem> items = servletFileUpload.parseRequest(request);
    		
    		for(FileItem item : items){
    				if(item.isFormField()){
    					// 			input[type=text name=mem_id]
    		    		// 			input[type=text name=mem_pass]
    		    		// 			input[type=text name=mem_name]
						out.println("폼필드<br/>");    		    	
						out.println("폼필드 키 : " + item.getFieldName() +
								" | 값 : "  + item.getString("UTF-8") + "<br/>");    		    	
    					
    				}else{
    					out.println("파일<br/>");
    					out.println("파일 키 :" + item.getFieldName() + "<br/>");
    					out.println("파일 파일명 :" + item.getName() + "<br/>");
    					out.println("파일 컨텐츠타입 :" + item.getContentType() + "<br/>");
    					out.println("파일 사이즈 :" + item.getSize() + "<br/>");
						
    					// 브라우저별 파일명 전송 처리 
    					// d: \temp\a.png or a.png
    				String fileName = 	FilenameUtils.getName(item.getName());
    				
    				File saveFile = new File(filesSavePath, fileName);
    				item.write(saveFile);
    				}
    		} 
    		
    	}
    %>
