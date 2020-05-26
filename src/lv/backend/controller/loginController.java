package lv.backend.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import lv.backend.dao.ClientDAO;
import lv.backend.dao.LawyerDAO;
import lv.backend.dto.ClientDTO;
import lv.backend.dto.LawyerDTO;
import lv.backend.encryption.Encryption;


@WebServlet("*.login")
public class loginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");

		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String cmd = requestURI.substring(contextPath.length());
		System.out.println(cmd);
		Encryption enc = new Encryption();
		ClientDAO cdao = new ClientDAO();
		ClientDTO cdto = new ClientDTO();
		LawyerDAO ldao = new LawyerDAO();

		try {
			if(cmd.contentEquals("/clientSignUp.login")) { // 의뢰인 회원가입 
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String birth = request.getParameter("birth");

				String pwEnc = enc.getSHA512(pw);
				cdao.clientInsert(id, pwEnc, name, email, phone, birth);
				response.sendRedirect("login.jsp");

			}else if(cmd.contentEquals("/idDuplCheck.login")) { // 아이디 중복체크
				String available;
				String id = request.getParameter("id");
				System.out.println("idDuplCheck.login : "+id);
				boolean result = cdao.isIdAvailable(id);
				if(result == true) {
					available = "nouse";
				}else {available = "use";}
				response.getWriter().append(available);

			}else if (cmd.contentEquals("/clientlogin.login")) { // 로그인
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				boolean result;
				result = cdao.loginSuccessful(id, enc.getSHA512(pw));
				if (result) {
					request.getSession().setAttribute("clientInfo", id); // 의뢰인 아이디 세션 저장
					System.out.println("clientlogin.login ok");
					response.sendRedirect("main.jsp");
				}else {
					response.sendRedirect("login.jsp");
				}
			}else if (cmd.contentEquals("/lawyerlogin.login")) {
				String id = request.getParameter("law_id");
				String pw = request.getParameter("law_pw");
				String pwEnc =  enc.getSHA512(pw);
				System.out.println(pwEnc);
				boolean result;
				result = ldao.lawyerlogin(id, enc.getSHA512(pw));

				System.out.println(result);
				if (result) {
					System.out.println("ok");
					request.getSession().setAttribute("lawyerInfo", id);
					response.sendRedirect("main.jsp");

				}else {

					response.sendRedirect("login.jsp");

				}
			}else if(cmd.contentEquals("/logout.login")){
				// 세션에 저장되어 있는 모든 정보를 날리기
				// 접속한 사용자의 모든 정보 날리기
				request.getSession().invalidate();
				response.sendRedirect("main.jsp");
			}else if(cmd.contentEquals("/signUp.login")) { // 의뢰자 회원가입
				response.sendRedirect("clientSignUp.jsp");

			}else if(cmd.contentEquals("/lawsignUp.login")) { // 변호사 회원가입
				response.sendRedirect("lawyerSignUp.jsp");

			}


		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
