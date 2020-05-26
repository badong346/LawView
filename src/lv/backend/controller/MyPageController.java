package lv.backend.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lv.backend.dao.ClientDAO;
import lv.backend.dao.LawyerDAO;
import lv.backend.dto.ClientDTO;
import lv.backend.dto.LawyerDTO;
import lv.backend.dto.RequestDTO;
import lv.backend.encryption.Encryption;

@WebServlet("*.mypage")
public class MyPageController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");

		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String cmd = requestURI.substring(contextPath.length());

		ClientDAO cdao = new ClientDAO();
		ClientDTO cdto = new ClientDTO();
		LawyerDAO ldao = new LawyerDAO();
		LawyerDTO ldto = new LawyerDTO();
		Encryption enc = new Encryption();

		try {
			//의뢰인인지 변호사인지 확인
			if(cmd.contentEquals("/go.mypage")) {
				String clientId = (String)request.getSession().getAttribute("clientInfo");
				String lawyerID = (String)request.getSession().getAttribute("lawyerInfo");
				if(!cdao.isIdAvailable(clientId)) {
					response.sendRedirect("client.mypage");
				}else if(!ldao.isIdAvailable(lawyerID)){
					response.sendRedirect("lawyer.mypage");
				}

			}else if(cmd.contentEquals("/client.mypage")) {
				//클라이언트의 정보 송신
				String id = (String)request.getSession().getAttribute("clientInfo");
				cdto = cdao.cSelect(id);
				List<RequestDTO> clist = cdao.selectClientlist(id);
				request.setAttribute("cdto", cdto);
				request.setAttribute("clist", clist);
				RequestDispatcher rd = request.getRequestDispatcher("clientMyPage.jsp");
				rd.forward(request, response);
			}else if(cmd.contentEquals("/lawyer.mypage")) {
				//변호사의 정보송신
				String id = (String)request.getSession().getAttribute("lawyerInfo");
				ldto = ldao.lSelect(id);
				List<RequestDTO> lList = ldao.selectClientlist(id);
				request.setAttribute("ldto", ldto);
				request.setAttribute("lList", lList);
				RequestDispatcher rd = request.getRequestDispatcher("lawyerMyPage.jsp");
				rd.forward(request, response);
			}else if(cmd.contentEquals("/lawyerModidel.mypage")) {
				//변호사 정보수정 or 회원탈퇴 기능 선택
				String model = request.getParameter("modi_del");
				if(model.contentEquals("정보수정 완료")) {
					response.sendRedirect("lawyerModify.mypage");
				}else if(model.contentEquals("회원탈퇴")) {
					response.sendRedirect("lawyerDelete.mypage");
				}
			}else if(cmd.contentEquals("/clientModidel.mypage")) {
				//클라이언트 정보수정 or 회원탈퇴 기능 선택
				String model = request.getParameter("modi_del");
				if(model.contentEquals("정보수정 완료")) {
					response.sendRedirect("clientModify.mypage");
				}else if(model.contentEquals("회원탈퇴")) {
					response.sendRedirect("clientDelete.mypage");
				}
			}

			else if(cmd.contentEquals("/lawyerModify.mypage")) {
				//변호사 정보수정
				String id = (String)request.getSession().getAttribute("lawyerInfo");
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
				String pwEnc = enc.getSHA512(pw);
				ldao.lawModify(id, pwEnc, name, email, phone, office_name, office_phone, office_zipcode, office_addr1, office_addr2, test, test_num, gender, birth);
				response.sendRedirect("lawyer.mypage");
			}else if(cmd.contentEquals("/clientModify.mypage")) {
				//클라이언트 정보 수정
				String id = (String)request.getSession().getAttribute("clientInfo");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String birth = request.getParameter("birth");
				String pwEnc = enc.getSHA512(pw);

				cdao.clientModify(id, pwEnc, name, email, phone, birth);
				response.sendRedirect("client.mypage");
			}else if(cmd.contentEquals("/lawyerDelete.mypage")) {
				//변호사 회원탈퇴
				String id = (String)request.getSession().getAttribute("lawyerInfo");
				ldao.lawDelete(id);
				response.sendRedirect("login.jsp");
			}else if(cmd.contentEquals("/clientDelete.mypage")) {
				//클라이언트 회원탈퇴

				String id = (String)request.getSession().getAttribute("clientInfo");
				cdao.clientDelete(id);

				response.sendRedirect("login.jsp");
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
