package lv.backend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lv.backend.dao.ClientDAO;
import lv.backend.dto.ClientDTO;
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
		



		try {
			if(cmd.contentEquals("/clientSignUp.login")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String birth = request.getParameter("birth");
				
				String pwEnc = enc.getSHA512(pw);
				cdao.clientInsert(id, pwEnc, name, email, phone, birth);
				response.sendRedirect("login.jsp");
				
			}else if(cmd.contentEquals("/idDuplCheck.login")) {
				String available;
				String id = request.getParameter("id");
				System.out.println(id);
				boolean result = cdao.isIdAvailable(id);
				if(result == true) {
					available = "nouse";
				}else {available = "use";}
				response.getWriter().append(available);
				
			}else if (cmd.contentEquals("/login.login")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				boolean result;
				result = cdao.loginSuccessful(id, enc.getSHA512(pw));
				
				if (result) {
					System.out.println("로그인 성공!");
					response.sendRedirect("main.jsp");
					
				}else {
				
				response.sendRedirect("login.jsp");
		
				}	

	
			}else if(cmd.contentEquals("/signUp.login")) {
				response.sendRedirect("clientSignUp.jsp");
				
			}else if(cmd.contentEquals("/lawsignUp.login")) {
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
