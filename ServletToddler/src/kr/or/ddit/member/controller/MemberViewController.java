package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// SerlvetToddler/member/memberView?mem_id=a001
		String mem_id = request.getParameter("mem_id");

		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		// 쿼리스트링을 취득하는 메소드 4가지
		// 1. getParameter(key값);
		// 2.
		// 3.
		// 4.
		IMemberService service = IMemberServiceImpl.getInstance();
		MemberVO memberInfo = service.memberInfo(params);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html>																");
		out.println("<html>                                                                         ");
		out.println("<head>                                                                         ");
		out.println("<meta charset='UTF-8'>                                                         ");
		out.println("<title>Insert title here</title>                                               ");
		out.println("<script type ='text/javascript' src = 'http://code.jquery.com/jquery-latest.js'></script>");
		out.println("<script type = 'text/javascript'>");
		out.println("	$(function(){");
		out.println("		$('input[value=회원목록]').click(function(){");
		out.println("			$(location).attr('href','/ServletToddler/member/memberList')");
		out.println("		})");

		out.println("		$('input[value=탈퇴]').click(function(){");
		out.println("			$(location).attr('href','/ServletToddler/member/deleteMemberInfo?mem_id="
				          + memberInfo.getMem_id() + "')");
		out.println("		})");
		out.println("		$('form').submit(function(){");
		out.println("			var mem_pass = $('input[name=mem_pass]').val();");
		out.println("			if(!mem_pass.validationPWD()){");
		out.println("				alert('비밀번호를 바르게 입력해주세요.');");
		out.println("				return false;");
		out.println("			}");
		out.println("			var mem_hometel = $('input[name=mem_hometel]').val();");
		out.println("			if(!mem_hometel.validationHOMETEL()){");
		out.println("				alert('집전화번호를 바르게 입력해주세요.');");
		out.println("				return false;");
		out.println("			}");
		out.println("			var mem_comtel = $('input[name=mem_comtel]').val();");
		out.println("			if(!mem_comtel.validationCOMTEL()){");
		out.println("				alert('회사전화번호를 바르게 입력해주세요.');");
		out.println("				return false;");
		out.println("			}");
		out.println("			var mem_hp = $('input[name=mem_hp]').val();");
		out.println("			if(!mem_hp.validationHP()){");
		out.println("				alert('휴대폰전화번호를 바르게 입력해주세요.');");
		out.println("				return false;");
		out.println("			}");
		out.println("			var mem_mail = $('input[name=mem_mail]').val();");
		out.println("			if(!mem_mail.validationMAIL()){");
		out.println("				alert('이메일을 바르게 입력해주세요.');");
		out.println("				return false;");
		out.println("			}");
		out.println("			return true;");
		out.println("		});");
		out.println("	})");
		out.println("</script>");
		out.println("</head>                                                                        ");
		out.println("<body>                                                                         ");
		out.println("<form action='/ServletToddler/member/updateMemberInfo' method = 'post'>                                                               ");
		out.println("	<table>                                                                     ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>아이디</td>                                                        ");
		out.println("			<td><input type='text' name='mem_id' value='"
				+ memberInfo.getMem_id() + "'disabled='disabled'/></td>     ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>패스워드</td>                                                       ");
		out.println("			<td><input type='text' name='mem_pass' value='"
				+ memberInfo.getMem_pass() + "'/></td>                      ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>이름</td>                                                         ");
		out.println("			<td><input type='text' name='mem_name' value='"
				+ memberInfo.getMem_name() + "'disabled='disabled'/></td>   ");
		out.println("		</tr>                                                                   ");
		// disabled='disabled' 선언이 되면 값 출력 가능. Form의 태그 Submit시(서버 요청 간) 서버 대상
		// 전송 배제
		// Form의 태그 Submit시 서버 대상 전송됨.
		out.println("		<tr>                                                                    ");
		out.println("			<td>주민등록번호</td>                                                     ");
		out.println("			<td>                                                                ");
		out.println("				<input type='text' name='mem_regno1' value='"
				+ memberInfo.getMem_regno1() + "'disabled='disabled' />     ");
		out.println("				<input type='text' name='mem_regno2' value='"
				+ memberInfo.getMem_regno2() + "'disabled='disabled'/>      ");
		out.println("			</td>                                                               ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>주소</td>                                                         ");
		out.println("			<td>                                                                ");
		out.println("				<input type='text' name='mem_add1' value='"
				+ memberInfo.getMem_add1() + "' />                           ");
		out.println("				<input type='text' name='mem_add2'value='"
				+ memberInfo.getMem_add2() + "' />                           ");
		out.println("			</td>                                                               ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>집전화번호</td>                                                      ");
		out.println("			<td><input type='text' name='mem_hometel' value='"
				+ memberInfo.getMem_hometel() + "' /></td>                   ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>회사전화번호</td>                                                     ");
		out.println("			<td><input type='text' name='mem_comtel'value='"
				+ memberInfo.getMem_comtel() + "' /></td>                    ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>휴대폰번호</td>                                                      ");
		out.println("			<td><input type='text' name='mem_hp' value='"
				+ memberInfo.getMem_hp() + "'/></td>                        ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>이메일</td>                                                        ");
		out.println("			<td><input type='text' name='mem_mail' value='"
				+ memberInfo.getMem_mail() + "'/></td>                      ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>직업</td>                                                         ");
		out.println("			<td><input type='text' name='mem_job' value='"
				+ memberInfo.getMem_job() + "'/></td>                       ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td>취미</td>                                                         ");
		out.println("			<td><input type='text' name='mem_like' value='"
				+ memberInfo.getMem_like() + "'/></td>                      ");
		out.println("		</tr>                                                                   ");
		out.println("		<tr>                                                                    ");
		out.println("			<td colspan='2'>                                                    ");
		out.println("				<input type='submit' value='수정' />                              ");
		out.println("				<input type='button' value='탈퇴' />                              ");
		out.println("				<input type='reset' value='취소' />                               ");
		out.println("				<input type='button' value='회원목록' />			                ");
		out.println("			</td>                                                               ");
		out.println("		</tr>                                                                   ");
		out.println("	</table>                                                                    ");
		out.println("</form>                                                                        ");
		out.println("</body>                                                                        ");
		out.println("</html>                                                                        ");
	}

}
