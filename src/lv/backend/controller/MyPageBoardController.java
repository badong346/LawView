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


@WebServlet("/MyPageBoardController")
public class MyPageBoardController extends HttpServlet {
	
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
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
