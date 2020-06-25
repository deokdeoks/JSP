<%@page import="java.net.URL"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 로그(trace -> info -> warn -> debug -> error -> fatal)
   application.log("info 레벨의 이클립스 내 콘솔 방향 출력");
   application.log("실제 서버 배포 및 서비스 : info 레벨의 서버 인스톨 폴더/log/파일 방향 출력");
   
   out.println("oracleDriver : " +application.getInitParameter("oracleDriver")+"<br/>"); 
   out.println("oracleURL : " +application.getInitParameter("oracleURL")+"<br/>");
   out.println("mysqlDriver : " +application.getInitParameter("mysqlDriver")+"<br/>");
   out.println("mysqlURL : " +application.getInitParameter("mysqlURL")+"<br/>");
   
   out.println("웹 애플리케이션 배포 및 서비스 경로 : " + application.getRealPath(""));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   OracleDriver : <%= application.getInitParameter("oracleDriver") %><br/>
   OracleURL : <%= application.getInitParameter("oracleURL") %><br/>
<%
   String buffer ="";
   BufferedReader reader = new BufferedReader(
                        new InputStreamReader(
                              new FileInputStream(
                                    application.getRealPath("/05/readme.txt")), "UTF-8"));
   while((buffer = reader.readLine()) !=null){
%>
   <%= buffer %>
<%
   }
   
   String temp="";
   URL url = application.getResource("/05/readme.txt");
   BufferedReader urlReader = new BufferedReader(
          						 new InputStreamReader(
        		 							  url.openStream(), "UTF-8"));	
   
   while((temp = urlReader.readLine()) != null){
	   out.println(temp);
   }
%>   
            


   
</body>
</html>