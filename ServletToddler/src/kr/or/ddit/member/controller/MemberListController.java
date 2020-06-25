package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest reuqest, HttpServletResponse response)
			throws ServletException, IOException {
		IMemberService service = IMemberServiceImpl.getInstance();
		List<MemberVO> memberList = service.memberList();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html>                             ");
		out.println("<html>                                      ");
		out.println("<head>                                      ");
		out.println("<meta charset='UTF-8'>                      ");
		out.println("<script type ='text/javascript' src = 'http://code.jquery.com/jquery-latest.js'></script>");
		out.println("<script type = 'text/javascript'>");
		out.println("$(function(){");
		out.println(" 		$('table tr:gt(0)').click(function(){");
		out.println("  			var mem_id = $(this).find('td:eq(0)').text();");
		out.println(" 			location.href='/ServletToddler/member/memberView?mem_id=' +mem_id"); 
		out.println(" 			})");
		
		out.println("})");
		out.println("</script>");
		out.println("<title>Insert title here</title>            ");
		out.println("</head>                                     ");
		out.println("<body>                                      ");
		out.println("<table>                                     ");
		out.println("   <thead>                                  ");
		out.println("      <tr>                                  ");
		out.println("         <th>아이디</th>                       ");
		out.println("         <th>성명</th>                        ");
		out.println("         <th>주민등록번호1</th>                   ");
		out.println("         <th>직업</th>                        ");
		out.println("         <th>취미</th>                        ");
		out.println("      </tr>                                 ");
		out.println("   </thead>                                 ");
		out.println("   <tbody>                                  ");
		for(MemberVO memberInfo: memberList){
			out.println(" 		<tr>");
			out.println("         <td>" + memberInfo.getMem_id() + "</td>");
			out.println("         <td>" + memberInfo.getMem_name() + "</td>                          ");
			out.println("         <td>" + memberInfo.getMem_regno1() + "</td>                          ");
			out.println("         <td>" + memberInfo.getMem_job() + "</td>                          ");
			out.println("         <td>" + memberInfo.getMem_like() + "</td>                          ");
			out.println("      </tr>                                 ");
		}
		out.println("   </tbody>                                 ");
		out.println("</table>                                    ");
		out.println("</body>                                     ");
		out.println("</html>                                     ");
	}

}
