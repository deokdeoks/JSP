<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.lang.reflect.Constructor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 애플리케이션 실행 시 다양한 클래스 로더가 다양한 시점에 해당 애플리케이션을 구성하는 
    	// 자원들을 메모리에 상주시킴. 
    	// 클래스 로더
    	// 					ExtClassLoader						AppClassLoader						SubAppClassLoader						ServletContainerClassLoader
    	//	Standalone			JDK인스톨폴더/jre/lib/rt.jar			build path 하위 **.*.class			import 활용되는 jar 내 **.*class						X
    	//  
    	//	Web					JDK인스톨폴더/jre/lib/rt.jar			build path 하위 **.*.class			import 활용되는 jar 내 **.*class				Servlet Class, jsp 호출 => Servlet Class 로딩.
    	// 사용자 정의 태그 : *.tld 
    	// tld 파일 위치 : WEB-INF/ 하위
    	Class targetClass =  Class.forName("kr.or.ddit.utiles.CustomTargetClass");
    	
    		/* Constructor[]	constructors = targetClass.getConstructors(); */
    		Constructor constructor = targetClass.getConstructor();
    		Object instanceClass = constructor.newInstance();
    		
    		// targetClass.getName() => kr.or.ddit.utiles.CustomTargetClass
    				// CustomTargetClass 취득 
    		String className = targetClass.getName().substring(targetClass.getName().lastIndexOf(".")+1);
    		
    		String declareStart = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?> \n" +
    	              "<taglib xmlns=\"http://java.sun.com/xml/ns/j2ee\" \n" + 
    	                  "\t\txmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n" +
    	                  "\t\txsi:schemaLocation=\"http://java.sun.com/xml/ns/j2ee \n" +
    	                  "\t\thttp://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd\" \n" +
    	                  "\t\tversion=\"2.0\"> \n" +
    	                  "\t<tlib-version>1.0</tlib-version>\n" +
    	                  "\t<short-name>" + className.toLowerCase() + "</short-name>\n" +
    	                  "\t<uri>http://www.bagrant.com/taglib/" + className.toLowerCase() + "-taglib</uri>\n";
    	                 
    	 String declareContent = "";
   		 String delcareEnd = "</taglib>";
   		 
   		 Method[] methods = targetClass.getMethods();
   		 
   		 String temp = "";
   		 
   		 String extendsObjectMethods = "clone equals finalize getClass hashCode" + 
   				 						"notify notifyAll to String wait";
   		 
   		 for(Method method : methods){
   			 if(!extendsObjectMethods.contains(method.getName())){
   				/* public static Integer plus(Integer i, Integer j ) {
   					return i + j; */
   			Class[] params =  method.getParameterTypes();
   			
   			// java.lang.Integer plus		
 			String methodSignature = method.getReturnType().getName() + 
 										" " + 
 										method.getName() + 
   										"(";
   										
   							int paramCnt = 1;
   							for(Class param : params){
   								
   								//java.lang.Integer plus(java.lang.Integer, java.lang.Integer
   								methodSignature += param.getName(); 
   								if(paramCnt++ < params.length){
   									methodSignature += ", ";
   								}
   							}
   						//java.lang.Integer plus(java.lang.Integer, java.lang.Integer
   							methodSignature += ")";
   						
   							declareContent += "\t<function>\n" + 
   													"\t\t<description>" + method.getName() + "의 활용</discription>\n" + 
   													"\t\t<name>" + method.getName() + "</name>\n" + 
   													"\t\t<function-class>" + targetClass.getName() + "</function-class>\n" +
   													"\t\t<function-signature>" + methodSignature + "</function-signature>\n" +
   													"\t\t<example>\n" + 
   														"\t\t\t<![CDATA[\n" + 
   														"\t\t\t\t${" + className.toLowerCase() + ":" + methodSignature.substring(methodSignature.indexOf(" ")+1) + 
   															"}\n" +
   												    "\t\t\t ]]>" + 
   												"\t\t</example>\n" +
   									"\t</function>\n";
   				}
   		 }
   			 
   			 BufferedWriter writer = null;
   			 
   			 try{
   				 writer = new BufferedWriter(new FileWriter(new File("C:\\temp1\\" + className.toLowerCase() + ".tld")));
   				 /* writer.writer(delcareStart + declareContent + declareEnd); */
   				 writer.write(declareStart + declareContent + delcareEnd);
   			 } catch (IOException e1){
   				 e1.printStackTrace();
   			 }finally{
   				 writer.close();
   			 }
   		 /* targetClass.getMethod("plus", Integer.class, Integer.class); */
    	 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
사용자 정의 태그가 작성 되었습니다~~
</body>
</html>