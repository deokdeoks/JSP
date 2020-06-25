package kr.or.ddit.join.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 웹 서버로부터 클라이언트 대상 응답 전송되는 컨텐츠(html) 렌더링 엔진
		// 1. IE : 트라이던트
		// 2. Chrome : 블링크
		// 3. Safari : 웹킷
		// 4. Firefox : 게코
		// 5. Opera : 프레스토

		// 웹 서버로부터 클라이언트 대상 응답 전송되는 컨텐츠(javascript, jquery) 구문 해석
		// 1. IE : Chakra
		// 2. Chrome : V8
		// 3. FireFox : SpiderMonkey
		// 4. Safari : javascript core
		// 5. Opera : karakan

		// 클라이언트가 웹 서버로부터 취득한 Html, css 렌더링하는 프로세스
		// 1. uninitialized : 웹 서버로부터 응답 전송되는 컨텐츠 취득만 완료된 상태
		// 2. loading : 응답 전송된 컨텐츠를 분석
		// 3. interactive : 분석과 해석이 완료되고 브라우저에 출력(유저의 조작이 불가능)
		// 4. complete : 유저의 조작이 가능한 상태의 UI 출력

		String message = request.getParameter("message");

		response.setCharacterEncoding("UTF-8");
		// 내가 주는 정보들은 text/html형식이고~ 만약에 utf-8로 설정이 안되어 있으면 utf-8로 바꿔~
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html PUBLIC "
				+ "'-//W3C//DTD HTML 4.01 Transitional//EN'"
				+ "'http://www.w3.org/TR/html4/loose.dtd'" + ">");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta http-equiv=" + "'Content-Type'" + "content="
				+ "'text/html; charset=utf-8'" + "/>");
		// out.println("<link rel=" + "'stylesheet'" + "href=" +
		// "'/ServletToddler/css/admin.css'"+ "type=" + "'text/css'"+">");
		out.println("<title>회원관리 관리자 로그인</title>");
		// CORS(Cross Origin Resource Sharing) : 클라이언트(브라우저)가 렌더링하는 컨텐츠(HTMl,
		// CSS)
		// 구문해석 컨텐츠(javascript, jquery)시에 적용될 활용 자원을 주소 요청을 통해 확보 후 활용
		// CDN - CORS 활용을 위한 주소 선언
		out.println("<script type ='text/javascript' src = 'http://code.jquery.com/jquery-latest.js'></script>");
		out.println("<script type ='text/javascript' src = '/ServletToddler/js/common/validation.js'></script>");
		out.println("<script type='text/javascript'>");
		out.println("	$(function(){");
		out.println("		if('" + message + "' !='null'){");
		out.println("			alert('" + message + "');");
		out.println("		}");
		out.println("		$('.loginBtn').on('click',function(){");
		out.println("			var mem_id = $('input[name=mem_id]').val();");
		out.println("			if(!mem_id.validationID()){");
		out.println("				alert('아이디를 바르게 입력해주세요.');");
		out.println("				return false;");
		out.println("			}");
		out.println("			var mem_pass = $('input[name=mem_pass]').val();");
		out.println("			if(!mem_pass.validationPWD()){");
		out.println("				alert('비밀번호를 바르게 입력해주세요.');");
		out.println("				return false;");
		out.println("			}");
		// 도메인, 아이피주소를 브라우저가 파악하고 있기 때문에 생략 가능(http://localhost)
		// * 클라이언트에서 서버 대상 전송되는 값 : 쿼리스트링 또는 파라미터
		// 형식 : 주소?키=전달값&키=전달값&키=전달값
		out.println("			location.href='/ServletToddler/join/loginCheck?mem_id=' + mem_id + '&mem_pass='+mem_pass;");
		out.println("			var $frm= $('<form action = \"/ServletToddler/join/loginCheck\" method = \"get\"></form>');");
		out.println("			var $inputID = $('<input type = \"hidden\" value=\"'+mem_id+'\" name = \"mem_id\"/>');");
		out.println("			var $inputPWD = $('<input type = \"hidden\" value=\"'+mem_pass+'\" name = \"mem_pass\"/>');");
		out.println("			$frm.append($inputID);");
		out.println("			$frm.append($inputPWD);");
		out.println("			$(document.body).append($frm);");
		out.println("			$frm.submit();");
		out.println("		});");
		out.println("	});");
		out.println("</script>");
		out.println("</head>");
		out.println("<body>");
		out.println("<table width=" + "'770'" + "border=" + "'0'" + "align="
				+    "'center'" + "cellpadding=" + "'0'" + "cellspacing=" + "'0'"
				+    "style=" + "'margin: 90px;'" + ">");
		out.println ("<tr>");
		out.println("<td height=" + "'150'" + "align=" + "'center'"
				+   "><img src=" + "'/ServletToddler/image/p_login.gif'"
				+    "/></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td height="
				+   "'174'"
				+   "style="
				+    "'background: url(/ServletToddler/image/login_bg.jpg); border: 1px solid #e3e3e3;'"
				+    ">");
		out.println("<table width=" + "'100%'" + "border=" + "'0'"
				+   "cellpadding=" + "'0'" + "cellspacing=" + "'0'" + ">");
		out.println("<tr>");
		out.println("<td width=" + "'260'" + " height=" + "'110'" + "align="
				+   "'center'" + "style=" + "'border-right: 1px dotted #736357;'"
				+   ">");
		out.println("<img src=" + "'/ServletToddler/image/logo.jpg'" + "/>");
		out.println("</td>");
		out.println("<td>");
		out.println("<table border=" + "'0'" + "align=" + "'center'"
				+   "cellpadding=" + "'5'" + "cellspacing=" + "'0'" + ">");
		out.println("<tr>");
		out.println("<td><b>아이디</b></td>");
		out.println("<td><input type=" + "'text'" + "name=" + "'mem_id'"
				+   "class=" + "'box'" + "tabindex=" + "'3'" + "height=" + "'18'"
				+   "/></td>");
		out.println("<td rowspan=" + "'2'" + ">");
		out.println("<img src=" + "'/ServletToddler/image/login.gif'"
				+   "class=" + "'loginBtn'" + "/>");
		out.println("</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td><b>패스워드</b></td>");
		out.println("<td><input type=" + "'password'" + "name=" + "'mem_pass'"
				+   "class=" + "'box'" + "tabindex=" + "'3'" + "height=" + "'18'"
				+   "/></td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<a href='/Servelet/member/memberForm'>회원가입을 원하세요?</a>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");

		out.println("</body>");
		out.println("</html>");
		// doGet이 종료될때 전송됨
	}

}
