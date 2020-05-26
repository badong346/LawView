package lv.backend.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lv.backend.dao.ClientDAO;
import lv.backend.dao.LawyerDAO;
import lv.backend.dto.ClientDTO;
import lv.backend.dto.LawyerDTO;
import lv.backend.encryption.Encryption;

@WebServlet("*.signUp")
public class SignUpController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		
		ClientDAO cdao = new ClientDAO();
		ClientDTO cdto = new ClientDTO();
		LawyerDAO ldao = new LawyerDAO();
		LawyerDTO ldto = new LawyerDTO();
		Encryption enc = new Encryption();
		
		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String cmd = requestURI.substring(contextPath.length());
		
		try {
//			if(cmd.contentEquals("/signUpSelect.signUp")) {
//				String selectResult = request.getParameter("signUpSelectB");
//				if(selectResult.contentEquals("의뢰인 회원가입")) {
//					response.sendRedirect("clientSignUp.jsp");
//				}else if(selectResult.contentEquals("변호사 회원가입")) {
//					response.sendRedirect("lawyerSignUp.jsp");
//				}
//			}else 
			
				//의뢰자 회원가입 입력
				if(cmd.contentEquals("/clientSignUp.signUp")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String birth = request.getParameter("birth");
				
				String pwEnc = enc.getSHA512(pw);
				cdao.clientInsert(id, pwEnc, name, email, phone, birth);
				response.sendRedirect("success.jsp");
			}else if(cmd.contentEquals("/idDuplCheck.signUp")) {
				//의뢰자 id중복체크
				String available;
				String id = request.getParameter("id");
				System.out.println(id);
				if(ldao.isIdAvailable(id) && cdao.isIdAvailable(id)) {
					available = "nouse";
				}else {available = "use";}
				
//				boolean result = ldao.isIdAvailable(id);
//				if(result == true) {
//					available = "nouse";
//				}else {available = "use";}
				
				response.getWriter().append(available);
			}else if(cmd.contentEquals("/lawyerSignUp.signUp")) {
				//변호사 회원가입 입력
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String office_name = request.getParameter("office_name");
				String office_phone = request.getParameter("office_phone");
				String office_zipcode = request.getParameter("office_zipcode");
				String office_addr1 = request.getParameter("office_addr1");
				String office_addr2 = request.getParameter("office_addr2");
				String test = request.getParameter("test");
				String test_num = request.getParameter("test_num");
				String gender = request.getParameter("gender");
				String birth = request.getParameter("birth");
				//System.out.println(id+pw+name+email+phone+office_name+office_phone+office_zipcode+office_addr1+office_addr2+test+test_num+gender+birth);
				
				String pwEnc = enc.getSHA512(pw);
				ldao.lawyerInsert(id, pwEnc, name, email, phone, office_name, office_phone, office_zipcode, office_addr1, office_addr2, test, test_num, gender, birth);
				response.sendRedirect("main.jsp");
			}else if(cmd.contentEquals("/lawyerIdDuplCheck.signUp")) {
				//id 중복체크
				String available;
				String id = request.getParameter("id");
				System.out.println(id);
				
				if(ldao.isIdAvailable(id) && cdao.isIdAvailable(id)) {
					available = "nouse";
				}else {available = "use";}
//				boolean result = ldao.isIdAvailable(id);
//				result = cdao.isIdAvailable(id);
//				if(result == true) {
//					available = "nouse";
//				}else {available = "use";}
				response.getWriter().append(available);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
